@echo off
:: Cambiar el código de página a UTF-8 para evitar problemas con tildes o eñes
:: forma abreviada a continuación: 
:: --> robocopy "C:\...\OneDrive\ALL PDF" "D:userBackup\ALL PDF" /E /MT:32 /R:3 /W:2 /V /TS /FP
chcp 65001 > nul

echo ===================================================
echo Iniciando proceso de Copias de Seguridad Secuenciales...
echo ===================================================
echo.

:: REEMPLAZA ESTA RUTA por la carpeta exacta donde quieras el reporte:
set "MY_FOLDER=C:\oldBackup"
set "MY_BACK=C:\newBackup"
set "LOG_PATH=%MY_FOLDER%\registro_copia.txt"

:: --- CARPETA 1: ALL_PDF ---
echo [1/6] Copiando carpeta "ALL_PDF"...
robocopy "%MY_FOLDER%\ALL_PDF" "%MY_BACK%\ALL_PDF" /E /MT:32 /R:3 /W:2 /V /TS /FP /LOG+:"%LOG_PATH%" /TEE

:: --- CARPETA 2: ANKI ---
echo [2/6] Copiando carpeta "ANKI"...
robocopy "%MY_FOLDER%\ANKI" "%MY_BACK%\ANKI" /E /MT:32 /R:3 /W:2 /V /TS /FP /LOG+:"%LOG_PATH%" /TEE

:: --- CARPETA 3: DOCS ---
echo [3/6] Copiando carpeta "DOCS"...
robocopy "%MY_FOLDER%\DOCS" "%MY_BACK%\DOCS" /E /MT:32 /R:3 /W:2 /V /TS /FP /LOG+:"%LOG_PATH%" /TEE

:: --- CARPETA 4: CONLANGS ---
echo [4/6] Copiando carpeta "CONLANGS"...
robocopy "%MY_FOLDER%\CONLANGS" "%MY_BACK%\CONLANGS" /E /MT:32 /R:3 /W:2 /V /TS /FP /LOG+:"%LOG_PATH%" /TEE

:: --- CARPETA 5: IVETTE ---
echo [5/6] Copiando carpeta "IVETTE"...
robocopy "%MY_FOLDER%\IVETTE" "%MY_BACK%\IVETTE" /E /MT:32 /R:3 /W:2 /V /TS /FP /LOG+:"%LOG_PATH%" /TEE

:: --- CARPETA 6: UNIVERSIDAD ---
echo [6/6] Copiando carpeta "UNIVERSIDAD"...
robocopy "%MY_FOLDER%\UNIVERSIDAD" "%MY_BACK%\UNIVERSIDAD" /E /MT:32 /R:3 /W:2 /V /TS /FP /LOG+:"%LOG_PATH%" /TEE

echo.
echo ===================================================
echo ¡Proceso Completado con éxito!
echo Puedes revisar el reporte consolidado en: %LOG_PATH%
echo ===================================================
pause
