@echo off

cd %~dp0
SET dotnet_path=C:\Program Files\dotnet\
SET  dotnet_bin=dotnet.exe
SET target_mode=Release
SET   framework=netcoreapp2.2

:: Build applications
::SET BUILD_TARGETS=(win10-x64 centos.7-x64 ubuntu.16.04-x64 alpine.3.7-x64)
SET BUILD_TARGETS=(debian-x64)

FOR %%i IN %BUILD_TARGETS% DO (
	"%dotnet_path%%dotnet_bin%" publish --framework %framework% -c %target_mode% -r %%i
)
:: -o ../release/%%i

PAUSE
