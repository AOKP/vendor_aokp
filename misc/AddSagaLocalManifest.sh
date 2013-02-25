#!/bin/bash

clear
echo "Adding saga files to local manifests..."
cd ../../../
mkdir .repo/local_manifests/
cp vendor/aokp/misc/saga_local_manifest.xml .repo/local_manifests/saga.xml
echo "Done!"


