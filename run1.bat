setlocal enabledelayedexpansion  :: 启用延迟扩展

set PYTHONPATH=%PYTHONPATH%;%cd%      # Windows CMD

for /f "delims=" %%i in ('powershell -c "Get-Date -UFormat '%%Y%%m%%d'"') do (
    set "DT=%%i"
)
set "allure_dir=!current_dir!\allure"
echo %allure_dir%
@REM set "report_dir=!allure_dir!\!DT!-report"
@REM set "allure_dir=.\allure\!DT!"


pytest . -s -v --alluredir="%allure_dir%"
@REM allure generate "%allure_dir%" -o "%allure_dir%-report" --clean
@REM echo "%allure_dir%-report"
@REM allure open "%allure_dir%-report"
@REM
@REM echo '执行完成'

allure generate "!allure_dir!" -c -o "!allure_dir!-report" --clean|| (
    echo 错误：报告生成失败，退出码 %ERRORLEVEL%
    exit /b %ERRORLEVEL%
)



:: 检查报告目录是否存在
if exist "!allure_dir!-report" (
    echo 报告路径："!allure_dir!-report!"
    allure open "!allure_dir!-report!"
) else (
    echo 错误：报告目录未生成！
)