import uuid
from datetime import datetime

class PedidosAcademico():
    
    todos_pedidos = []
    status_aberto = "Aberto (Aguardando prestador)"
    status_andamento = "Em Andamento"
    status_concluido = "Concluído (Aguardando avaliação)"
    status_cancelado = "Cancelado"

    def __init__(self, titulo, materia, descricao, valor, prazo, autor_id, status= None):
        self.id = str(uuid.uuid4())
        self.titulo = titulo
        self.materia = materia
        self.descricao = descricao
        self.valor = valor
        self.prazo = prazo
        self.autor_id = autor_id
        self.prestador_id = None
        self.status = status if status else self.status_aberto
        self.data_criacao = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        self.data_conclusao = None

        PedidosAcademico.todos_pedidos.append(self)

        def to_dict(self):
            return {
                'id': self.id,
                'titulo': self.titulo,
                'materia': self.materia,
                'descricao': self.descricao,
                'valor': self.valor,
                'prazo': self.prazo,
                'autor_id': str(self.autor_id),
                'prestador_id': str(self.prestador_id) if self.prestador_id else None,
                'status': self.status,
                'data_ criacao': self.data_criacao,
                'data_conclusao': self.data_conclusao   
            }
        
        @classmethod
        def from_dict(cls, data): 
            return cls(
                titulo=data['titulo'],
                materia= data['materia'],
                descricao = data['descricao'],
                valor = data['valor'],
                autor_id = uuid.UUID(data['autor_id']),
                prazo = data['prazo'],
                status = data['status']
            )
        
        def alterar_status(self, novo_status):
            
            if novo_status in [self.status_andamento, self.status_concluido, self.status_cancelado]:
                self.status = novo_status
                if novo_status == self.status_concluido:
                    self.data_conclusao = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                return True
            return False
        
        @classmethod
        def buscar_por_status(cls, status):
            return [p for p in cls.todos_pedidos if p.status == status]
        
        def __repr__(self):
            return f"ID {self.id[:8]} - Pedidos: {self.titulo} - Status: {self.status}"