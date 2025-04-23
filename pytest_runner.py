import time
import pytest
from common.file_handler import path_create, read_yaml, file_create

if __name__ == '__main__':
    datas = read_yaml('./config/pytest_config.yaml')
    report_dir = path_create(datas['report_dir'] + f'{time.strftime("%Y%m%d")}')

    report_name = file_create(f'{report_dir}', rf'{time.strftime("%Y%m%d-%H%M%S")}.html')
    # pytest-html生成测试报告
    # pytest.main(['-s', '-v', f'--html={report_name}', './test_login.py'])
    # allure-pytest生成测试报告
    pytest.main(['-s', '-v', f'--alluredir={report_dir}', './test_cases/test_login.py'])

    # pytest.main(['-s', '-v', f'--html={report_name}', './byhy_cases/test_customer.py'])
