@echo off
setlocal enabledelayedexpansion
set nameFile=%1
set f=0
set command=assos;break;call;cd;chdir;cls;color;copy;date;del;erase;dir;echo;exit;for;ftype;goto;if;md;mkdir;pach;pause;popd;prompt;pushd;rd;rmdir;rem;ren;rename;set;setlocal;shift;yime;title;verify;vol;

echo.

if "%1"=="" goto help
if "%1"=="/?" goto help

if "%1"=="*" goto FindAll
if "%1"=="*.*" goto FindAll

echo Result:

for %%I in ("%command:;=" "%") do (
if "%nameFile%"=="%%~I" ( 
echo Internal command
set f=1
)
)
goto Main

:Main
for %%I in ("%pathext:;=" "%") do (
echo %nameFile%|findstr /E /I %%I >nul
if not errorLevel 1 goto searchWithExtension
)

for %%I in ("%pathext:;=" "%") do (
if exist "%cd%\!nameFile!%%~I" (
for %%G in (%cd%\!nameFile!%%~I) do (
echo %%G
rem echo Main 1
)
rem echo %cd%\!nameFile!%%~I
set f=1
)
)

for %%I in ("%path:;=" "%") do (
for %%J in ("%pathext:;=" "%") do (
if exist "%%~I\!nameFile!%%~J" (
for %%G in (%%I\!nameFile!%%~J) do (
echo %%G
rem echo Main 2
)
rem echo %%~I\!nameFile!%%~J
set f=1
)
)
)
goto WithoutExtencion

:searchWithExtension
if exist "%cd%\!nameFile!" (
for %%G in (%cd%\!nameFile!) do ( 
echo %%G
rem echo %cd%\!nameFile!
set f=1
rem echo searchWithExtension 1
)
)

for %%I in ("%path:;=" "%") do (
if exist "%%~I\!nameFile!" (
for %%G in (%%I\!nameFile!) do (
echo %%G
rem echo searchWithExtension 2
)
rem echo %%~I\!nameFile!
set f=1
)
)
goto WithoutExtencion

:WithoutExtencion
if exist "%cd%\!nameFile!" (
for %%G in (%cd%\!nameFile!) do (
echo %%G
rem echo WithoutExtencion 1
)
rem echo %cd%\!nameFile!%%~I
set f=1
)

for %%I in ("%path:;=" "%") do (
if exist "%%~I\!nameFile!" (
for %%G in (%%I\!nameFile!) do (
echo %%G
rem echo WithoutExtencion 2
)
rem echo %%~I\!nameFile!%%~J
set f=1
)
)
goto ThereIsFile

:ThereIsFile
if %f% equ 0 echo File not found
exit /b

:FindAll
for %%J in ("%pathext:;=" "%") do (
for %%I in ("%path:;=" "%") do (
rem if exist "%%~I\!nameFile!%%~J" (
for %%G in (%%I\!nameFile!%%J) do (
echo %%G
)
rem )
)
)
exit /b

:help
echo %~n0 [name file[.file extension]]
echo Don't use mask in the extencion