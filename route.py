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
def home_page():
    return ctl.render('home_page')

if __name__ == '__main__':

    run(app, host='127.0.0.1', port=8080, debug=True)
