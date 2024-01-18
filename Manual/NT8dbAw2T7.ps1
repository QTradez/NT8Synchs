# 
# Copy files and folders from the NT8 shared backup to the local NT 8 folder.
#
# This is a little tricky because we want chagnes from systems to update the cloud folder and changes from
# other systems to come through the cloud folder.  We use a tool called watchman to monitor for changes and
# replicate those changes.
#
# This script will also preseve the OneDrive free up space state.
#

# Local paths
$localPaths = @(
    "$env:USERPROFILE\Documents\NinjaTrader 8\db\day",
    "$env:USERPROFILE\Documents\NinjaTrader 8\db\minute"#,
    #"$env:USERPROFILE\Documents\NinjaTrader 8\db\replay",
    #"$env:USERPROFILE\Documents\NinjaTrader 8\db\tick"
)

# OneDrive paths
$netDrivePaths = @(
    "\\Dgl-w-000000093\c\Users\daqu4\OneDrive\Documents\NT8BackUp\db\day",
    "\\Dgl-w-000000093\c\Users\daqu4\OneDrive\Documents\NT8BackUp\db\minute"#,
    #"\\Dgl-w-000000093\c\Users\daqu4\OneDrive\Documents\NT8BackUp\db\replay"
    #"\\Dgl-w-000000093\c\Users\daqu4\OneDrive\Documents\NT8BackUp\db\tick"
)

# Ensure that both arrays have the same length
if ($localPaths.Length -ne $netDrivePaths.Length) {
    Write-Error "The number of local paths and netDrive paths must be the same."
    exit 1
}

# Loop over the arrays and execute the robocopy command for each pair of paths
for ($i = 0; $i -lt $localPaths.Length; $i++) {
    $localPath = $localPaths[$i]
    $netDrivePath = $netDrivePaths[$i]

    # Copy new and updated files from the local path to the OneDrive path
    robocopy $localPath $netDrivePath /e /XO

    # Copy files that exist only in the OneDrive path to the local path
    robocopy $netDrivePath $localPath /e /XO /XL
}