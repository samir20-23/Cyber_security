@echo off
echo === Starting Laravel project setup ===
echo.

:: Check if Composer is installed
echo Checking if Composer is installed...
composer -v >nul 2>&1
if %errorlevel% neq 0 (
    echo Composer is not installed. Please install Composer first.
    pause
    exit /b
)

:: Set the custom project path
set project_path="C:\C-PROJECT\🐱‍👤🪂LARAVEL"
set project_name=Blog_App_Laravel

:: Create the directory if it doesn't exist
echo Creating directory: %project_path%
if not exist %project_path% (
    mkdir %project_path%
)
pause

:: Navigate to the custom directory
cd %project_path%
echo Navigating to %project_path%

:: Create Laravel project in the specified directory
echo Creating Laravel project "%project_name%"...
composer create-project --prefer-dist laravel/laravel %project_name%
pause

:: Show the path where the project was created
echo Project "%project_name%" created at: %project_path%\%project_name%

:: Navigate to the project directory
cd %project_name%

:: Install npm dependencies
echo Installing npm dependencies...
npm install
pause

:: Set up the .env file
echo Setting up .env file...
copy .env.example .env
pause

:: Change DB_CONNECTION to mysql in .env file
echo Changing DB_CONNECTION to mysql...
powershell -Command "(Get-Content .env) -replace 'DB_CONNECTION=sqlite', 'DB_CONNECTION=mysql' | Set-Content .env"
pause

:: Generate the application key
echo Generating application key...
php artisan key:generate
pause

:: Create models and migrations for Article and Category
echo Creating models and migrations for Article and Category...
php artisan make:model Article -mrc
php artisan make:model Category -mrc
pause

:: Modify Category migration (add name field)
echo Modifying Category migration...
echo $table->string('name'); >> database/migrations/*_create_categories_table.php
pause

:: Modify Article migration (add fields for title, content, and category_id)
echo Modifying Article migration...
echo $table->string('title'); >> database/migrations/*_create_articles_table.php
echo $table->text('content'); >> database/migrations/*_create_articles_table.php
echo $table->foreignId('category_id')->constrained()->onDelete('cascade'); >> database/migrations/*_create_articles_table.php
pause

:: Run migrations
echo Running migrations...
php artisan migrate
pause

:: Start the Laravel development server
echo Starting Laravel development server...
php artisan serve
pause

echo Laravel project "%project_name%" is set up and running!
pause
