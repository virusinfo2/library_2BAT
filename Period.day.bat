for /f "tokens=1-4 delims=/.- " %%a in ("%date%") do (
    set "day=%%a"
    set "month=%%b"
    set "year=%%c"
)
if "%day:~0,2%" lss "32" (
    set "day=%day:~0,2%"
    set "month=%month:~0,2%"
    set "year=%year:~0,4%"
) else (
    set "day=%month:~0,2%"
    set "month=%day:~0,2%"
    set "year=%year:~0,4%"
)
set "day=0%day%"
set "month=0%month%"
set "day=%day:~-2%"
set "month=%month:~-2%"