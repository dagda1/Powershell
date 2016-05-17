function prompt
{
	$promptText = "PS>";
	$wi = [System.Security.Principal.WindowsIdentity]::GetCurrent()
	$wp = new-object 'System.Security.Principal.WindowsPrincipal' $wi
	if ( $wp.IsInRole("Administrators") -eq 1 )
	{
		$color = "Red"
		$title = "**ADMIN** on " + (hostname);
	}
	else
	{
		$color = "Green"
		$title = hostname;
	}
	write-host $promptText -NoNewLine -ForegroundColor $color
	$host.UI.RawUI.WindowTitle = $title;
	return " "
}                                   


#git commands 
function ga{ git add . -v}
function gmt([string] $message) {git commit -m $message}
function gma([string] $message) {git commit -am $message}
function glo{git log}
function gs{git status}
function gba{git branch}
function gotoCOM{cd C:\projects\coms_service_portal}
function goto-pr{cd C:\projects}

function go-home{cd C:\users\cowanp}



function whoami 
{ 
	(get-content env:\userdomain) + "\" + (get-content env:\username); 
}

function strip-extension ([string] $filename) 
{ 
	[system.io.path]::getfilenamewithoutextension($filename)
}

function touch {
  Param(
    [Parameter(Mandatory=$true)]
    [string]$Path
  )

  if (Test-Path -LiteralPath $Path) {
    (Get-Item -Path $Path).LastWriteTime = Get-Date
  } else {
    New-Item -Type File -Path $Path
  }
}

function Remove-MergedBranches
{
  git branch --merged |
    ForEach-Object { $_.Trim() } |
    Where-Object {$_ -NotMatch "^\*"} |
    Where-Object {-not ( $_ -Like "*master" )} |
    Where-Object {-not ( $_ -Like "*develop" )} |
    ForEach-Object { git branch -d $_ }
}


$env:path += ";" + (Get-Item "Env:ProgramFiles").Value + "\Git\bin"


set-alias coms gotoCOM
set-alias comssln C:\projects\coms_service_portal\COMSServicePortal.sln
set-alias home go-home
set-alias pr goto-pr
set-alias comsdb C:\projects\coms_service_portal\database\bin\Debug\Database.exe

set-alias grep select-string
# Load posh-git example profile
. 'C:\Users\cowanp\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'

Set-PSReadlineOption -EditMode Emacs
