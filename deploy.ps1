$pass = convertto-securestring "0c3anrac5" -asplaintext -force
$mycred = new-object -typename System.Management.Automation.PSCredential -argumentlist "CT2-WS1\CT2.Admin",$pass
invoke-command -filepath C:\projects\Powershell\backup.ps1 -computerName 89.251.114.100  -Credential $mycred