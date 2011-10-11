$cutoff = (Get-Date) - (New-TimeSpan -Days 7)
 
$before = (Get-ChildItem $args[0] -Recurse | Measure-Object Length -Sum).Sum
 
Get-ChildItem $args[0] -Recurse |                           
  Where-Object { $_.Length -ne $null } |            
  Where-Object { $_.LastWriteTime -lt $cutoff } |   
  Remove-Item -Force -ErrorAction SilentlyContinue -WhatIf  # REMOVE -whatif to ENABLE DELETING!
 
$after = (Get-ChildItem $args[0] -Recurse | Measure-Object Length -Sum).Sum
 
'Freed {0:0.00} MB disk space' -f (($before-$after)/1MB)
