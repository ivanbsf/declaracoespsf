@echo off
REM ===============================================
REM Script para compilar um projeto Python em .exe
REM ===============================================
setlocal

REM Nome do script principal (edite se necessário)
set SCRIPT=01-CVStoJS.py

REM Nome do ícone (edite se quiser usar um .ico próprio)
set ICON=icon.ico

REM Instalar o PyInstaller (caso não esteja instalado)
pip show pyinstaller >nul 2>&1
if %errorlevel% neq 0 (
    echo Instalando PyInstaller...
    pip install pyinstaller
)

REM Escolha do modo de compilação
echo ===============================================
echo Escolha o modo de compilação:
echo [1] Com console (janela preta aparece)
echo [2] Sem console (oculta terminal)
echo ===============================================
set /p choice="Digite sua escolha (1 ou 2): "

if "%choice%"=="1" (
    echo 🔹 Compilando COM console...
    pyinstaller --onefile --console --icon=%ICON% %SCRIPT%
) else if "%choice%"=="2" (
    echo 🔹 Compilando SEM console...
    pyinstaller --onefile --noconsole --icon=%ICON% %SCRIPT%
) else (
    echo ❌ Opcao invalida!
    pause
    exit /b
)

echo.
echo ✅ Compilação concluída!
echo O executável está na pasta "dist"
pause
endlocal
