@echo off
git pull
rd /s /q _build\html
sphinx-build -M html . _build html
start _build\html\index.html