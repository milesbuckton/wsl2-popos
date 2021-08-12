@echo off

SET BASE_PATH=%~dp0
SET BASE_PATH=%BASE_PATH:\scripts=%

echo Extracting distribution...

cd "C:\Program Files\7-Zip"
7z.exe e "%BASE_PATH%sources\popos.tar.gz.001" -o"%BASE_PATH%sources"
