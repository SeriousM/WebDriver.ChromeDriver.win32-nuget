@echo off

set PWD="%CD%"
set NUGET=%PWD%\NuGet.exe

DEL %PWD%\..\*.nupkg

%NUGET% pack -Verbosity detailed -OutputDirectory %PWD%\.. -Exclude "**/build/**;**/.git/**;**/.git*;**/README.md;**/icon.png;**/download-latest.ps1" %PWD%\..\WebDriver.ChromeDriver.win32.nuspec