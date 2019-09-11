@ECHO OFF
ECHO Installing Python 3 for all users and adding `py` and `pip` to PATH

python-3.7.4-amd64.exe /quiet /passive InstallAllUsers=1 PrependPath=1

ECHO Done. Close this Command Prompt window, open another one and try running
ECHO `py` and `pip` from the command line. `py` should open the Python interpreter
ECHO and `pip` should show the 'help' information for pip.
PAUSE
