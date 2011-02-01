set-alias notepad "C:\Program Files (x86)\Notepad++\notepad++.exe"
set-alias zip "C:\Program Files\7-Zip\7z.exe"

function gototrunk{set-location C:\projects\ncontinuity2\trunk}

function gotoprojects{set-location C:\projects}

function gotoprofile{set-location C:\Users\paul.cowan\Documents\WindowsPowerShell}

function gotobuild{set-location C:\projects\ncontinuity2\trunk\build\net-4.0\debug}

function gotodownloads{set-location C:\Users\paul.cowan\Downloads}

function gotoncontinuity2{set-location c:\projects\ncontinuity2}

function gotolead{set-location c:\projects\leadcapturer}

function gotocurrent{set-location "C:\projects\ncontinuity2\branches\2.4.0"}

set-alias tr gototrunk
set-alias pr gotoprojects
set-alias profile gotoprofile
set-alias build gotobuild
set-alias downloads gotodownloads
set-alias nc gotoncontinuity2
set-alias lead gotolead
set-alias live gotocurrent