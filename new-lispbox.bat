@echo off
if NOT %OS%==Windows_NT goto checkhome
for %%i in ( "%CD%" ) do set LISPBOX_HOME=%%~si%

echo lispbox home is set to %LISPBOX_HOME%
goto start

:checkhome

rem
rem if the environment variable is not defined, dereferencing
rem it produces the same string!
rem

if %LISPBOX_HOME%==%LISPBOX_HOME% goto noenv
:start

set EMACS=%LISPBOX_HOME%/emacs-21.3/bin/runemacs.exe
set TO_EVAL="(progn (load \"lispbox\") (slime))"

%EMACS% --no-init-file --no-site-file --eval=%TO_EVAL%

goto end

:noenv

echo LISPBOX_HOME environment variable should be set and
echo point to the installation directory of LISPBOX before
echo launching this command.  

:end