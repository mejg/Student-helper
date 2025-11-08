from bottle import Bottle, run,route
from app.controllers.Appplication import Application

app=Bottle()
ctl= Application()

#Rotas:
@app.route('/', method="get")
def home_page():
    return ctl.render('home_page')

if __name__ == '__main__':

    run(app, host='127.0.0.1', port=8080, debug=True)
