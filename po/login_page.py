from base.base_page import BasePage
from common.file_handler import read_yaml


class LoginPage(BasePage):
    datas = read_yaml('data/login_page.yaml')

    def log_in(self, userinfo):
        print(self.datas['elements']['username_box'])
        self._open(self.datas['url'])
        self._input(self.datas['elements']['username_box'], txt=userinfo['username'])
        self._input(self.datas['elements']['password_box'], txt=userinfo['password'])
        self._click(self.datas['elements']['submit_btn'])
        return self._find(self.datas['elements']['sign_flag'])

    def new_account(self):
        pass

    def forgot_password(self):
        pass
