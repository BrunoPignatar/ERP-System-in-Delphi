@echo off
cd /d "%~dp0"

git rev-list --count HEAD > versao.txt

exit