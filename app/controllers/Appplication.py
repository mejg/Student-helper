from bottle import template, request,response,redirect


class Application():
    def __init__(self):
        self.pages = {
            'home_page' : self.home_page
        #     'cadastrar': self.cadastrar,
        #     'perfil-cliente': self.perfil_cliente,
        #     'perfil-prestador': self.perfil_prestador,
        #     'pedidos': self.pedidos,
        #     'meus-pedidos': self.meus_pedidos,
        #     'pedidos-criar': self.pedidos_criar,
        #     'servicos': self.servico,
        #     'mensagens': self.mensagens,
        }

    def render(self, page):
        content = self.pages.get(page)
        return content()


    def home_page(self):
        usuario=request.get_cookie('usuario_id')
        #tipo=request.get_cookie('tipo_usuario')
        if not usuario:
            return template("app/views/home_page.tpl")
        return template('app/views/home_page_logada.tpl')

    def login(self):
        return template('app/views/login.tpl')

    def login_post(self):
        email=request.forms.get('email')
        senha=request.forms.get('senha')
        #TODO: Usuario.autenticar(email,senha)

    def logout(self):
        response.delete_cookie('usuario_id')
        redirect('/login')

    def cadastrar(self):
        return template('app/views/cadastrar.tpl')

    def cadastrar_post(self):
        nome=request.forms.get('nome')
        email=request.forms.get('email')
        senha=request.foms.get('senha')
        tipo=request.forms.get('tipo')

        #TODO: Usuario.cadastrar_usuario(nome,email,senha,tipo)

    def 