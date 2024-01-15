# PowerShell scripts for synchronizing NinjaTrader 8 files to all of your NT 8 instances.

With NT 8 running under Windows, we've all experienced the problems that NT and OneDrive have.  This is tragic as it would otherwise provide
a seamless way to get files both backed up offsite and changes applied to other systems running NT.

These scripts provide synchronization for adding new data to the cloud location and pulling that same data to other systems to use almost in 
real-time.

The process is to copy files and folders from a backup folder that is synched to the cloud automatically.   Then copy changes in the local 
NT8 paths to the cloud-synched folder.  Most of these scripts are set up to only take changes from the cloud folder that are newer than the 
files in the local path and to not take any files or folders that were deleted in the local path.  This allows you to clean up unwanted 
templates and workspaces and have those changes propagate to your other NT 8 instances while still having updates from other systems ( market
data, templates, workspaces ) come to systems that didn't create the new items.

OneDrive and the folder \NT8BackUp was used in these scripts, but they can be changed to suit your preferred paths and cloud services.

