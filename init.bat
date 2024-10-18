@echo off
:: Definir directorio base del proyecto
set BASE_DIR=%~dp0
set VENV_DIR=%BASE_DIR%venv
set LOG_FILE=%BASE_DIR%log.txt

:: Limpiar el archivo log si existe
if exist %LOG_FILE% del %LOG_FILE%

:: Verificar si el entorno virtual (venv) existe
if not exist %VENV_DIR% (
    echo Creando el entorno virtual de Python...
    python -m venv %VENV_DIR% 1>>%LOG_FILE% 2>&1
    if %ERRORLEVEL% neq 0 (
        echo Error al crear el entorno virtual. >> %LOG_FILE%
        goto :error
    )
)

:: Activar el entorno virtual
echo Activando el entorno virtual...
call %VENV_DIR%\Scripts\activate 1>>%LOG_FILE% 2>&1
if %ERRORLEVEL% neq 0 (
    echo Error al activar el entorno virtual. >> %LOG_FILE%
    goto :error
)

:: Instalar dependencias desde requirements.txt
echo Instalando dependencias...
pip install -r %BASE_DIR%requirements.txt 1>>%LOG_FILE% 2>&1
if %ERRORLEVEL% neq 0 (
    echo Error al instalar dependencias. >> %LOG_FILE%
    goto :error
)

:: Iniciar el programa
echo Iniciando el programa...
python %BASE_DIR%main.py 1>>%LOG_FILE% 2>&1
if %ERRORLEVEL% neq 0 (
    echo Error al iniciar el programa. >> %LOG_FILE%
    goto :error
)

:: Si todo fue correcto, salir sin mostrar consola
goto :end

:error
:: Si ocurre un error, mostrar el archivo de log y pausar
echo Ocurrió un error. Mostrando detalles...
type %LOG_FILE%
pause

:end
exit
