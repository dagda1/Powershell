set-location "C:\inetpub\ftproot"

$ftp = "C:\Inetpub\ftproot"
$zips = @(ls $ftp\* -Include *.7z)

try
{
  try
  {
	if(@($zips).Count -lt 1)
	{	
		throw new-object System.Exception("No zip files in the root")
	}

	if(@($zips).Count -gt 1)
	{	
		throw new-object System.Exception("More than one zip file in the root")
	}

	$version = [System.IO.Path]::GetFileNameWithoutExtension($zips[0])

	if(!($version -match "^emailservice-\d\.\d\.\d")) 
	{
		throw New-Object system.Exception("Wrongly named email service zip")
	}

	ls  c:\Inetpub\ftproot | where {$_.Extension -ne '.7z'}| write-host #Remove-Item -Recurse -force

	write-host $version
	net stop $version

	& "C:\Program Files\7-Zip\7z.exe" X $zips[0].FullName

	write-host $zips[0].FullName

	rm $zips[0].FullName -Force

	$destination = [System.String]::Format("D:\services\{0}", $version)

	Write-Host "Copying files to " + $destination
	cp C:\Inetpub\ftproot\* $destination -Recurse -Force

	write-host $destination\logs
	rm $destination\logs -rec -force

	net start $version

	rm C:\inetpub\ftproot\* -rec -force

	Write-Host "waiting 5 seconds for service to start!"

	[System.Threading.Thread]::Sleep(5000)

	cat $destination\logs\CurrentLog.txt
	}
	catch [System.Management.Automation.ActionPreferenceStopException]
	{
		Throw $_.exception
	}
  catch
  {
    Throw $_.exception
  }
} 
catch #[System.Management.Automation.ItemNotFoundException]
{
  "Got it!"
}

