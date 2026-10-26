@echo off
:: Cambiar el código de página a UTF-8 para evitar problemas con tildes o eñes
:: forma abreviada a continuación: 
:: --> robocopy "C:\Users\ricve\OneDrive\ALL PDF" "D:userBackup\ALL PDF" /E /MT:32 /R:3 /W:2 /V /TS /FP
chcp 65001 > nul

echo ===================================================
echo Iniciando proceso de Copias de Seguridad Secuenciales...
echo ===================================================
echo.

:: REEMPLAZA ESTA RUTA por la carpeta exacta donde quieras el reporte:
set "LOG_PATH=C:\userBackup\registro_copia.txt"

:: --- CARPETA 1: ALL PDF ---
echo [1/6] Copiando carpeta "ALL PDF"...
robocopy "%USERPROFILE%\OneDrive\ALL PDF" "C:\userBackup\ALL PDF" /E /MT:32 /R:3 /W:2 /V /TS /FP /LOG+:"%LOG_PATH%" /TEE

:: --- CARPETA 2: Anki Fonts and Files ---
echo [2/6] Copiando carpeta "Anki Fonts and Files"...
robocopy "%USERPROFILE%\OneDrive\Anki Fonts and Files" "C:\userBackup\Anki Fonts and Files" /E /MT:32 /R:3 /W:2 /V /TS /FP /LOG+:"%LOG_PATH%" /TEE

:: --- CARPETA 3: Otros documentos ---
echo [3/6] Copiando carpeta "Otros documentos"...
robocopy "%USERPROFILE%\OneDrive\Otros documentos" "C:\userBackup\Otros documentos" /E /MT:32 /R:3 /W:2 /V /TS /FP /LOG+:"%LOG_PATH%" /TEE

:: --- CARPETA 4: MyCONLANGS ---
echo [4/6] Copiando carpeta "MyCONLANGS"...
robocopy "%USERPROFILE%\OneDrive\MyCONLANGS" "C:\userBackup\MyCONLANGS" /E /MT:32 /R:3 /W:2 /V /TS /FP /LOG+:"%LOG_PATH%" /TEE

:: --- CARPETA 5: Escritorio\Ivette Colegio Medico ---
echo [5/6] Copiando carpeta "Ivette Colegio Medico"...
robocopy "%USERPROFILE%\OneDrive\Escritorio\Ivette Colegio Medico" "C:\userBackup\Ivette Colegio Medico" /E /MT:32 /R:3 /W:2 /V /TS /FP /LOG+:"%LOG_PATH%" /TEE

:: --- CARPETA 6: UNIVERSIDAD ---
echo [5/6] Copiando carpeta "UNIVERSIDAD"...
robocopy "%USERPROFILE%\OneDrive\UNIVERSIDAD" "C:\userBackup\UNIVERSIDAD" /E /MT:32 /R:3 /W:2 /V /TS /FP /LOG+:"%LOG_PATH%" /TEE

echo.
echo ===================================================
echo ¡Proceso Completado con éxito!
echo Puedes revisar el reporte consolidado en: %LOG_PATH%
echo ===================================================
pause
