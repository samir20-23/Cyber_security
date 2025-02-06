@echo off
echo === Starting your apps ===
echo.

:: Open GitHub in Chrome
start chrome https://github.com/samir20-23?tab=repositories
echo Opened GitHub!

:: Open Local Development Server (127.0.0.1) in Chrome
start chrome http://127.0.0.1:8000/
echo Opened Localhost!

:: Open ChatGPT in Chrome
start chrome https://chatgpt.com/
echo Opened ChatGPT!

:: Open deepseek in Chrome
start chrome https://chat.deepseek.com/
echo Opened deepseek!

:: Open Visual Studio Code with a specific project folder
start code "C:\C-PROJECT"
echo Opened Visual Studio Code with your project!

:: open typing app
start chrome https:://monkeytype.com 
echo typing app is opened

:: open youtube app
start chrome https:://youtube.com 
echo youtube app is opened

echo.
echo All apps opened!
pause
