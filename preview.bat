@echo off
git pull
rd /s /q _build\html
call make_dnu.bat html
start _build\html\index.html