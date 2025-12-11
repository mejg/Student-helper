from bottle import Bottle, run, route, static_file
from app.controllers.Appplication import Application
from bottle import redirect, template, request
from app.models.Pedidos import PedidoAcademico

app = Bottle()
ctl = Application()


# Rotas
# rotas login:
@app.route('/static/<filepath:path>', method='GET')
def serve_static(filepath):
    return static_file(filepath, root='./app/static')


@app.route('/', method="get")
def home_page():    return ctl.render('home_page')


@app.route('/login', method="get")
def login():    return ctl.render('login')


@app.route('/login_post', method="post")
def login_post():   return ctl.render('login_post')


@app.route('/logout', method=['get', 'post'])
def logout():    return ctl.render('logout')


# rotas cadastro:
@app.route('/cadastrar', method='get')
def cadastrar(): return ctl.render('cadastrar')


@app.route('/cadastrar_post', method='post')
def cadastrar_post(): return ctl.render('cadastrar_post')


# rotas perfil:
@app.route('/perfil', method='get')  # arrumar rota dinamica e de edit
def perfil(): return ctl.render('perfil')


# rotas pedidos:
@app.route('/pedidos', method='get')
def pedidos(): return ctl.render('pedidos')


@app.route('/pedidos_criar', method='get')
def pedidos_criar(): return ctl.render('pedidos_criar')


@app.route('/pedidos_criar', method='post')
def pedidos_criar_post(): return ctl.render('pedidos_criar_post')


@app.route('pedidos_edit', method='get')
def pedidos_edit(): return ctl.render('pedidos_edit')


@app.route('pedidos_edit', method='post')
def pedidos_edit_post(): return ctl.render('pedidos_edit_post')


@app.route('/pedidos_aceitar/<pedido_id:int>', method='post')
def pedidos_aceitar(): return ctl.render('pedidos_aceitar')


@app.route('/pedidos-delete/<pedido_id:int>', method=['get', 'post'])
def pedidos_del(pedido_id): return ctl.pedidos_delete(pedido_id)


@app.route('/avaliar', method='get')
def avaliar_get(): return ctl.render('avaliar_get')


@app.route('/avaliar', method='post')
def avaliar_post(): return ctl.render('avaliar_post')


@app.route('/chat/<idPedido>')
def chat(idPedido):
    usuario_id = request.get_cookie('usuario_id')
    tipo = request.get_cookie('tipo_usuario')

    if not usuario_id or not tipo:
        return "Você não está logado."

    pedido = PedidoAcademico.buscar_por_id(idPedido)
    if not pedido:
        return "Pedido não encontrado."

    # Mensagem padrão de permissão negada
    mensagem_negada = "Você não tem permissão para entrar nesta sala de chat."

    if tipo == 'cliente':
        if usuario_id != pedido.autor_id:
            return mensagem_negada
    elif tipo == 'prestador':
        if usuario_id != pedido.prestador_id:
            return mensagem_negada
    else:
        return mensagem_negada


    return template('app/views/chat', idPedido=idPedido, )

if __name__ == '__main__':
    run(app, host='127.0.0.1', port=8080, debug=True, reloader=True)
