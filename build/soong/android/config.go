package android

// Global config used by Aokp soong additions
var AokpConfig = struct {
	// List of packages that are permitted
	// for java source overlays.
	JavaSourceOverlayModuleWhitelist []string
}{
	// JavaSourceOverlayModuleWhitelist
	[]string{
		"org.lineageos.hardware",
	},
}
