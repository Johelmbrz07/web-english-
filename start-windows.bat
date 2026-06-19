@echo off
REM ============================================================
REM  LinguaAI - lanzador local para Windows
REM  Sirve la app en http://localhost:8000 y la abre en el navegador.
REM  Doble clic para usar. (Requiere Python, o Node como alternativa.)
REM ============================================================
cd /d "%~dp0"
set PORT=8000
set PAGE=WEBENGLISHPRACTICE.html

echo.
echo  Iniciando LinguaAI en http://localhost:%PORT%/%PAGE%
echo  (Deja esta ventana abierta mientras usas la app. Cierrala para apagar el servidor.)
echo.

REM Abre el navegador despues de 2 segundos (en segundo plano)
start "" cmd /c "timeout /t 2 >nul & start http://localhost:%PORT%/%PAGE%"

REM Intenta con Python, luego py, luego Node
where python >nul 2>nul
if %errorlevel%==0 (
  python -m http.server %PORT%
  goto :eof
)
where py >nul 2>nul
if %errorlevel%==0 (
  py -m http.server %PORT%
  goto :eof
)
where npx >nul 2>nul
if %errorlevel%==0 (
  npx --yes serve -l %PORT%
  goto :eof
)

echo.
echo  No se encontro Python ni Node.
echo  Instala Python desde https://www.python.org/downloads/ (marca "Add to PATH")
echo  y vuelve a ejecutar este archivo.
echo.
pause
