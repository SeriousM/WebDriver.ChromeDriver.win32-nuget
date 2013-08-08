@echo off

set PWD="%CD%"
set NUGET=%PWD%\NuGet.exe

set /P APIKEY=Enter your Api Key from https://www.nuget.org/account: 

if "%APIKEY%"=="" GOTO ERROR

DEL %PWD%\..\*.nupkg

%NUGET% pack -Verbosity detailed -OutputDirectory %PWD%\.. -Exclude "build\*;.git\*;README.md" %PWD%\..\WebDriver.ChromeDriver.win32.nuspec
%NUGET% push %PWD%\..\*.nupkg %APIKEY%
GOTO END

:ERROR
echo EXIT: No api key was entered

:END