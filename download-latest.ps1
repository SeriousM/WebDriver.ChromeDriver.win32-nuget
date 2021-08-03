$latestReleaseLink = "https://chromedriver.storage.googleapis.com/LATEST_RELEASE";
$nuspecFilePath = $pwd.Path + "/WebDriver.ChromeDriver.win32.nuspec"
$zipTargetDirectory = $pwd.Path + "/content"

$webclient = New-Object System.Net.webclient

Write-Host Get latest version information
$version = $webclient.DownloadString($latestReleaseLink)

Write-Host Latest version is $version

Write-Host Patch nuspec file
(Get-Content -path $nuspecFilePath) -replace "\<version\>.*?\<\/version\>", ("<version>"+$version+"</version>") | Set-Content -Path $nuspecFilePath

Write-Host Download latest zip
$zipLink = "https://chromedriver.storage.googleapis.com/"+$version+"/chromedriver_win32.zip"
$tmpFile = (New-TemporaryFile).FullName -replace "\.tmp", ".zip"

Write-Host Download zip to $tmpFile
$webclient.DownloadFile($zipLink, $tmpFile)

Write-Host Extract zip to $zipTargetDirectory
Expand-Archive -Path $tmpFile -DestinationPath $zipTargetDirectory -Force

Write-Host Done.