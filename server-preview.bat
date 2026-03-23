@echo off
cd /d "%~dp0"

set "PYTHON_EXE=%LocalAppData%\Programs\Python\Python312\python.exe"
set "PY_EXE=%LocalAppData%\Programs\Python\Launcher\py.exe"
set "URL=http://127.0.0.1:8000"

if exist "%PYTHON_EXE%" (
  echo Starting local server at %URL%
  start "" %URL%
  "%PYTHON_EXE%" -m http.server 8000 --bind 127.0.0.1
  goto :eof
)

if exist "%PY_EXE%" (
  echo Starting local server at %URL%
  start "" %URL%
  "%PY_EXE%" -m http.server 8000 --bind 127.0.0.1
  goto :eof
)

echo Python was not found in the expected install location.
echo Falling back to the PowerShell preview server.
powershell -ExecutionPolicy Bypass -File "%~dp0server-preview.ps1"
pause
