import uuid
import os
import hashlib

class Usuario():
    todos_usuarios=[]
    def __init__(self, nome, email, senha, tipo=None, from_dict=False, salt=None, senha_hash=None, instituicao=None, curso=None, periodo=None,id=None):
        self.__id = id or uuid.uuid4()
        self.nome = nome
        self.email = email
        self.tipo = tipo
        self.instituicao = instituicao
        self.curso = curso
        self.periodo = periodo
        #senha criptografada:
        if from_dict:
            self.salt=bytes.fromhex(salt)
            self.senha_hash=senha_hash
        else:
            self.salt=os.urandom(16)
            self.senha_hash=hashlib.sha256(self.salt+ str(senha).encode()).hexdigest()
        Usuario.todos_usuarios.append(self)

    def __repr__(self):
        return f'Id:{self.id} | Usuário:{self.nome} | Email:{self.email}'

    @property
    def id(self):
        return self.__id

    @classmethod
    def autenticar(cls,email,senha):
        from app.models.Aluno_prestador import Aluno_prestador
        from app.models.Aluno_cliente import Aluno_cliente
        for u in Aluno_prestador.todos_os_prestadores:
            if u.email==email and u.verificar_senha(senha):
                return ('prestador',u)
        for u in Aluno_cliente.todos_clientes:
            if u.email==email and u.verificar_senha(senha):
                return ('cliente',u)
        return None

    @classmethod
    def buscar_id(cls,id):
        import uuid
        try:
            id_conv = uuid.UUID(str(id))
        except Exception:
            id_conv = str(id)
        for u in cls.todos_usuarios:
            if u.id == id_conv or str(u.id) == str(id_conv):
                return u
        return None

    @classmethod
    def buscar_por_email(cls,email):
        for u in cls.todos_usuarios:
            if u.email==email:
                return u

    def verificar_senha(self,senha):
        tentativa_senha=hashlib.sha256(self.salt+str(senha).encode()).hexdigest()
        return tentativa_senha == self.senha_hash

    # def alterar_senha(self,senha_atual,senha_nova):
    #     if self.verificar_senha(senha_atual):
    #         self.senha_hash=hashlib.sha256(self.salt+ str(senha_nova).encode()).hexdigest()
    #     else:
    #         print(f'senha errada')

    def excluir_usuario(self):
        if self in self.__class__.todos_usuarios:
            self.__class__.todos_usuarios.remove(self)


    @classmethod
    def listar_todos(cls):
        for u in cls.todos_usuarios:
            print(u.__repr__())

