# Define the source and destination directories

#Local path
$dir1 = "$env:USERPROFILE\Documents\NinjaTrader 8\Workspaces"

# OneDrive path
$dir2 = "$env:USERPROFILE\OneDrive\Documents\NT8BackUp\Workspaces"

# Use robocopy to bring changes on OneDrive to the local folder
robocopy $dir2 $dir1 

# Then move changes on the local folder to the OneDrive folder
robocopy $dir1 $dir2