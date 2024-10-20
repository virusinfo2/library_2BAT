@echo off
setlocal enabledelayedexpansion
set "output="
for /F "delims=" %%A in ('more') do (
    set "output=!output! %%A"
)

set "WEBHOOK_URL=https://discordapp.com/api/webhooks/"
set "MESSAGE=!output!"
set "BOT_NAME=SUS Bot"
echo %MESSAGE%
call "curl" -H "Content-Type: application/json" -X POST -d "{\"username\": \"!BOT_NAME!\", \"content\": \"!MESSAGE!\"}" "!WEBHOOK_URL!" >nul 2>&1
