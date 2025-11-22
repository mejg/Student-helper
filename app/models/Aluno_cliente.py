from app.models.Carteira import Carteira
from app.models.Usuario import Usuario
from app.controllers.DataRecord import DataRecord


class Aluno_cliente(Usuario):
    todos_clientes=[]
    db=DataRecord("Aluno_cliente.json")
    def __init__(self,nome,email,senha,tipo="cliente",from_dict=False,salt=None,senha_hash=None):
        super().__init__(nome,email,senha,tipo,from_dict=from_dict, salt=salt, senha_hash=senha_hash)
        Aluno_cliente.todos_clientes.append(self)
        self.carteira=Carteira()
        self.pedidos=[]
        # self.pedidos_criados=[]
        # self.pedidos_em_andamento=[]
        # self.pedidos_finalizados=[]
        if not from_dict:
            self.db.add(self)

    def to_dict(self):
        return {
            'id': str(self.id),
            'nome': self.nome,
            'email': self.email,
            'tipo': self.tipo,
            'senha_hash': self.senha_hash,
            'salt': self.salt.hex(),
            'self.pedidos': self.pedidos,
            'carteira': self.carteira.to_dict()
        }

    @classmethod
    def from_dict(cls,data):
        obj=cls(
            data['nome'],
            data['email'],
            senha=None,
            tipo=data['tipo'],
            from_dict=True,
            salt=data['salt'],
            senha_hash=data['senha_hash'])
        obj.carteira=Carteira.from_dict(data['carteira'])
        return obj



    def criar_pedido(self):
        pass

    def cancelar_pedido(self):
        pass

    @classmethod
    def load_from_file(cls):
        for d in cls.db.get_all():
            cls.from_dict(d)

    @classmethod
    def listar_clientes(cls):
        for c in cls.todos_clientes:
            print(c.__repr__())

Aluno_cliente.load_from_file()