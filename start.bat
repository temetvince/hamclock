@echo off
echo Checking if Docker Desktop is installed...

:: Check if Docker Desktop is installed by checking if 'docker' command is available
where docker >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Docker Desktop not found. Starting installation...

    :: Check if system is 64-bit
    reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" >nul
    if %ERRORLEVEL% == 0 (
        echo Error: Docker Desktop requires a 64-bit operating system.
        pause
        exit /b 1
    )

    :: Check if WSL 2 is enabled
    wsl --list --verbose | findstr /I "2" >nul
    if %ERRORLEVEL% NEQ 0 (
        echo Enabling WSL 2...
        wsl --install
        echo Please restart your computer after WSL installation completes and rerun this script.
        pause
        exit /b 0
    )

    echo Downloading Docker Desktop Installer...
    :: Download Docker Desktop Installer
    powershell -Command "Invoke-WebRequest -Uri 'https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe' -OutFile 'DockerDesktopInstaller.exe'"

    if not exist DockerDesktopInstaller.exe (
        echo Error: Failed to download Docker Desktop Installer.
        pause
        exit /b 1
    )

    echo Installing Docker Desktop...
    :: Run the installer silently with WSL 2 backend and accept license
    start /wait DockerDesktopInstaller.exe install --accept-license --backend=wsl-2

    if %ERRORLEVEL% NEQ 0 (
        echo Error: Docker Desktop installation failed.
        pause
        exit /b 1
    )

    echo Cleaning up...
    del DockerDesktopInstaller.exe

    echo Adding user to docker-users group...
    net localgroup docker-users %USERNAME% /add

    echo Configuring Docker Desktop to start automatically on login...
    :: Create or update settings-store.json to enable auto-start
    powershell -Command ^
        "$settingsPath = \"$env:APPDATA\Docker\settings-store.json\"; " ^
        "if (-not (Test-Path $settingsPath)) { " ^
        "   New-Item -Path $settingsPath -ItemType File -Force; " ^
        "   Set-Content -Path $settingsPath -Value '{\"startOnUserLogin\":true}'; " ^
        "} else { " ^
        "   $json = Get-Content $settingsPath | ConvertFrom-Json; " ^
        "   if (-not $json.startOnUserLogin) { " ^
        "       $json | Add-Member -MemberType NoteProperty -Name startOnUserLogin -Value $true -Force; " ^
        "       $json | ConvertTo-Json | Set-Content $settingsPath; " ^
        "   } " ^
        "}"

    echo Docker Desktop installed successfully.
    echo Please restart your computer to complete the setup, then rerun this script to start HamClock.
    pause
    exit /b 0
)

echo Checking if Docker Desktop is running...
:: Check if Docker daemon is running by attempting to query Docker info
docker info >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Docker Desktop is not running. Attempting to start Docker Desktop...
    start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe" || (
        echo Warning: Could not find Docker Desktop at default location. Please start Docker Desktop manually.
    )
    :: Wait up to 30 seconds for Docker to start
    timeout /t 30 /nobreak >nul
    docker info >nul 2>&1
    if %ERRORLEVEL% NEQ 0 (
        echo Error: Failed to start Docker Desktop. Please start it manually and try again.
        pause
        exit /b 1
    )
)

echo Checking if HamClock container is running...
:: Check if any containers defined in docker-compose.yml are running
docker compose ps -q >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo No containers running. Starting HamClock via Docker Compose...
    docker compose up -d
    if %ERRORLEVEL% NEQ 0 (
        echo Error: Failed to start Docker Compose.
        pause
        exit /b 1
    )
    :: Wait to ensure the web server is ready
    timeout /t 10 /nobreak >nul
) else (
    echo HamClock container is already running.
)

echo Opening HamClock in web browser...
start "" "http://localhost:8081/live.html"
exit
