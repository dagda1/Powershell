# create the FtpWebRequest and configure it
build
$zipFile = @(ls $ftp\* -Include *.7z)[0]
Write-Host file $zips[0].FullName
$ftp = [System.Net.FtpWebRequest]::Create("ftp://89.251.114.100/")
$ftp = [System.Net.FtpWebRequest]$ftp
$ftp.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile
$ftp.Credentials = new-object System.Net.NetworkCredential("anonymous","anonymous@localhost")
$ftp.UseBinary = $true
$ftp.UsePassive = $true
# read in the file to upload as a byte array
$content = gc -en byte c:\me.png
$ftp.ContentLength = $content.Length
# get the request stream, and write the bytes into it
$rs = $ftp.GetRequestStream()
$rs.Write($content, 0, $content.Length)
# be sure to clean up after ourselves
$rs.Close()
$rs.Dispose()