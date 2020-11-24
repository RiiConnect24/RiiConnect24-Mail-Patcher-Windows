:startup_begin
@echo off
cd /d "%~dp0"
if exist temp.bat del /q temp.bat
:: ===========================================================================
:: Wii Mail Patcher for Windows
set version=1.2.0
:: AUTHORS: KcrPL, Spotlight
:: ***************************************************************************
:: Copyright (c) 2018 RiiConnect24, and it's (Lead) Developers
:: ===========================================================================
title RiiConnect24 Mail Patcher.
set last_build=2020/11/24
set at=18:27

set mode=126,36
mode %mode%
title Mail Patcher for RiiConnect24 v%version%  Created by @KcrPL, @Spotlight, @Seriel

set header=RiiConnect24 Mail Patcher - (C) KcrPL v%version% (Updated on %last_build% at %at%)

set /a rep=1

set /a update_Activate=1
set /a offlinestorage=0
set FilesHostedOn=https://patcher.rc24.xyz/update/Mail-Patcher/v1
set ftp_patch_url=https://mtw.rc24.xyz
set MainFolder=%appdata%\Mail-Patcher
set TempStorage=%appdata%\Mail-Patcher\internet\temp

if %os%=="" goto not_windows_nt

if exist "%MainFolder%\requirerestart.txt" goto reqrestart

set /a patherror=0
if "%cd%"=="%windir%\system32" set /a patherror=1
if %patherror%==0 if not exist patch.bat set /a patherror=2

if exist output.txt del output.txt /q
if exist temp.txt del temp.txt /q

goto begin_main
:not_windows_nt
cls
echo %header%
echo.
echo Please don't run our Mail Patcher in MS-DOS :P.
echo Run it only on Windows Vista+ computer. :)
pause>NUL	
exit

:begin_main
mode %mode%
set /a customerror=0
cls
echo %header%
echo              `..````                                                  
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`                
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs                
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd               
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+    RiiConnect your Wii.       
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:                
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.                
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN   Press any button to begin                 
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd    (Please mail us at support@riiconnect24.net if you have problems)
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy                 
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+                 
echo             mmmmms smMMMMMMMMMmddMMmmNmNMMMMMMMMMMMM:                 
echo            `mmmmmo hNMMMMMMMMMmddNMMMNNMMMMMMMMMMMMM.                 
echo            -mmmmm/ dNMMMMMMMMMNmddMMMNdhdMMMMMMMMMMN                  
echo            :mmmmm-`mNMMMMMMMMNNmmmNMMNmmmMMMMMMMMMMd                  
echo            +mmmmN.-mNMMMMMMMMMNmmmmMMMMMMMMMMMMMMMMy                  
echo            smmmmm`/mMMMMMMMMMNNmmmmNMMMMNMMNMMMMMNmy.                 
echo            hmmmmd`omMMMMMMMMMNNmmmNmMNNMmNNNNMNdhyhh.                 
echo            mmmmmh ymMMMMMMMMMNNmmmNmNNNMNNMMMMNyyhhh`                 
echo           `mmmmmy hmMMNMNNMMMNNmmmmmdNMMNmmMMMMhyhhy                  
echo           -mddmmo`mNMNNNNMMMNNNmdyoo+mMMMNmNMMMNyyys                  
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-                  
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm                     
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+                    
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm                    
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+                   
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm                   
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/    
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy   
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`   
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`        
echo                                   -odhhhhyddmmmmmNNmhs/:`             
echo                                     :syhdyyyyso+/-`                   
pause>NUL

goto startup_script

:begin_main_download_curl
cls
echo %header%
echo.
echo              `..````                                     :--------------------------------:
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`    Downloading curl... Please wait.
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd    This can take some time...
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs   :-------------------------:
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+   
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:   File 1 [3.5MB] out of 1
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.   0%% [          ]
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+
echo             mmmmms smMMMMMMMMMmddMMmmNmNMMMMMMMMMMMM:
echo            `mmmmmo hNMMMMMMMMMmddNMMMNNMMMMMMMMMMMMM.
echo            -mmmmm/ dNMMMMMMMMMNmddMMMNdhdMMMMMMMMMMN
echo            :mmmmm-`mNMMMMMMMMNNmmmNMMNmmmMMMMMMMMMMd
echo            +mmmmN.-mNMMMMMMMMMNmmmmMMMMMMMMMMMMMMMMy
echo            smmmmm`/mMMMMMMMMMNNmmmmNMMMMNMMNMMMMMNmy.
echo            hmmmmd`omMMMMMMMMMNNmmmNmMNNMmNNNNMNdhyhh.
echo            mmmmmh ymMMMMMMMMMNNmmmNmNNNMNNMMMMNyyhhh`
echo           `mmmmmy hmMMNMNNMMMNNmmmmmdNMMNmmMMMMhyhhy
echo           -mddmmo`mNMNNNNMMMNNNmdyoo+mMMMNmNMMMNyyys
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`
echo                                   -odhhhhyddmmmmmNNmhs/:`
echo                                     :syhdyyyyso+/-`
call powershell -command (new-object System.Net.WebClient).DownloadFile('%FilesHostedOn%/curl.exe', 'curl.exe')
set /a temperrorlev=%errorlevel%
if not %temperrorlev%==0 goto begin_main_download_curl_error

goto startup_script
:begin_main_download_curl_error
cls
echo %header%                                                                
echo              `..````                                                  
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`                
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd                
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs                
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+        
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:                
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.                
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN            
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd                 
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy                 
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+                 
echo ---------------------------------------------------------------------------------------------------------------------------
echo    /---\   ERROR.
echo   /     \  There was an error while downloading curl.
echo  /   ^!   \ 
echo  --------- We will now open a website that will download curl.exe.
echo            Please move curl.exe to the folder where RiiConnect24 Patcher is and restart the patcher.
echo.
echo       Press any key to open download page in browser and to return to menu.
echo ---------------------------------------------------------------------------------------------------------------------------
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm                     
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+                    
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm                    
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+                   
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm                   
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/    
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy   
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`   
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`        
echo                                   -odhhhhyddmmmmmNNmhs/:`             
echo                                     :syhdyyyyso+/-`                   
pause>NUL
start %FilesHostedOn%/curl.exe
goto begin_main



:startup_script
curl
if not %errorlevel%==2 goto begin_main_download_curl

goto check_for_update
:check_for_update
cls
echo.                                                                       
echo              `..````                                     :-------------------------:
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`   : Checking for updates... :          
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd   :-------------------------:     
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs                
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+        
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:                
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.                
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN            
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd                 
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy                 
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+                 
echo             mmmmms smMMMMMMMMMmddMMmmNmNMMMMMMMMMMMM:                 
echo            `mmmmmo hNMMMMMMMMMmddNMMMNNMMMMMMMMMMMMM.                 
echo            -mmmmm/ dNMMMMMMMMMNmddMMMNdhdMMMMMMMMMMN                  
echo            :mmmmm-`mNMMMMMMMMNNmmmNMMNmmmMMMMMMMMMMd                  
echo            +mmmmN.-mNMMMMMMMMMNmmmmMMMMMMMMMMMMMMMMy                  
echo            smmmmm`/mMMMMMMMMMNNmmmmNMMMMNMMNMMMMMNmy.                 
echo            hmmmmd`omMMMMMMMMMNNmmmNmMNNMmNNNNMNdhyhh.                 
echo            mmmmmh ymMMMMMMMMMNNmmmNmNNNMNNMMMMNyyhhh`                 
echo           `mmmmmy hmMMNMNNMMMNNmmmmmdNMMNmmMMMMhyhhy                  
echo           -mddmmo`mNMNNNNMMMNNNmdyoo+mMMMNmNMMMNyyys                  
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-                  
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm                     
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+                    
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm                    
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+                   
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm                   
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/    
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy   
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`   
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`        
echo                                   -odhhhhyddmmmmmNNmhs/:`             
echo                                     :syhdyyyyso+/-`
set /a updateavailable=0 

:: Update script.
set updateversion=0.0.0
:: Delete version.txt and whatsnew.txt
if %offlinestorage%==0 if exist "%TempStorage%\version.txt" del "%TempStorage%\version.txt" /q
if %offlinestorage%==0 if exist "%TempStorage%\whatsnew.txt" del "%TempStorage%\whatsnew.txt" /q

if not exist %TempStorage% md %TempStorage%
:: Commands to download files from server.
if %Update_Activate%==1 if %offlinestorage%==0 call curl -f -L -s -S --user-agent "Mail Patcher v%version%" --insecure "%FilesHostedOn%/UPDATE/whatsnew.txt" --output "%TempStorage%\whatsnew.txt"
if %Update_Activate%==1 if %offlinestorage%==0 call curl -f -L -s -S --user-agent "Mail Patcher v%version%" --insecure "%FilesHostedOn%/UPDATE/version.txt" --output "%TempStorage%\version.txt"

	set /a temperrorlev=%errorlevel%
set /a updateserver=1
	::Bind error codes to errors here

	
:: Copy the content of version.txt to variable.
if exist "%TempStorage%\version.txt" set /p updateversion=<"%TempStorage%\version.txt"
if not exist "%TempStorage%\version.txt" set /a updateavailable=0
if %Update_Activate%==1 if exist "%TempStorage%\version.txt" set /a updateavailable=1
:: If version.txt doesn't match the version variable stored in this batch file, it means that update is available.
if %Update_Activate%==1 if %updateversion%==%version% set /a updateavailable=0 
if %Update_Activate%==1 if %updateavailable%==1 set /a updateserver=2
if %Update_Activate%==1 if %updateavailable%==1 goto update_notice
goto startup_script_files_check
:startup_script_files_check

goto main_fade_out
:error_update_not_available
cls
set /a updateserver=0
goto startup_script_files_check
:update_notice
if %updateversion%==0.0.0 goto error_update_not_available
set /a update=1
cls
echo.                                                                       
echo              `..````                                                  
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`                
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd                
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs                
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+        
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:                
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.                
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN            
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd                 
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy                 
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+                 
echo ------------------------------------------------------------------------------------------------------------------------------              
echo    /---\   An Update is available.              
echo   /     \  An Update for this program is available. We suggest updating the Mail Patcher to the latest version.
echo  /   !   \ 
echo  ---------  Current version: %version%
echo             New version: %updateversion%
echo                       1. Update                      2. Dismiss               3. What's new in this update?
echo ------------------------------------------------------------------------------------------------------------------------------    
echo           -mddmmo`mNMNNNNMMMNNNmdyoo+mMMMNmNMMMNyyys                  
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-                  
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm                     
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+                    
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm                    
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+                   
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm                   
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/    
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy   
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`   
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`        
echo                                   -odhhhhyddmmmmmNNmhs/:`             
echo                                     :syhdyyyyso+/-`
set /p s=
if %s%==1 goto update_files
if %s%==2 goto startup_script_files_check
if %s%==3 goto whatsnew
goto update_notice
:update_files
cls
cls
echo.                                                                       
echo              `..````                                                  
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`                
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd                
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs                
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+        
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:                
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.                
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN            
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd                 
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy                 
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+                 
echo ------------------------------------------------------------------------------------------------------------------------------              
echo    /---\   Updating.
echo   /     \  Please wait...
echo  /   !   \ 
echo  --------- Mail Patcher will restart shortly... 
echo.             
echo.
echo ------------------------------------------------------------------------------------------------------------------------------    
echo           -mddmmo`mNMNNNNMMMNNNmdyoo+mMMMNmNMMMNyyys                  
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-                  
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm                     
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+                    
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm                    
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+                   
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm                   
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/    
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy   
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`   
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`        
echo                                   -odhhhhyddmmmmmNNmhs/:`             
echo                                     :syhdyyyyso+/-`
:: Deleting the temp files if they exist.
curl -f -L -s -S --insecure "https://patcher.rc24.xyz/update/RiiConnect24-Patcher/v1/UPDATE/update_assistant.bat" --output "update_assistant.bat"
	set temperrorlev=%errorlevel%
	if not %temperrorlev%==0 goto error_updating
	start update_assistant.bat -Mail-Patcher
exit
:error_updating
cls
echo %header%
echo.                                                                       
echo              `..````                                                  
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`                
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd                
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs                
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+        
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:                
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.                
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN            
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd                 
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy                 
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+                 
echo ------------------------------------------------------------------------------------------------------------------------------
echo    /---\   ERROR.
echo   /     \  There was an error while downloading the update assistant.
echo  /   ^!   \ 
echo  --------- Press any key to return to main menu.
echo.  
echo.
echo ------------------------------------------------------------------------------------------------------------------------------
echo           -mddmmo`mNMNNNNMMMNNNmdyoo+mMMMNmNMMMNyyys                  
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-                  
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm                     
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+                    
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm                    
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+                   
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm                   
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/    
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy   
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`   
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`        
echo                                   -odhhhhyddmmmmmNNmhs/:`             
echo                                     :syhdyyyyso+/-`
pause>NUL
goto begin_main

:whatsnew
cls
if not exist "%TempStorage%\whatsnew.txt" goto whatsnew_notexist
echo RiiConnect24 Mail Patcher - (C) KcrPL, (C) Spotlight v%version% (Compiled on %last_build% at %at%)
echo ------------------------------------------------------------------------------------------------------------------------------              
echo.
echo What's new in update %updateversion%?
echo.
type "%TempStorage%\whatsnew.txt"
pause>NUL
goto update_notice
:whatsnew_notexist
cls
echo RiiConnect24 Mail Patcher - (C) KcrPL, (C) Spotlight v%version% (Compiled on %last_build% at %at%)
echo -----------------------------------------------------------------------------------------------------------------------------              
echo.
echo Error. What's new file is not available.
echo.
echo Press any button to go back.
pause>NUL
goto update_notice

:main_fade_out
cls
echo.                                                                       
echo              `..````                                                  
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`                
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd                
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs                
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+                
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:                
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.                
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN                 
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd                 
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy                 
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+                 
echo             mmmmms smMMMMMMMMMmddMMmmNmNMMMMMMMMMMMM:                 
echo            `mmmmmo hNMMMMMMMMMmddNMMMNNMMMMMMMMMMMMM.                 
echo            -mmmmm/ dNMMMMMMMMMNmddMMMNdhdMMMMMMMMMMN                  
echo            :mmmmm-`mNMMMMMMMMNNmmmNMMNmmmMMMMMMMMMMd                  
echo            +mmmmN.-mNMMMMMMMMMNmmmmMMMMMMMMMMMMMMMMy                  
echo            smmmmm`/mMMMMMMMMMNNmmmmNMMMMNMMNMMMMMNmy.                 
echo            hmmmmd`omMMMMMMMMMNNmmmNmMNNMmNNNNMNdhyhh.                 
echo            mmmmmh ymMMMMMMMMMNNmmmNmNNNMNNMMMMNyyhhh`                 
echo           `mmmmmy hmMMNMNNMMMNNmmmmmdNMMNmmMMMMhyhhy                  
echo           -mddmmo`mNMNNNNMMMNNNmdyoo+mMMMNmNMMMNyyys                  
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-                  
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm                     
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+                    
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm                    
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+                   
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm                   
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/    
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy   
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`   
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`        
echo                                   -odhhhhyddmmmmmNNmhs/:`             
echo                                     :syhdyyyyso+/-`                   
echo. 
set /a server_status=0
curl --silent -k %ftp_patch_url%/patch >NUL
if %errorlevel%==0 set /a server_status=1
ping localhost -n 3 >NUL
goto 1
:1
cls
echo RiiConnect24 Mail Patcher - (C) KcrPL, (C) Spotlight v%version% (Compiled on %last_build% at %at%)
echo ----------------------------------------------------------------------------------------------------------------------------- 
echo.
echo :=======================================================================:
echo  Mail Patcher Update System
if %updateserver%==1 echo   The latest version is installed. Press C to read more. 
if %updateserver%==2 echo   An Update is available. Press C to read more.
if %updateserver%==0 echo   Update Server is not available. Press C to read more.
echo :=======================================================================:
echo.
echo This patcher is for patching nwc24msg.cfg file in order to make RiiConnect24 Mail work on your Wii!
echo.
echo Please choose how you're gonna patch the configuration file:
echo.
if %server_status%==1 echo 1. Patch it using FTP method (Recommended) [Server: Online]
if %server_status%==0 echo 1. Patch it using FTP method (Recommended) [Server: Offline]
echo 2. Legacy Patching (Use if FTP isn't working)
echo.
set /p s=Type a number and hit ENTER: 
if %s%==1 goto ftp_1
if %s%==2 goto 2_patch_script
if %s%==c goto more_info_update
if %s%==C goto more_info_update
goto 1
:more_info_update
cls
echo RiiConnect24 Mail Patcher - (C) KcrPL, (C) Spotlight v%version% (Compiled on %last_build% at %at%)
echo ------------------------------------------------------------------------------------------------------------------------------ 
echo.
if %updateserver%==1 echo The latest version of the Mail Patcher is now installed. (v%version%)
if %updateserver%==2 goto update_notice

if %updateserver%==0 echo Update Server is not available.
if %updateserver%==0 echo We could not connect to the update server. Please check your internet connection.
if %updateserver%==0 echo It can also mean that the server is under maintance now.
pause>NUL
goto 1
:ftp_1
set ip=NUL
cls
echo RiiConnect24 Mail Patcher - (C) KcrPL, (C) Spotlight v%version% (Compiled on %last_build% at %at%)
echo ------------------------------------------------------------------------------------------------------------------------------ 
echo.
echo Patching using FTP method.
echo.
echo Please start the FTP server on WiiXplorer on your Wii. Please give me the IP of your Wii (without port)
echo.
echo - Launch WiiXplorer
echo - Press Start
echo - Go to Settings
echo - Boot Settings
echo - NAND write acces - turn on
echo - Go back
echo - Press Start and FTP Server
echo - Start FTP Server
echo - Remember the IP of your Wii
echo.
echo Example of an IP address: 192.168.1.104
echo.
echo Press ENTER without typing anything to go back.
set /p ip=Type in the IP Address: 
if %ip%==NUL goto 1
goto ftp_2
:ftp_2
cls
echo RiiConnect24 Mail Patcher - (C) KcrPL, (C) Spotlight v%version% (Compiled on %last_build% at %at%)
echo ------------------------------------------------------------------------------------------------------------------------------ 
echo.
echo Please wait while we're patching your Mail configuration file!
echo.
echo [.] Checking if the connection to your Wii is ok.
echo [ ] Downloading nwc24msg.cfg from your Wii.
echo [ ] Sending your configuration file to the server and waiting for reply.
echo [ ] Deleting the configuration file from your Wii.
echo [ ] Uploading the configuration file to your Wii.

if exist output.txt del output.txt /q
if exist temp.txt del temp.txt /q
rem --- Temp script ---
echo open %ip% >>temp.txt
echo user >>temp.txt
echo password >>temp.txt
echo bye >>temp.txt
ftp -s:temp.txt >>output.txt
findstr /c:"230" "output.txt"
set temperrorlev=%errorlevel%
if not %temperrorlev%==0 set module=Checking Connection to Wii (FTP)
if not %temperrorlev%==0 goto error_patching

if not exist backup-configuration md backup-configuration
copy "nwc24msg.cfg" "backup-configuration\nwc24msg_%date%.cfg" /y

cls
echo RiiConnect24 Mail Patcher - (C) KcrPL, (C) Spotlight v%version% (Compiled on %last_build% at %at%)
echo ------------------------------------------------------------------------------------------------------------------------------ 
echo.
echo Please wait while we're patching your Mail configuration file!
echo.
echo [X] Checking if the connection to your Wii is ok.
echo [.] Downloading nwc24msg.cfg from your Wii.
echo [ ] Sending your configuration file to the server and waiting for reply.
echo [ ] Deleting the configuration file from your Wii.
echo [ ] Uploading the configuration file to your Wii.

if exist output.txt del output.txt /q
if exist temp.txt del temp.txt /q
if exist nwc24msg.cfg del nwc24msg.cfg /q

echo open %ip% >>temp.txt
echo user >>temp.txt
echo password >>temp.txt
echo cd nand >>temp.txt
echo cd shared2 >>temp.txt
echo cd wc24 >>temp.txt
echo get nwc24msg.cfg >>temp.txt
echo bye>>temp.txt

ftp -s:temp.txt >NUL

if not exist nwc24msg.cfg set module=Downloading nwc24msg.cfg from your Wii (FTP)
if not exist nwc24msg.cfg goto error_patching

cls
echo RiiConnect24 Mail Patcher - (C) KcrPL, (C) Spotlight v%version% (Compiled on %last_build% at %at%)
echo ------------------------------------------------------------------------------------------------------------------------------ 
echo.
echo Please wait while we're patching your Mail configuration file!
echo.
echo [X] Checking if the connection to your Wii is ok.
echo [X] Downloading nwc24msg.cfg from your Wii.
echo [.] Sending your configuration file to the server and waiting for reply.
echo [ ] Deleting the configuration file from your Wii.
echo [ ] Uploading the configuration file to your Wii.
if exist output.txt del /q output.txt
curl -X POST -F uploaded_config=@nwc24msg.cfg --output temp.cfg --silent -k %ftp_patch_url%/patch >NUL
set temperrorlev=%errorlevel%

if not %temperrorlev%==0 set module=CURL failure (FTP)
if not %temperrorlev%==0 goto error_patching

findstr /c:"503" "temp.cfg"
set temperrorlev=%errorlevel%
if %temperrorlev%==0 set module=The server is now currently under maintance. (503)
if %temperrorlev%==0 del temp.cfg /q
if %temperrorlev%==0 goto error_patching

findstr /c:"502" "temp.cfg"
set temperrorlev=%errorlevel%
if %temperrorlev%==0 set module=The server is now currently under maintance. (502)
if %temperrorlev%==0 del temp.cfg /q
if %temperrorlev%==0 goto error_patching

findstr /c:"500" "temp.cfg"
set temperrorlev=%errorlevel%
if %temperrorlev%==0 set module=The server is now currently under maintance. (500)
if %temperrorlev%==0 del temp.cfg /q
if %temperrorlev%==0 goto error_patching

cls
echo RiiConnect24 Mail Patcher - (C) KcrPL, (C) Spotlight v%version% (Compiled on %last_build% at %at%)
echo ------------------------------------------------------------------------------------------------------------------------------ 
echo.
echo Please wait while we're patching your Mail configuration file!
echo.
echo [X] Checking if the connection to your Wii is ok.
echo [X] Downloading nwc24msg.cfg from your Wii.
echo [X] Sending your configuration file to the server and waiting for reply.
echo [.] Deleting the configuration file from your Wii.
echo [ ] Uploading the configuration file to your Wii.

if exist output.txt del output.txt /q
if exist temp.txt del temp.txt /q

echo open %ip% >>temp.txt
echo user >>temp.txt
echo password >>temp.txt
echo cd nand >>temp.txt
echo cd shared2 >>temp.txt
echo cd wc24 >>temp.txt
echo delete nwc24msg.cfg >>temp.txt
echo bye>>temp.txt

ftp -s:temp.txt >>output.txt >NUL
findstr /c:"550" "output.txt" >NUL
set /a temperrorlev=%errorlevel%
if %temperrorlev%==0 set module=Permission error (FTP deleting)
if %temperrorlev%==0 goto error_patching

cls
echo RiiConnect24 Mail Patcher - (C) KcrPL, (C) Spotlight v%version% (Compiled on %last_build% at %at%)
echo ------------------------------------------------------------------------------------------------------------------------------ 
echo.
echo Please wait while we're patching your Mail configuration file!
echo.
echo [X] Checking if the connection to your Wii is ok.
echo [X] Downloading nwc24msg.cfg from your Wii.
echo [X] Sending your configuration file to the server and waiting for reply.
echo [X] Deleting the configuration file from your Wii.
echo [.] Uploading the configuration file to your Wii.

if exist output.txt del output.txt /q
if exist temp.txt del temp.txt /q

echo open %ip% >>temp.txt
echo user >>temp.txt
echo password >>temp.txt
echo cd nand >>temp.txt
echo cd shared2 >>temp.txt
echo cd wc24 >>temp.txt
echo put temp.cfg nwc24msg.cfg>>temp.txt
echo bye>>temp.txt
ftp -s:temp.txt >>output.txt

findstr /c:"226" "output.txt" >NUL
set /a temperrorlev=%errorlevel%

del nwc24msg.cfg /q
ren "temp.cfg" "nwc24msg.cfg"

del temp.txt /q
del output.txt /q

if %temperrorlev%==0 goto ftp_3
set module=Uploading the configuration file (FTP)
goto error_patching
:ftp_3
cls
echo RiiConnect24 Mail Patcher - (C) KcrPL, (C) Spotlight v%version% (Compiled on %last_build% at %at%)
echo ------------------------------------------------------------------------------------------------------------------------------ 
echo.
echo Patching done! Press any button to close this patcher.
echo.
echo [X] Checking if the connection to your Wii is ok.
echo [X] Downloading nwc24msg.cfg from your Wii.
echo [X] Sending your configuration file to the server and waiting for reply.
echo [X] Deleting the configuration file from your Wii.
echo [X] Uploading the configuration file to your Wii.
pause>NUL
goto end
:2_patch_script
cls
echo RiiConnect24 Mail Patcher - (C) KcrPL, (C) Spotlight v%version% (Compiled on %last_build% at %at%)
echo ------------------------------------------------------------------------------------------------------------------------------ 
echo.
echo In order to patch Mail configuration file, I need that file.
echo So, if you can please copy the nwc24msg.cfg file to this directory where I am.
echo.
if %rep%==1 if exist "nwc24msg.cfg" set /a cor=1
if %rep%==1 if exist "nwc24msg.cfg" goto 2_patch_script_2
if %rep%==1 echo Waiting for nwc24msg.cfg file.
if %rep%==2 echo Waiting for nwc24msg.cfg file..
if %rep%==3 echo Waiting for nwc24msg.cfg file...
if %rep%==4 echo Waiting for nwc24msg.cfg file....
if %rep%==4 set /a rep=0
set /a rep=%rep%+1
ping localhost -n 3 >NUL
goto 2_patch_script
:2_patch_script_2
if not exist backup-configuration md backup-configuration
copy "nwc24msg.cfg" "backup-configuration\nwc24msg_%date%.cfg" /y
cls
echo RiiConnect24 Mail Patcher - (C) KcrPL, (C) Spotlight v%version% (Compiled on %last_build% at %at%)
echo ------------------------------------------------------------------------------------------------------------------------------ 
echo.
echo Please wait while we're patching your Mail configuration file!
echo Depending on the server load and your connection speed. This may take about few seconds.
echo.
echo [.] Sending your configuration file to the server and waiting for reply.
curl -X POST -F uploaded_config=@nwc24msg.cfg --output temp.cfg --silent -k %ftp_patch_url%/patch >NUL

set /a temperrorlev=%errorlevel%
if not %temperrorlev%==0 set module=CURL failure (Local)
if not %temperrorlev%==0 goto error_patching

findstr /c:"503" "temp.cfg"
set temperrorlev=%errorlevel%
if %temperrorlev%==0 set module=The server is now currently under maintance. (503)
if %temperrorlev%==0 del temp.cfg /q
if %temperrorlev%==0 goto error_patching

findstr /c:"502" "temp.cfg"
set temperrorlev=%errorlevel%
if %temperrorlev%==0 set module=The server is now currently under maintance. (502)
if %temperrorlev%==0 del temp.cfg /q
if %temperrorlev%==0 goto error_patching

findstr /c:"500" "temp.cfg"
set temperrorlev=%errorlevel%
if %temperrorlev%==0 set module=The server is now currently under maintance. (500)
if %temperrorlev%==0 del temp.cfg /q
if %temperrorlev%==0 goto error_patching

del nwc24msg.cfg /q
ren "temp.cfg" "nwc24msg.cfg"

goto 2_patch_script_3
:2_patch_script_3
cls
echo RiiConnect24 Mail Patcher - (C) KcrPL, (C) Spotlight v%version% (Compiled on %last_build% at %at%)
echo ------------------------------------------------------------------------------------------------------------------------------ 
echo.
echo Patching done! Press any button to close this patcher.
echo.
echo [X] Sending your configuration file to the server and waiting for reply.
echo.
pause>NUL
goto end


:error_patching
cls
echo RiiConnect24 Mail Patcher - (C) KcrPL, (C) Spotlight v%version% (Compiled on %last_build% at %at%)
mode %mode%
cls
echo.                                                                       
echo              `..````                                                  
echo              yNNNNNNNNMNNmmmmdddhhhyyyysssooo+++/:--.`                
echo              hNNNNNNNNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMd                
echo              ddmNNd:dNMMMMNMMMMMMMMMMMMMMMMMMMMMMMMMMs                
echo             `mdmNNy dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM+        
echo             .mmmmNs mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM:                
echo             :mdmmN+`mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM.                
echo             /mmmmN:-mNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMN            
echo             ommmmN.:mMMMMMMMMMMMMmNMMMMMMMMMMMMMMMMMd                 
echo             smmmmm`+mMMMMMMMMMNhMNNMNNMMMMMMMMMMMMMMy                 
echo             hmmmmh omMMMMMMMMMmhNMMMmNNNNMMMMMMMMMMM+                 
echo ---------------------------------------------------------------------------------------------------------------------------
echo    /---\   ERROR.              
echo   /     \  There was an error while patching.
echo  /   !   \ 
echo  --------- Operation: %module%             
echo            Error code: %temperrorlev%
echo.
if "%module%"=="The server is now currently under maintance. (503)" echo The server is now currently under maintance. Please wait some time and try again.
if "%module%"=="The server is now currently under maintance. (502)" echo The server is now currently under maintance. Please wait some time and try again.
if "%module%"=="The server is now currently under maintance. (500)" echo The server is now currently under maintance. Please wait some time and try again.
if "%module%"=="Permission error (FTP deleting)" echo You forgot to turn on the NAND Write Access in Boot Settings in WiiXplorer.
if "%module%"=="Downloading nwc24msg.cfg from your Wii (FTP)" echo There was an error while downloading nwc24msg.cfg from your Wii.
if "%module%"=="Checking Connection to Wii (FTP)" echo The IP is incorrect or the patcher could not connect to the Wii.

if "%module%"=="CURL failure (Local)" echo CURL failed. Could be a server side problem.

echo       Press any key to return to main menu.
echo ---------------------------------------------------------------------------------------------------------------------------
echo           :mdmmmo-mNNNNNNNNNNdyo++sssyNMMMMMMMMMhs+-                  
echo          .+mmdhhmmmNNNNNNmdysooooosssomMMMNNNMMMm                     
echo          o/ossyhdmmNNmdyo+++oooooosssoyNMMNNNMMMM+                    
echo          o/::::::://++//+++ooooooo+oo++mNMMmNNMMMm                    
echo         `o//::::::::+////+++++++///:/+shNMMNmNNmMM+                   
echo         .o////////::+++++++oo++///+syyyymMmNmmmNMMm                   
echo         -+//////////o+ooooooosydmdddhhsosNMMmNNNmho            `:/    
echo         .+++++++++++ssss+//oyyysso/:/shmshhs+:.          `-/oydNNNy   
echo           `..-:/+ooss+-`          +mmhdy`           -/shmNNNNNdy+:`   
echo                   `.              yddyo++:    `-/oymNNNNNdy+:`        
echo                                   -odhhhhyddmmmmmNNmhs/:`             
echo                                     :syhdyyyyso+/-`                   
pause>NUL
goto 1
:end
set /a exiting=10
set /a timeouterror=1
timeout 1 /nobreak >NUL && set /a timeouterror=0
goto end1
:end1
mode %mode%
cls
echo.
echo RiiConnect24 Mail Patcher - (C) KcrPL, (C) Spotlight v%version% (Compiled on %last_build% at %at%)
echo ------------------------------------------------------------------------------------------------------------------------------ 
echo  [*] Thanks for using the Patcher! :)
echo.
echo Patching is done.
echo.
echo.
echo Exiting the patcher in...
if %exiting%==10 echo :----------: 10
if %exiting%==9 echo :--------- : 9
if %exiting%==8 echo :--------  : 8
if %exiting%==7 echo :-------   : 7
if %exiting%==6 echo :------    : 6
if %exiting%==5 echo :-----     : 5
if %exiting%==4 echo :----      : 4
if %exiting%==3 echo :---       : 3
if %exiting%==2 echo :--        : 2
if %exiting%==1 echo :-         : 1
if %exiting%==0 echo :          :
if %exiting%==0 exit
if %timeouterror%==0 timeout 1 /nobreak >NUL
if %timeouterror%==1 ping localhost -n 2 >NUL
set /a exiting=%exiting%-1
goto end1