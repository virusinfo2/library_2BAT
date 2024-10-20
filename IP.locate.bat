call "%curl%" "https://ipinfo.io/%~1">"%temp%\%~1.json"
for /f "tokens=2 delims=:," %%a in ('findstr /c:"\"country\":" "%temp%\%~1.json"') do set "country=%%a"
set "country=!country:"=!"
set "country=!country: =!"