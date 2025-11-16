from models.Usuario import Usuario
from models.Aluno_cliente import Aluno_cliente

p1=Usuario('zayra','zayra@',12345)
p2=Usuario('duda','duda@',1234)
# print(p1.id)
# print(p1.senha_hash)
# print(p1.verificar_senha(12345))
# p1.alterar_senha(12345,123)
# print(p1.verificar_senha(123))
p3=Aluno_cliente('gabriel','gabriel@', 123456)
print(p3.__repr__())
print(Usuario.todos_usuarios.__repr__())
Usuario.listar_todos()