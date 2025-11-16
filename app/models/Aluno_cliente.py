import uuid
from app.models.Usuario import Usuario

class Aluno_cliente(Usuario):
    todos_clientes=[]
    def __init__(self,nome,email,senha,tipo="cliente"):
        super().__init__(nome,email,senha,tipo)
        Aluno_cliente.todos_clientes.append(self)
        self.pedidos_criados=[]
        self.pedidos_em_andamento=[]
        self.pedidos_finalizados=[]
        print('rodou no cliente')

    def criar_pedido(self):
        pass

    def cancelar_pedido(self):
        pass

