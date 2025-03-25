@echo off
git pull -X theirs
rd /s /q _build
python -m sphinx.cmd.build -M html . _build
start _build\html\index.html