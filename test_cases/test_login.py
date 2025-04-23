import pytest
from selenium import webdriver

from common.browser_driver import webdriver_chrome
from common.file_handler import read_yaml
from po.login_page import LoginPage

data = read_yaml('data/bysms.yaml')


class TestLogin:

    def setup(self):
        self.driver = webdriver_chrome()

        self.page = LoginPage(self.driver)

    def teardown(self):
        self.page._quit()

    @pytest.mark.parametrize('userinfo', data['userinfo'])
    def test_sign(self, userinfo):
        print(data)
        result = self.page.log_in(userinfo)
        assert result
