
set WDIR=%TEMP%\pythonsrc
set VERSION=%1

if "%VERSION%" == "" (
  echo "����������܂���B�A�b�v�f�[�g�������o�[�W�������w�肵�Ă��������B"
  echo "��: pythonupgrade.bat 3.7.2"
  pause
  exit /b 1
)

rd /s /q %WDIR%
mkdir %WDIR%
cd %WDIR%
C:

wget https://www.python.org/ftp/python/%VERSION%/amd64/core.msi
wget https://www.python.org/ftp/python/%VERSION%/amd64/dev.msi
wget https://www.python.org/ftp/python/%VERSION%/amd64/doc.msi
wget https://www.python.org/ftp/python/%VERSION%/amd64/exe.msi
wget https://www.python.org/ftp/python/%VERSION%/amd64/launcher.msi
wget https://www.python.org/ftp/python/%VERSION%/amd64/lib.msi
wget https://www.python.org/ftp/python/%VERSION%/amd64/path.msi
wget https://www.python.org/ftp/python/%VERSION%/amd64/test.msi
wget https://www.python.org/ftp/python/%VERSION%/amd64/pip.msi
wget https://www.python.org/ftp/python/%VERSION%/amd64/tcltk.msi
wget https://www.python.org/ftp/python/%VERSION%/amd64/tools.msi
wget https://www.python.org/ftp/python/%VERSION%/amd64/ucrt.msi

mkdir %WDIR%\python
msiexec /a core.msi targetdir=%WDIR%\python /qn
msiexec /a dev.msi targetdir=%WDIR%\python /qn
msiexec /a doc.msi targetdir=%WDIR%\python /qn
msiexec /a exe.msi targetdir=%WDIR%\python /qn
msiexec /a launcher.msi targetdir=%WDIR%\python /qn
msiexec /a lib.msi targetdir=%WDIR%\python /qn
msiexec /a path.msi targetdir=%WDIR%\python /qn
msiexec /a test.msi targetdir=%WDIR%\python /qn
msiexec /a pip.msi targetdir=%WDIR%\python /qn
msiexec /a tcltk.msi targetdir=%WDIR%\python /qn
msiexec /a tools.msi targetdir=%WDIR%\python /qn
msiexec /a ucrt.msi targetdir=%WDIR%\python /qn

del python\*.msi
del *.msi
del python\py.exe
del python\pyw.exe
del python\pyshellext*.dll
del python\NEWS.txt

move python\api-*.dll python\DLLs\
move python\ucrtbase.dll python\DLLs\

copy Y:\usr\local\python\*pth python\
copy Y:\usr\local\python\Lib\site-packages\custom.pth python\Lib\site-packages\

REM rd /s /q Y:\usr\local\python
REM move python Y:\usr\local\

rem wget https://www.python.org/ftp/python/%VERSION%/python-%VERSION%-embed-amd64.zip

wget --no-check-certificate https://raw.githubusercontent.com/pypa/get-pip/master/get-pip.py
REM python get-pip.py
REM del get-pip.py

REM pip install -r %APPROOT%\dotfile\python\requirements.txt
REM pip install -r %APPROOT%\dotfile\python\requirements_win.txt
