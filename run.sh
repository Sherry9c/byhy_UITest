$allureDir = ".\allure"
$DT = Get-Date -Format "yyyyMMdd_HHmmss"
$reportDir = "$allureDir\$DT-report"


pytest . -s -v --alluredir="%allure_dir%"

# 强制删除旧目录
if (Test-Path $reportDir) {
    Remove-Item $reportDir -Recurse -Force
}

# 生成报告
allure generate "$allureDir\$DT" -c -o $reportDir --clean

# 验证并打开
if (Test-Path "$reportDir\index.html") {
    allure open $reportDir
} else {
    Write-Error "报告生成失败！"
}