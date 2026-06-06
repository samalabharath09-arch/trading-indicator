@echo off
echo.
echo ╔══════════════════════════════════════════════╗
echo ║   FOREX ICT / SMC 5-PILLAR SCANNER           ║
echo ║   CB Rate . TRP . OB . FVG/MS . Inst.Flow   ║
echo ╚══════════════════════════════════════════════╝
echo.

where node >nul 2>&1
if %errorlevel% neq 0 (
    echo Node.js not found. Install from https://nodejs.org
    pause & exit /b 1
)

echo Installing server dependencies...
cd server & call npm install --silent & cd ..

echo Installing client dependencies...
cd client & call npm install --silent & cd ..

echo.
echo Backend  : http://localhost:3002
echo Frontend : http://localhost:5174
echo.
echo Open http://localhost:5174 in your browser
echo.

start "Forex Scanner Backend" cmd /k "node server/index.js"
timeout /t 3 /nobreak >nul
cd client && npx vite --port 5174
