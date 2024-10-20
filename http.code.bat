@echo off
setlocal enabledelayedexpansion
set "goto=rien"
set "erreur=0"
set "URL=%~1"
for /f "tokens=1" %%a in ('call "%curl%" -s --max-time 2 --max-filesize 15K -o nul -w "%%{http_code}" "!url!"') do set "http_code=%%a"

if /I "%~2" == "Gestion" (
  if not "!http_code!" == "200" (
    echo [ !time! ] [!http_code!] [!URL!]
    call "%LECTEUR%\systeme\erreur\erreur14.vbs"
    if /I "%~3" == "IfNot200Exit" (
      Exit
    )
  )
)
set "erreur=!http_code!"
endlocal & set "erreur=%erreur%" & set "http_code=%http_code%"