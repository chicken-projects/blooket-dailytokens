@echo off
setlocal enabledelayedexpansion
:start
title daily token and xp claimer ^| by chicken
color E
set sp=%programdata%\script
if not exist !sp! md !sp!
if not exist !sp!\blookettoken (
	set /p blookettoken="what is your blooket cookie? "
	echo !blookettoken! >!sp!\blookettoken
) else set /p blookettoken=<!sp!\blookettoken
set /p id="what is the id? "
if %id%==w (
	del /f !sp!\blookettoken
	set blookettoken=
	goto start
)
set /p tokens="how much tokens? "
set /p xp="how much xp? "

curl -X PUT "https://factory.blooket.com/api/users/factorystats" ^
-H "Accept: application/json, text/plain, */*" ^
-H "Accept-Encoding: gzip, deflate, br, zstd" ^
-H "Accept-Language: en-US,en;q=0.7" ^
-H "Content-Type: application/json" ^
-H "Cookie: !blookettoken!" ^
-H "DNT: 1" ^
-H "Origin: https://factory.blooket.com" ^
-H "Referer: https://factory.blooket.com/play/factory/final" ^
-H "Sec-CH-UA: \"Brave\";v=\"131\", \"Chromium\";v=\"131\", \"Not_A Brand\";v=\"24\"" ^
-H "Sec-CH-UA-Mobile: ?0" ^
-H "Sec-CH-UA-Platform: \"Windows\"" ^
-H "Sec-Fetch-Dest: empty" ^
-H "Sec-Fetch-Mode: cors" ^
-H "Sec-Fetch-Site: same-origin" ^
-H "Sec-GPC: 1" ^
-H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36" ^
--data-raw "{\"t\":\"!id!\",\"place\":1,\"cash\":64,\"playersDefeated\":0,\"correctAnswers\":3,\"upgrades\":1,\"blookUsed\":\"Owl\",\"nameUsed\":\"You\",\"mode\":\"Time-Solo\"}" -o - >nul 2>&1

curl -X PUT "https://factory.blooket.com/api/users/add-rewards" ^
-H "Content-Type: application/json" ^
-H "Accept: application/json, text/plain, */*" ^
-H "Origin: https://factory.blooket.com" ^
-H "Referer: https://factory.blooket.com/play/factory/final" ^
-H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36" ^
-H "Cookie: !blookettoken!" ^
--data "{\"t\": \"!id!\", \"addedTokens\": !tokens!, \"addedXp\": !xp!}" -o -

pause
endlocal
