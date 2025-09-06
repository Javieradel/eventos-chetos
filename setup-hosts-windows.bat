@echo off
REM Script para agregar eventos-chetos.local al archivo hosts de Windows
REM Debe ejecutarse como Administrador

set DOMAIN=eventos-chetos.local
set HOST_ENTRY=127.0.0.1 %DOMAIN%
set HOSTS_FILE=%SystemRoot%\System32\drivers\etc\hosts

echo Configurando host %DOMAIN% para desarrollo...

REM Verificar si se ejecuta como administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo ❌ ERROR: Este script debe ejecutarse como Administrador
    echo.
    echo Instrucciones:
    echo 1. Click derecho en "Simbolo del sistema" o "PowerShell"
    echo 2. Seleccionar "Ejecutar como administrador"
    echo 3. Ejecutar nuevamente este script
    echo.
    pause
    exit /b 1
)

REM Verificar si ya existe la entrada
findstr /i "%DOMAIN%" "%HOSTS_FILE%" >nul 2>&1
if %errorLevel% equ 0 (
    echo.
    echo ⚠️  El host %DOMAIN% ya existe en %HOSTS_FILE%
    echo Entrada actual:
    findstr /i "%DOMAIN%" "%HOSTS_FILE%"
) else (
    echo Agregando %DOMAIN% a %HOSTS_FILE%...
    
    REM Agregar entrada al archivo hosts
    echo. >> "%HOSTS_FILE%"
    echo # Desarrollo - Eventos Chetos >> "%HOSTS_FILE%"
    echo %HOST_ENTRY% >> "%HOSTS_FILE%"
    
    if %errorLevel% equ 0 (
        echo.
        echo ✅ Host %DOMAIN% agregado exitosamente
        echo Ahora puedes acceder a la aplicación en: http://%DOMAIN%
    ) else (
        echo.
        echo ❌ Error al agregar el host. Verifica permisos de administrador.
        exit /b 1
    )
)

echo.
echo Para verificar la configuración:
echo curl -I http://%DOMAIN%
echo.
echo O abre http://%DOMAIN% en tu navegador
echo.
pause