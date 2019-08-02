@echo off
git pull
rd /s /q _build
sphinx-build -M html . _build
start _build\html\index.html