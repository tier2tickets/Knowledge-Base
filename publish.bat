@echo off
git pull -X theirs
git add .
git commit
git push
start http://docs.tier2tickets.com/_api/update.php