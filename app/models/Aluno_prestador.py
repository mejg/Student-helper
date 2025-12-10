import hashlib

from app.controllers.DataRecord import DataRecord
from app.models.Usuario import Usuario

class Aluno_prestador(Usuario):
    todos_os_prestadores=[]
    db=DataRecord("Aluno_prestador.json")
    def __init__(self, nome, email, senha, tipo='prestador', from_dict=False, salt=None, senha_hash=None,instituicao=None, curso=None, periodo=None,id=None):
        super().__init__(nome, email, senha, tipo, from_dict=from_dict, salt=salt, senha_hash=senha_hash, instituicao=instituicao, curso=curso, periodo=periodo,id=id)
        Aluno_prestador.todos_os_prestadores.append(self)
        if not from_dict:
            self.db.add(self)

    def aceitar_pedido(self,pedido):
        self.pedidos_aceitos.append(pedido)

    def concluir_pedido(self,pedido):
        self.pedidos_concluidos.append(pedido)
        self.pedidos_aceitos.remove(pedido)

    def to_dict(self):
        return {
            'id': str(self.id),
            'nome': self.nome,
            'email': self.email,
            'tipo': self.tipo,
            'senha_hash': self.senha_hash,
            'salt': self.salt.hex(),
            'instituicao': self.instituicao,
            'curso': self.curso,
            'periodo': self.periodo,

        }

    @classmethod
    def from_dict(cls,data):
        return cls(
        nome=data['nome'],
        email=data['email'],
        senha=None,
        tipo=data['tipo'],
        from_dict=True,
        salt=data['salt'],
        senha_hash=data['senha_hash'],
        instituicao=data.get('instituicao'),
        curso=data.get('curso'),
        periodo=data.get('periodo'),
        id=data['id']
    )

    @classmethod
    def load_from_file(cls):
        for d in cls.db.get_all():
            cls.from_dict(d)

    def listar_prestadores(cls):
        for p in cls.todos_os_prestadores:
            print(p.__repr__())

    def alterar_senha(self,senha_atual,senha_nova):
        if self.verificar_senha(senha_atual):
            self.senha_hash=hashlib.sha256(self.salt+ str(senha_nova).encode()).hexdigest()
            self.db.update_por_id(self)
        else:
            print(f'senha errada')

    def alterar_dados(self,nome,email):
        self.nome=nome
        self.email=email
        self.db.update_por_id(self)

Aluno_prestador.load_from_file()