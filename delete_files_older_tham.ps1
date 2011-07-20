$Now = Get-Date
$TargetFolder = $args[0]
$Files = ls $TargetFolder -Include *.bak -Recurse | where {$_.LastWriteTime -le "Get-Date.AddDays(-7)"}

foreach($File in $Files)
{
	Write-Host "Deleting FIle $File" -ForegroundColor "Red";
	Remove-Item $File | Out-Null
}