import uuid
import os
import hashlib

class Usuario():
    todos_usuarios=[]
    def __init__(self,nome,email,senha,tipo=None):
        self.__id=uuid.uuid4()
        self.nome=nome
        self.email=email
        # self.senha=senha
        self.tipo=tipo
        #senha criptografada:
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
        for u in Usuario.todos_usuarios:
            if u.email==email and u.verificar_senha(senha):
                return u
        return None

    @classmethod
    def buscar_id(cls,id):
        for u in Usuario.todos_usuarios:
            if u.id==id:
                return u
        return None

    def verificar_senha(self,senha):
        tentativa_senha=hashlib.sha256(self.salt+str(senha).encode()).hexdigest()
        return tentativa_senha == self.senha_hash

    def alterar_senha(self,senha_atual,senha_nova):
        if self.verificar_senha(senha_atual):
            self.senha_hash=hashlib.sha256(self.salt+ str(senha_nova).encode()).hexdigest()
        else:
            print(f'senha errada')

    def excluir_usuario(self):
        if self in self.__class__.todos_usuarios:
            self.__class__.todos_usuarios.remove(self)
