@echo off
setlocal enabledelayedexpansion

set "erreur=0"
echo [!time!][Hash] Start...
if not "%~1" == "" (
  set "dossier=%~1"
  set "File_sha256=%~2"
  if exist "!Dossier!" (
    CD /D "!Dossier!"
    echo [!time!][Hash] Test des Hash...
    for /f "delims=" %%i in ('type "!File_sha256!"') do (
      set "file=%%~i"
      set "file=!file:~65!"
      set "hashFile=%%~i"
      set "hashFile=!hashFile:~0,64!"
      echo [!time!][Hash] !file!... 
      if exist "!file!" (
        for /f "tokens=1" %%a in ('""!sha256!" "!file!""') do set "hash=%%a"
        if "!hash!" == "!hashFile!" (
          echo [!time!][Hash] !file! : OK 
        ) else (
          echo [!time!][Hash] !file! : Erreur Hash 
          set "erreur=1"
        )
      ) else (
        echo [!time!][Hash] !file! : 404 
        set "erreur=1"
      )
    )
  ) else (
    echo [!time!][Hash] dossier racine : 404 "!Dossier!"
    set "erreur=1"
  )
) else (
  echo [!time!][Hash] aucun argument
)
if "!erreur!" == "0" (
  echo [!time!][Hash] OK 
  set "goto=OK"
) else (
  echo [!time!][Hash] NON 
  set "goto=ERREUR"
)
cd /D "%LECTEUR%"
endlocal & set "goto=%goto%" & set "erreur=%erreur%"