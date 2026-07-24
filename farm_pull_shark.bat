@echo off
setlocal enabledelayedexpansion

for /l %%i in (1,1,64) do (
    echo =========================
    echo UPDATE %%i
    echo =========================

    git checkout main
    git pull origin main

    git checkout -b update-%%i

    echo update %%i>> log.txt

    git add .
    git commit ^
    -m "update %%i" ^
    -m "Co-authored-by: AdmintarOfficial <guitar.watchara@gmail.com>"

    git push origin update-%%i

    gh pr create ^
    --title "update %%i" ^
    --body "auto PR %%i" ^
    --base main ^
    --head update-%%i

    gh pr merge update-%%i --merge --admin --delete-branch
)

echo DONE 64 PRs
pause