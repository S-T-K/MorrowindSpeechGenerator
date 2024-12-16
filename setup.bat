@echo off
REM Télécharge et installe Python 3.10

curl -L -o tes3conv.zip https://github.com/Greatness7/tes3conv/releases/download/v0.3.0/windows-latest.zip
powershell -Command "Expand-Archive -Path 'tes3conv.zip'"
xcopy "%cd%\tes3conv" "%cd%" /E /I /Y
del tes3conv.zip
rmdir /S /Q tes3conv


echo Download Python 3.10...
curl -o python-3.10.0.exe https://www.python.org/ftp/python/3.10.0/python-3.10.0-amd64.exe

echo Install Python 3.10...
start /wait python-3.10.0.exe 

echo Restart Computer for complete Python Installation ? (O/N)
set /p choice=
if /i "%choice%"=="O" (
    shutdown /r /t 0
) else (
    echo Restart Canceled.
)

pause

python --version

del python-3.10.0.exe


echo Install Dependencies
powershell -Command "Start-Process 'python' -ArgumentList 'setup.py' -Verb RunAs -Wait"

echo Restart Computer for complete Installation ? (O/N)
set /p choice=
if /i "%choice%"=="O" (
    shutdown /r /t 0
) else (
    echo Restart Canceled.
)

echo Installation Succesful !
python UI.py
pause
