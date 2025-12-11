from bottle import template, request, response, redirect
import os
import uuid
from app.controllers.DataRecord import DataRecord
from app.models.Pedidos import PedidoAcademico
from app.models.Usuario import Usuario
from app.models.Aluno_prestador import Aluno_prestador
from app.models.Aluno_cliente import Aluno_cliente


class Application():
    def __init__(self):
        # self.models = DataRecord(filename = "app_data.json") #falata .json ainda
        self.pages = {
            'home_page': self.home_page,
            'login': self.login,
            'login_post': self.login_post,
            'logout': self.logout,
            'cadastrar': self.cadastrar,
            'cadastrar_post': self.cadastrar_post,
            'perfil': self.perfil,
            'pedidos': self.pedidos,
            'pedidos_criar': self.pedidos_criar,
            'pedidos_edit': self.pedidos_edit,
            'pedidos_edit_post': self.pedidos_edit_post,
            'pedidos_aceitar':self.pedidos_aceitar,
            'pedidos_criar_post': self.pedidos_criar_post,
            'pedidos_deletar_post': self.pedidos_delete,
            'avaliar_get':self.avaliar_get,
            'avaliar_post': self.avaliar_post,
            'chat' : self.chat
        }

        # Usuario.todos_usuarios.clear()
        # PedidoAcademico.todos_pedidos.clear()
        # self.models.read(Usuario.todos_usuarios, PedidoAcademico.todos_pedidos)  # a chamada aciona o DataRecord.read() que vai ter que implementar la no banco, ai lá tá pra 1 argumento ai tem que adicionar pra 3
        PedidoAcademico.load_from_file()

    def render(self, page):
        content = self.pages.get(page)
        return content()
    
    def get_user_data(self):
        usuario_id = request.get_cookie('usuario_id')
        tipo = request.get_cookie('tipo_usuario')
        if not usuario_id:
            return None, None
        import uuid
        try:
            usuario_uuid = uuid.UUID(usuario_id)
        except Exception:
            usuario_uuid = usuario_id
        usuario = Usuario.buscar_id(usuario_uuid)
        return usuario, tipo

    def home_page(self):
        usuario, tipo = self.get_user_data()
    
        if not usuario:
            return template("app/views/home_page")
        if tipo == 'cliente':
            return self.cliente_dashboard(usuario)
        elif tipo == 'prestador':
            return self.prestador_dashboard(usuario)
        
        return redirect('/logout')
    
    def cliente_dashboard(self, usuario):
        pedidos_do_cliente = [p for p in PedidoAcademico.todos_pedidos if str(p.autor_id) == str(usuario.id)]
        return template("app/views/cliente_dashboard.tpl", user=usuario, pedidos=pedidos_do_cliente)
    
    def prestador_dashboard(self, usuario):
        pedidos_abertos = [p for p in PedidoAcademico.todos_pedidos if p.status == PedidoAcademico.status_aberto]


        pedidos_aceitos = [p for p in PedidoAcademico.todos_pedidos if p.prestador_id and str(p.prestador_id) == str(usuario.id)]


        try:
            print(f"[DEBUG prestador_dashboard] usuario={usuario.id} pedidos_abertos={len(pedidos_abertos)} pedidos_aceitos={len(pedidos_aceitos)}")
        except Exception:
            pass

        return template("app/views/prestador_dashboard.tpl", user=usuario, pedidos=pedidos_abertos, pedidos_aceitos=pedidos_aceitos)

    def pedidos_criar(self):
        return template('app/views/pedidos_criar.tpl')

    def pedidos_criar_post(self):
        usuario, tipo = self.get_user_data()
        if not usuario or tipo != 'cliente':
            # se não estiver logado como cliente, redireciona ao login
            return redirect('/login')

        dados_do_form = {
            'titulo': request.forms.get('titulo'),
            'descricao': request.forms.get('descricao'),
            'materia': request.forms.get('materia'),
            'valor_str': request.forms.get('valor'),
            'prazo': request.forms.get('prazo'),
        }

        criador_id = str(usuario.id)

        novo_pedido, erro = PedidoAcademico.criar_e_salvar(
            criador_id = criador_id,
            **dados_do_form
        )

        if erro:
            return f"Erro 400: {erro}", 400

        try:
            print(f"[DEBUG] Novo pedido criado: titulo='{novo_pedido.titulo}' id={novo_pedido.id}")
            print(f"[DEBUG] Total pedidos: {len(PedidoAcademico.todos_pedidos)}")
        except Exception as e:
            print("[DEBUG] Falha no print de debug:", e)

        return redirect('/')

    def login(self):
        return template('app/views/login.tpl')

    def login_post(self):
        email = request.forms.get('email')
        senha = request.forms.get('senha')
        resultado = Usuario.autenticar(email,senha)
        if not resultado:
            print('erro de login')
            return redirect('/login')
            
        tipo,user_data = resultado
        response.set_cookie('usuario_id',str(user_data.id))
        response.set_cookie('tipo_usuario',tipo)
        return redirect('/')
        # if usuario:
        #     response.set_cookie('usuario_id',str(usuario.id))
        #     redirect('/')
        # else:
        #     return template('/login') #TODO: adicionar um erro talvez, na hora que não acha

    def logout(self):
        response.delete_cookie('usuario_id')
        response.delete_cookie('tipo_usuario')
        print('logout')
        redirect('/login')

    def cadastrar(self):
        return template('app/views/cadastrar.tpl')

    def cadastrar_post(self):
        print("[DEBUG] cadastrar_post ENTROU")
        nome = request.forms.get('nome')
        email = request.forms.get('email')
        senha = request.forms.get('senha')
        tipo = request.forms.get('tipo')
        instituicao = request.forms.get('instituicao')
        curso = request.forms.get('curso')
        periodo = request.forms.get('periodo')

        try:
            print(f"[DEBUG cadastrar_post] nome={nome} email={email} tipo={tipo}")
        except Exception:
            pass

        if tipo == 'cliente':
            Aluno_cliente(nome, email, senha, instituicao=instituicao, curso=curso, periodo=periodo)
        elif tipo == 'prestador':
            Aluno_prestador(nome, email, senha, instituicao=instituicao, curso=curso, periodo=periodo)
    
        redirect('/login')

    def perfil(self):
        usuario_id = request.get_cookie('usuario_id')
        # if not ususario_id:
        #     redirect('/login')
        # usuario=Usuario.buscar_usuario(usuario_id)#TODO:buscar_usuario
        # return template('/perfil', usuario=usuario)#passar essa variavel pro html eu acho

    def pedidos(self):
        pass
        # usuario_id = int(request.get_cookie('usuario_id'))
        # usuario= Usuario.buscar_usuario(usuario_id)#TODO:buscar
        # if usuario.tipo == 'cliente':
        #     return template('app/views/pedidos_cliente', usuario=usuario_id)
        # else:
        #     return template('app/views/pedidos')


    def pedidos_edit(self):
        return template('app/views/pedidos_edit')

    def pedidos_edit_post(self):
        titulo = request.forms.get('titulo')
        descricao = request.forms.get('descricao')
        criador = request.get_cookie('usuario_id')
        # Usuario.editar_pedido #TODO

    def pedidos_aceitar(self):

        pass

    def pedidos_delete(self,id_pedido):
        return template('app/views/view_teste.tpl', id_pedido_tpl=id_pedido)


    def avaliar_get(self):
        return template('app/views/avaliar')

    def avaliar_post(self,id_pedido):
        pass
        #Pedido.add_avaliacao() #TODO
        # return template()#igual ao do delete