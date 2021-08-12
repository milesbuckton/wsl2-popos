@echo off

SET BASE_PATH=%~dp0

echo Copy WSL2 kernel config...

cd ..
cd config
copy .wslconfig %USERPROFILE%
cd ..

echo Copy WSL2 kernel image...

wsl --shutdown
cd bin\kernel
copy vmlinux %USERPROFILE%

echo Update WSL2 kernel config...

cd %USERPROFILE%
cscript //B "%BASE_PATH%ReplaceText.vbs" .wslconfig $userprofile %USERPROFILE%
cscript //B "%BASE_PATH%ReplaceText.vbs" .wslconfig \ \\
echo %TAB% %TAB% %TAB% %TAB% %TAB% %TAB% %TAB% %TAB% 1 file(s) updated.
