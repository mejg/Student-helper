from bottle import Bottle, run,route, static_file
from app.controllers.Appplication import Application
from bottle import redirect, template, response

app=Bottle()
ctl= Application()

#Rotas:
@app.route('/static/<filepath:path>')
def serve_static(filepath):
    return static_file(filepath, root='./app/static')

@app.route('/', method="get")
def home_page():    return ctl.render('home_page')

@app.route('/login', method="get")
def login():    return ctl.render('')

@app.route('/login', method="post")
def login_post():   return ctl.render('login_post')

@app.route('/logout', method="get")
def logout():    return ctl.render('logout')

@app.route('/cadastrar', method='get')
def cadastrar(): return ctl.render('cadastrar')

@app.route('/cadastrar', method='post')
def cadastrar_post(): return ctl.render('cadastrar_post')



if __name__ == '__main__':

    run(app, host='127.0.0.1', port=8080, debug=True)
