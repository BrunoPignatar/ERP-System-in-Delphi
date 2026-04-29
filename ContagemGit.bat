@echo off

cd /d "%~dp0"

if not exist ".git" (
  echo NAO EH REPOSITORIO GIT > versao.txt
  exit
)

git rev-list --count HEAD > versao.txt