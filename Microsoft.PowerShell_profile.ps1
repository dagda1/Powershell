set-alias notepad "C:\Program Files (x86)\Notepad++\notepad++.exe"
set-alias zip "C:\Program Files\7-Zip\7z.exe"

function gototrunk{set-location C:\projects\ncontinuity2\trunk}

function gotoprojects{set-location C:\projects}

function gotoprofile{set-location C:\Users\paul.cowan\Documents\WindowsPowerShell}

function gotobuild{set-location "C:\projects\continuity2\build\net-4.0\debug\_PublishedWebsites"}

function gotodownloads{set-location C:\Users\paul.cowan\Downloads}

function gotoncontinuity2{set-location c:\projects\ncontinuity2}

function gotolead{set-location c:\projects\leadcapturer}

function gotocurrent{set-location "C:\projects\ncontinuity2\branches\2.4.0"}

function gotocurrentbuild{set-location "C:\projects\ncontinuity2\branches\2.4.0\build\net-4.0\debug\_PublishedWebsites"}

function openscratch{notepad C:\users\paul.cowan\desktop\scratch.txt}

function opencatscratch{cat C:\users\paul.cowan\desktop\scratch.txt}

function gotoc2{set-location C:\projects\continuity2}



set-alias tr gototrunk
set-alias pr gotoprojects
set-alias profile gotoprofile
set-alias build gotobuild
set-alias downloads gotodownloads
set-alias nc gotoncontinuity2
set-alias lead gotolead
set-alias live gotocurrent
set-alias live_build gotocurrentbuild
set-alias scratch openscratch
set-alias catscratch opencatscratch
set-alias ie "C:\Program Files\Internet Explorer\iexplore.exe"
set-alias c2 gotoc2
set-alias c2web "C:\projects\continuity2\ncontinuity2.web.sln"