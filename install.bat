@echo off
title Cursor Right-Click Menu

net session >nul 2>&1 || (echo Run as Administrator! & pause & exit)

echo Finding Cursor...
set "P="
if exist "C:\Program Files\cursor\Cursor.exe" set "P=C:\Program Files\cursor\Cursor.exe"
if exist "%LOCALAPPDATA%\Programs\cursor\Cursor.exe" set "P=%LOCALAPPDATA%\Programs\cursor\Cursor.exe"
if "%P%"=="" (echo Cursor not found! & pause & exit)

echo Installing...
set "P=%P:\=\\%"
(echo Windows Registry Editor Version 5.00
echo [HKEY_CLASSES_ROOT\Directory\Background\shell\Cursor]
echo @="Open in Cursor"
echo "Icon"="%P%"
echo [HKEY_CLASSES_ROOT\Directory\Background\shell\Cursor\command]
echo @="\"%P%\" \"%%V\""
echo [HKEY_CLASSES_ROOT\Directory\shell\Cursor]
echo @="Open in Cursor"
echo "Icon"="%P%"
echo [HKEY_CLASSES_ROOT\Directory\shell\Cursor\command]
echo @="\"%P%\" \"%%V\"")>"%TEMP%\c.reg"

regedit /s "%TEMP%\c.reg"
taskkill /f /im explorer.exe >nul & start explorer.exe

echo Done! Right-click any folder to see "Open in Cursor"
timeout /t 3 >nul
