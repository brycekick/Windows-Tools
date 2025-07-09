::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBRAThSNAE+1EbsQ5+n//NaUp1kJXew4NobY1dQ=
::YAwzuBVtJxjWCl3EqQJhSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZks0
::ZQ05rAF9IBncCkqN+0xwdVsFAlTi
::ZQ05rAF9IAHYFVzEqQIHIRVQQxORKGS1CqZ8
::eg0/rx1wNQPfEVWB+kM9LVsJDBOLMm+1EaYI5+f3/Io=
::fBEirQZwNQPfEVWB+kM9LVsJDDOLMm+1EaZc6/3o++WKq1cYRoI=
::cRolqwZ3JBvQF1fEqQIHIRVQQxORfGivFaET5eHh6vjHtkISWII=
::dhA7uBVwLU+EWFuW7UE1PB5XRGQ=
::YQ03rBFzNR3SWATE1lApKx5fRQeJXA==
::dhAmsQZ3MwfNWATE1lApKx5ASQeKXA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBRAThSNAE+1EbsQ5+n//Nawq0MZW/UsOLvU1bidbuUL7yU=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title Windows Tools Customizer

:: Requires running as Administrator for some features

:menu
cls
echo ===============================
echo    Windows Tools Customizer
echo ===============================
echo 1. Disable Cortana
echo 2. Disable Xbox App
echo 3. Disable OneNote
echo 4. Disable Microsoft Solitaire Collection
echo 5. Toggle Light/Dark Mode
echo 6. Change Wallpaper (Local File)
echo 7. Change Wallpaper (From Web URL)
echo 8. Exit
echo.
set /p choice=Choose an option (1-8):

if "%choice%"=="1" goto DisableCortana
if "%choice%"=="2" goto DisableXbox
if "%choice%"=="3" goto DisableOneNote
if "%choice%"=="4" goto DisableSolitaire
if "%choice%"=="5" goto ToggleTheme
if "%choice%"=="6" goto ChangeWallpaperLocal
if "%choice%"=="7" goto ChangeWallpaperWeb
if "%choice%"=="8" goto End

echo Invalid choice.
pause
goto menu

:: Disable Apps

:DisableCortana
echo Disabling Cortana...
powershell -Command "Get-AppxPackage -AllUsers *Microsoft.549981C3F5F10* | Remove-AppxPackage"
echo Done.
pause
goto menu

:DisableXbox
echo Disabling Xbox App...
powershell -Command "Get-AppxPackage -AllUsers *Microsoft.XboxApp* | Remove-AppxPackage"
echo Done.
pause
goto menu

:DisableOneNote
echo Disabling OneNote...
powershell -Command "Get-AppxPackage -AllUsers *Microsoft.Office.OneNote* | Remove-AppxPackage"
echo Done.
pause
goto menu

:DisableSolitaire
echo Disabling Microsoft Solitaire Collection...
powershell -Command "Get-AppxPackage -AllUsers *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage"
echo Done.
pause
goto menu

:: Toggle Light/Dark Mode for System and Apps

:ToggleTheme
echo Checking current theme...
powershell -Command ^
"$appsTheme = Get-ItemPropertyValue -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme; ^
$sysTheme = Get-ItemPropertyValue -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme; ^
if ($appsTheme -eq 1) { ^
  Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0; ^
  Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0; ^
  Write-Output 'Switched to Dark Mode'; ^
} else { ^
  Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 1; ^
  Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 1; ^
  Write-Output
