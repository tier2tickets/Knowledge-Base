@echo off
git pull
rd /s /q _build\html
make html