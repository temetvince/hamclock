@echo off
setlocal EnableDelayedExpansion

:: Check if Docker Desktop is installed
if not exist "C:\Program Files\Docker\Docker\Docker Desktop.exe" (
    echo Docker Desktop is not installed.
    echo Opening Docker Desktop download page...
    start "" "https://www.docker.com/products/docker-desktop/"
    echo Please download and install Docker Desktop using the default options, then run this script again.
    pause
    endlocal
    exit /b 1
)

:: Check if docker command is available
docker --version >nul 2>&1
if errorlevel 1 (
    echo Docker Desktop is installed but the docker command is not accessible.
    echo Please ensure Docker Desktop is properly installed and try again.
    pause
    endlocal
    exit /b 1
)

:: Check if Docker Desktop is running
tasklist | findstr /I "Docker Desktop" >nul
if errorlevel 1 (
    echo Docker Desktop is not running. Starting Docker Desktop...
    start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"
    
    :: Wait until Docker is fully running
    echo Waiting for Docker to start...
    timeout /t 10 /nobreak >nul
    :CHECK_DOCKER
    docker info >nul 2>&1
    if errorlevel 1 (
        echo Docker is still starting, please wait...
        timeout /t 5 /nobreak >nul
        goto CHECK_DOCKER
    )
) else (
    echo Docker Desktop is already running.
)

:: Check if docker-compose.yml exists
if not exist "docker-compose.yml" (
    echo Error: docker-compose.yml not found in current directory.
    pause
    endlocal
    exit /b 1
)

:: Run docker compose
echo Starting docker compose...
docker compose up -d
if errorlevel 1 (
    echo Failed to run docker compose.
    pause
    endlocal
    exit /b 1
)

echo Docker compose started successfully.

:: Wait briefly to ensure the service is up
timeout /t 5 /nobreak >nul

:: Check if HamClock is accessible
echo Checking if HamClock is running...
curl -s -f http://localhost:8081/live.html >nul 2>&1
if errorlevel 1 (
    echo Warning: HamClock is not yet accessible at http://localhost:8081/live.html.
    echo Please check if the service is running correctly.
) else (
    echo Opening HamClock in web browser...
    start "" "http://localhost:8081/live.html"
)

echo Done.
pause
endlocal
exit /b 0
