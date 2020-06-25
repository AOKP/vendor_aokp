#!/usr/bin/python

# For retrieving gerrit changes:
#
# ssh <host> gerrit query --format=JSON --current-patch-set <id>
# This returns zero or more lines of JSON followed by a stats line (type:stats)
# Example:
#   review.lineageos.org I1101cb204ab583a204447d63e6a031a17179dfe7
#
# http://host/changes/?q=<id>
# This returns same as above, except the inital line is ")]}'"
#
# The ref can be constructed as:
#   - Directly in the JSON attribute "ref".
#   - "refs/changes/ch/cn/rev
#     Where ch=change_hash, cn=change_num, rev=revision
#
# Fetching changes:
# $ git fetch 'https://review.lineageos.org/LineageOS/android_vendor_lineage' 'refs/changes/70/226470/1'
# $ git fetch 'https://github.com/LineageOS/android_vendor_lineage' 'refs/changes/70/226470/1'


import os
import sys
import getopt
import subprocess
import urlparse
import json
from xml.etree import ElementTree

cfg = dict()
cfg['help'] = False
cfg['nodo'] = False
cfg['remote'] = None
cfg['verbose'] = 0

cur_dir = os.getcwd()
repo_dir = None
repo_url = None

def verbose(s):
    if cfg['verbose'] > 0:
        sys.stdout.write(s)

def die(msg):
    sys.stderr.write("%s\n" % (msg))
    sys.exit(1)

def usage():
    print "Usage: ..."
    sys.exit(1)

def sys_exec(args):
    verbose("exec: %s\n" % (args))
    child = subprocess.Popen(args, stdin=None, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out, err = child.communicate()
    if child.returncode != 0:
        raise RuntimeError("Command failed: %s" % (" ".join(args)))
    return out.rstrip().split('\n')

def repo_get_dir():
    dir = os.getcwd()
    while not os.path.exists("%s/.repo" % (dir)):
        dir = os.path.realpath("%s/.." % (dir))
        if dir == '/':
            raise OSError(2, 'No such file or directory', dir)
    return dir

def repo_get_url():
    args = []
    args.append('git')
    args.append('-C')
    args.append("%s/.repo/manifests" % (repo_dir))
    args.append('remote')
    args.append('-v')
    child = subprocess.Popen(args, stdin=None, stdout=subprocess.PIPE, stderr=None)
    out, err = child.communicate()
    if child.returncode != 0:
        raise RuntimeError('git failed')
    lines = out.split('\n')
    return lines[0].split()[1]

# Translate a possibly relative host or URL:
#  - http://host => http://host
#  - ".." => relative to repo_url
#  - http://host
def repo_translate_url(val):
    pos = val.find(':')
    if pos != -1:
        return val
    pos = val.find('..')
    if pos != -1:
        return urlparse.urljoin(repo_url, val)
    return 'http://%s/' % (val)

def xml_read_file(filename):
    f = open(filename)
    data = f.read()
    f.close()
    return ElementTree.fromstring(data)

def repo_manifest_read(manifest_filename):
    projects = dict()
    root = xml_read_file(manifest_filename)

    # Find default attributes
    defaults = dict()
    for elem in root.findall('default'):
        for k in ['remote', 'revision', 'upstream-remote', 'upstream-name']:
            v = elem.get(k)
            defaults[k] = v

    # Populate remotes
    remotes = dict()
    for elem in root.findall('remote'):
        name = elem.get('name')
        remotes[name] = dict()
        for k in ['fetch', 'review', 'revision', 'upstream-remote', 'upstream-name']:
            v = elem.get(k)
            if v is None:
                v = defaults.get(k)
            remotes[name][k] = v

    # Populate projects
    for elem in root.findall('project'):
        name = elem.get('name')
        project = dict()
        project['name'] = name

        # Get path, default to name
        v = elem.get('path')
        if v is None:
            v = name
        project['path'] = v

        # Get remote with default (required)
        v = elem.get('remote')
        if v is None:
            if not 'remote' in defaults:
                die("Cannot get remote for %s" % (name))
            v = defaults['remote']
        if not v in remotes:
            die("Remote %s not found" % (v))
        project['remote'] = v
        remote = remotes[v]

        # Get revision, with default (required)
        v = elem.get('revision')
        if v is None:
            v = remote['revision']
        if v is None:
            v = defaults['revision']
        if v is None:
            die("Revision not specified for %s" % (name))
        # Trim "refs/heads/"
        if v.startswith('refs/heads/'):
            v = v[11:]
        project['revision'] = v

        # Get upstream values with defaults (optional)
        for k in ['upstream-remote', 'upstream-name']:
            v = elem.get(k)
            if v is None:
                v = remote[k]
            if v is None:
                v = defaults[k]
            if not v is None:
                # Handle printf-like substitutions
                if v.find('%P') != -1:
                    u_path = project['path'].replace('/', '_')
                    v = v.replace('%P', u_path)
            project[k] = v

        # Synthesize fetch-url
        v = remote['fetch']
        project['fetch-url'] = urlparse.urljoin(repo_translate_url(v), project['name'])

        # Synthesize review-url
        v = remote['review']
        if v:
            project['review-url'] = repo_translate_url(v)

        # Get upstream remote and set upstream fetch url (optional)
        v = project['upstream-remote']
        if v is None:
            v = remote['upstream-remote']
        if v is None:
            v = defaults['upstream-remote']
        if not v is None:
            if not v in remotes:
                die("Remote %s not found" % (v))
            upstream_remote = remotes[v]
            v = upstream_remote['fetch']
            project['upstream-fetch-url'] = urlparse.urljoin(repo_translate_url(v), project['upstream-name'])
            v = upstream_remote['revision']
            if not v is None:
                # Trim "refs/heads/"
                if v.startswith('refs/heads/'):
                    v = v[11:]
                project['upstream-revision'] = v

        projects[name] = project

    return projects

def repo_project_by_path(projects, path):
    for name in projects:
        project = projects[name]
        if project['path'] == path:
            return project
    return None

def git_exec(path, args):
    gitargs = ['git', '-C', path]
    gitargs.extend(args)
    return sys_exec(gitargs)

def git_remote_ls(path):
    remotes = dict()
    for line in git_exec(path, ['remote', '-v']):
        fields = line.split()
        if len(fields) < 2:
            raise RuntimeError("git remote parse failed")
        k = fields[0]
        v = fields[1]
        remotes[k] = v
    return remotes

def git_remote_add(path, name, url):
    git_exec(path, ['remote', 'add', name, url])

def git_remote_rm(path, name):
    git_exec(path, ['remote', 'rm', name])

def git_checkout(path, revision):
    git_exec(path, ['checkout', revision])

def git_branch_delete(path, name):
    git_exec(path, ['branch', '--delete', '--force', name])

def git_branch_create(path, name):
    git_exec(path, ['checkout', '-b', name])

def git_cherry_pick(path, hash, merge):
    if merge:
        git_exec(path, ['cherry-pick', '-m', '1', '--allow-empty', hash])
    else:
        git_exec(path, ['cherry-pick', hash])

def git_cherry_pick_abort(path):
    git_exec(path, ['cherry-pick', '--abort'])

def git_log_hash(path, head):
    hashess = []
    for line in git_exec(path, ['log', '--oneline', head]):
        fields = line.split()
        if len(fields) < 2:
            raise RuntimeError("git log parse failed")
        hashes.append(fields[0])
    return hashes

def git_fetch(path, remote, branch):
    git_exec(path, ['fetch', remote, branch])

def git_commit_fetch(path, commit):
    # Use %p in format to get parent hashes.
    # If there are multiple parents, it is a merge.
    lines = git_exec(path, ['log', '-n', '1', '--pretty=format:%H%n%P%n%s%n%b', commit])
    if len(lines) < 3:
        raise RuntimeError("git log parse failed")
    commit = dict()
    commit['hash'] = lines[0]
    commit['parents'] = lines[1].split()
    commit['merge'] = (len(commit['parents']) > 1)
    commit['title'] = lines[2]
    commit['body'] = lines[3:]
    for line in commit['body']:
        fields = line.split()
        if len(fields) == 2 and fields[0] == 'Change-Id:':
            commit['id'] = fields[1]
            # Do not break here, we want the last id
    return commit

def gerrit_change_props(host, id, branch):
    args = ['ssh', host, 'gerrit', 'query', '--format=JSON', '--current-patch-set', id]
    verbose("Attempting to fetch change props: cmd=\"%s\"\n" % (" ".join(args)))
    child = subprocess.Popen(args, stdin=None, stdout=subprocess.PIPE, stderr=None)
    out, err = child.communicate()
    if child.returncode != 0:
        sys.stderr.write('Failed to read manifest\n')
        sys.exit(1)
    lines = out.rstrip('\n').split('\n')
    for line in lines:
        props = json.loads(line)
        if not 'branch' in props:
            continue
        if props['branch'] == branch:
            if cfg['verbose']:
                for k in props:
                    verbose('props[%s]=%s\n' % (k, props[k]))
            return props
    raise RuntimeError("Cannot find change on gerrit")

def gerrit_upload(host, path, r_path, r_branch):
    args = ['push', "ssh://%s/%s" % (host, r_path), "HEAD:refs/for/%s" % (r_branch)]
    verbose("Attempting to push to gerrit: cmd=\"%s\"\n" % (" ".join(args)))
    git_exec(path, args)

def harvest_commits(project):
    path = project['path']
    name = project['name']
    review_url = project['review-url']
    review_host = urlparse.urlsplit(review_url).netloc

    remotes = git_remote_ls(path)
    if not 'upstream' in remotes:
        git_remote_add(path, 'upstream', project['upstream-fetch-url'])

    u_remote = 'upstream'
    u_revision = project['upstream-revision']
    git_fetch(path, u_remote, u_revision)
    u_commit = 'upstream/%s' % (u_revision)

    d_remote = project['remote']
    d_revision = project['revision']
    git_fetch(path, d_remote, d_revision)
    d_commit = '%s/%s' % (d_remote, d_revision)

    d_idx = 0
    d_log = []
    d_cid = dict()

    u_idx = 0
    u_log = []
    u_cid = dict()

    # Find the last commit that we have picked.
    found = False
    nr_to_pick = 0
    while not found:
        fetched = 0
        try:
            commit = git_commit_fetch(path, "%s~%d" % (d_commit, d_idx))
            id = commit['id']
            d_log.append(commit)
            d_cid[id] = commit
            d_idx += 1
            fetched += 1
        except RuntimeError:
            pass
        try:
            commit = git_commit_fetch(path, "%s~%d" % (u_commit, u_idx))
            id = commit['id']
            u_log.append(commit)
            u_cid[id] = commit
            u_idx += 1
            fetched += 1
        except RuntimeError:
            pass
        if fetched == 0:
            raise RuntimeError("Cannot find common base change")

        idx = 0
        while idx < len(u_log) and not found:
            commit = u_log[idx]
            id = commit['id']
            if id in d_cid:
                found = True
                nr_to_pick = idx
            idx += 1

    if nr_to_pick == 0:
        print "%s: Downstream up to date" % (path)
        return

    # Create a harvest branch starting at current downstream HEAD
    git_checkout(path, d_revision)
    try:
        git_branch_delete(path, 'harvest')
    except RuntimeError:
        pass
    git_branch_create(path, 'harvest')

    all_on_gerrit = True

    idx = nr_to_pick
    while idx > 0:
        idx -= 1
        commit = u_log[idx]
        print "%s: Pick commit-id %s" % (path, commit['id'])

        if all_on_gerrit:
            try:
                # XXX: use review from main manifest
                props = gerrit_change_props(review_host, commit['id'], d_revision)
                print "  ... found on gerrit" # git_pick_change(props)
            except RuntimeError:
                print "  ... not on gerrit"
                all_on_gerrit = False

        if not all_on_gerrit:
            try:
                git_cherry_pick(path, commit['hash'], commit['merge'])
            except RuntimeError:
                git_cherry_pick_abort(path)
                print "%s: Failed to pick %s" % (path, commit['id'])
                return

    if not cfg['nodo'] and not all_on_gerrit:
        print "*** push to gerrit ***"
        gerrit_upload(review_host, path, name, d_revision)

def usage():
    print "Usage: harvest [args] [paths]"
    print "  --remote   Use specified remote"
    print "  --verbose  Increase verbose level"
    sys.exit(1)

optargs, argv = getopt.getopt(sys.argv[1:], 'hnv',
        ['help', 'nodo', 'remote=', 'verbose'])
for k, v in optargs:
    if k in ('-n', '--nodo'):
        cfg['nodo'] = True
    if k in ('-h', '--help'):
        cfg['help'] = True
    if k in ('--remote'):
        cfg['remote'] = v
    if k in ('-v', '--verbose'):
        cfg['verbose'] += 1

if cfg['help']:
    usage()

paths = argv

try:
    repo_dir = repo_get_dir()
except OSError:
    sys.stderr.write("Cannot find repo top\n");
    sys.exit(1);
if repo_dir != cur_dir:
    sys.stderr.write("Must be run from repo top\n")
    sys.exit(1)

try:
    repo_url = repo_get_url()
except OSError:
    sys.stderr.write("Cannot find repo url\n");
    sys.exit(1);

manifest_file = ".repo/manifests/default.xml"
projects = repo_manifest_read(manifest_file)
if not paths:
    for name in projects:
        project = projects[name]
        if project['remote'] != 'aokp':
            continue
        if not project['upstream-name']:
            continue
        paths.append(project['path'])
verbose("paths=%s\n" % (paths))
for path in paths:
    project = repo_project_by_path(projects, path)
    verbose("Project: %s" % (project['name']))
    #verbose("Project: %s\n" % (project))
    harvest_commits(project)
