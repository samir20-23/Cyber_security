@echo off
echo === Starting Laravel project setup ===
echo.


composer -v >nul 2>&1
if %errorlevel% neq 0 (
    echo Composer is not installed. Please install Composer first.
    pause
    exit /b
)


set project_name=My_App_Laravel


echo Creating Laravel project "%project_name%"...
composer create-project --prefer-dist laravel/laravel %project_name%


cd %project_name%


echo Installing npm dependencies...
npm install


echo Setting up .env file...
copy .env.example .env


echo Changing DB_CONNECTION to mysql...
powershell -Command "(Get-Content .env) -replace 'DB_CONNECTION=sqlite', 'DB_CONNECTION=mysql' | Set-Content .env"


echo Generating application key...
php artisan key:generate


echo Running migrations...
php artisan migrate


echo Starting Laravel development server...
php artisan serve

echo Laravel project "%project_name%" is set up and running!
pause
