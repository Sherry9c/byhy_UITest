setlocal enabledelayedexpansion  :: 启用延迟扩展
set PYTHONPATH=%PYTHONPATH%;%cd%      # Windows CMD

set "allure_dir=.\allure"

pytest . -s -v --alluredir="%allure_dir%" --clean-alluredir

allure generate "%allure_dir%" -c|| (
    echo 错误：报告生成失败，退出码 %ERRORLEVEL%
@REM     exit /b %ERRORLEVEL%
)

if exist "!allure_dir!-report" (
    echo 报告路径："!allure_dir!-report!"
    start "" "!allure_dir!-report\index.html"
@REM     allure open "!allure_dir!-report!"
) else (
    echo 错误：报告目录未生成！
)