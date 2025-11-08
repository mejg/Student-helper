from bottle import template

class Application():
    def __init__(self):
        self.pages = {
            'home_page' : self.home_page
        }

    def render(self,page):
        content=self.pages.get(page)
        return content()

    def home_page(self):
        return template("app/views/home_page.tpl")