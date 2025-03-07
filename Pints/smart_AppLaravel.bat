@echo off
echo === Starting Laravel project setup ===
echo.

:: Check if Composer is installed
composer -v >nul 2>&1
if %errorlevel% neq 0 (
    echo Composer is not installed. Please install Composer first.
    pause
    exit /b
)

:: Define project name
set project_name=My_App_Laravel

:: Define base project directory
set project_base_dir="C:\C-PROJECT\🐱‍👤🪂LARAVEL"

:: Create Laravel project
echo Creating Laravel project "%project_name%"...
composer create-project --no-install laravel/laravel %project_name%

:: Navigate into the project directory
cd %project_name%

:: Copy vendor folder from another directory
echo Copying vendor folder...
mkdir vendor
xcopy "%project_base_dir%\💲Ecommerc\Ecommerce_App\App_ecommerce_main\vendor" "./vendor" /E /H /Y

:: Install npm dependencies
echo Installing npm dependencies...
npm install

:: Set up .env file
echo Setting up .env file...
copy .env.example .env

:: Change DB_CONNECTION to mysql in .env
echo Changing DB_CONNECTION to mysql...
powershell -Command "(Get-Content .env) -replace 'DB_CONNECTION=sqlite', 'DB_CONNECTION=mysql' | Set-Content .env"

:: Update MySQL credentials (adjust this part as needed)
echo Setting up MySQL credentials...
powershell -Command "(Get-Content .env) -replace 'DB_HOST=127.0.0.1', 'DB_HOST=localhost' | Set-Content .env"
powershell -Command "(Get-Content .env) -replace 'DB_PORT=3306', 'DB_PORT=3306' | Set-Content .env"
powershell -Command "(Get-Content .env) -replace 'DB_DATABASE=laravel', 'DB_DATABASE=my_database' | Set-Content .env"
powershell -Command "(Get-Content .env) -replace 'DB_USERNAME=root', 'DB_USERNAME=root' | Set-Content .env"
powershell -Command "(Get-Content .env) -replace 'DB_PASSWORD=', 'DB_PASSWORD=my_password' | Set-Content .env"

:: Generate application key
echo Generating application key...
php artisan key:generate

:: Run migrations
echo Running migrations...
php artisan migrate

:: Start Laravel development server
echo Starting Laravel development server...
php artisan serve

echo Laravel project "%project_name%" is set up and running!
pause
