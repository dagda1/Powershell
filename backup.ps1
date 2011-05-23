$backup = [string]::Format("D:\backups\{0}", $args[0])
$live = [string]::Format("D:\www\{0}", $args[0])
Write-Host deleting backup $backup
rm $backup -force -recurse
mkdir $backup
Write-Host backing up from $live to $backup
cp $live\* $backup\ -force -recurse
Write-Host finished!
$zip_file =  [string]::Format("C:\inetpub\ftproot\{0}.7z", $args[0])
zip X $zip_file
rm $zip_file
Write-Host "Copying to " + $live
cp C:\Inetpub\ftproot\* $live -rec -force
rm C:\Inetpub\ftproot\* -Recurse -Force
Write-Host finished!