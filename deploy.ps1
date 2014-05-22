$pass = convertto-securestring "" -asplaintext -force
$mycred = new-object -typename System.Management.Automation.PSCredential -argumentlist "",$pass
invoke-command -filepath C:\projects\Powershell\backup.ps1 -computerName 89.251.114.100  -Credential $mycred
