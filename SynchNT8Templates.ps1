# 
# Copy files and folders from the NT8 shared backup to the local NT 8 folder.
#
# We only want new files from OneDrive.  Any files and folder deleted on the local system will be deleted
# from OneDrive.  Any updated or new files in OneDrive will be copied to the local system and any new files
# or folders on the local will be copied to OneDrive.
#
# This script will also preseve the OneDrive free up space state.
#


# Define the source and destination directories

#Local path
$dir1 = "$env:USERPROFILE\Documents\NinjaTrader 8\templates"

# OneDrive path
$dir2 = "$env:USERPROFILE\OneDrive\Documents\NT8BackUp\templates"

# Use robocopy to bring changes on OneDrive to the local folder
robocopy $dir2 $dir1 /e /XO /XL

# Then move changes on the local folder to the OneDrive folder
robocopy $dir1 $dir2 /e /purge