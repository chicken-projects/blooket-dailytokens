@echo off
setlocal enabledelayedexpansion
set sp=%programdata%\script
if not exist !sp! md !sp!
if not exist !sp!\blookettoken (
	set /p blookettoken="what is your blooket cookie? "
	echo !blookettoken! >!sp!\blookettoken
) else set /p blookettoken=<!sp!\blookettoken
set /p id="what is the id? "
set /p tokens="how much tokens? "
set /p xp="how much xp? "
curl -X PUT "https://factory.blooket.com/api/users/add-rewards" ^
-H "Content-Type: application/json" ^
-H "Accept: application/json, text/plain, */*" ^
-H "Origin: https://factory.blooket.com" ^
-H "Referer: https://factory.blooket.com/play/factory/final" ^
-H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36" ^
-H "Cookie: "!blookettoken!" ^
--data "{\"t\": \"!id!\", \"addedTokens\": !tokens!, \"addedXp\": !xp!}"
pause
endlocal