# 
# Copy files and folders from the NT8 shared backup to the local NT 8 folder.
#
# This is a little tricky because we want chagnes from systems to update the cloud folder and changes from
# other systems to come through the cloud folder.  We use a tool called watchman to monitor for changes and
# replicate those changes.
#
# This script will also preseve the OneDrive free up space state.
#


#Local path
$dir1 = "$env:USERPROFILE\Documents\NinjaTrader 8\AwNT8TestFolder"

# OneDrive path
$dir2 = "$env:USERPROFILE\OneDrive\Documents\NT8BackUp\AwNT8TestFolder"

# Create two PowerShell scripts for the robocopy commands
$copyToCloudScript = "$env:TEMP\copyToCloud.ps1"
$copyToLocalScript = "$env:TEMP\copyToLocal.ps1"

# Write the robocopy commands to the script files
Set-Content -Path $copyToCloudScript -Value "robocopy $dir1 $dir2 /e /purge"
Set-Content -Path $copyToLocalScript -Value "robocopy $dir2 $dir1 /e /XO /XL"

# Watch the local directory and run the copyToCloud script when a change is detected
Invoke-Expression "watchman watch $dir1"
Invoke-Expression "watchman -- trigger $dir1 update-cloud '**/*' -- powershell.exe -File $copyToCloudScript"

# Watch the OneDrive directory and run the copyToLocal script when a change is detected
Invoke-Expression "watchman watch $dir2"
Invoke-Expression "watchman -- trigger $dir2 update-local '**/*' -- powershell.exe -File $copyToLocalScript"

# Check if the OneDrive path exists
if (Test-Path $dir2 ) {
    # Change the attributes of the files to make them online-only
    attrib -p +u /s /d "$dir2\*"
}
