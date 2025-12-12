import uuid
from datetime import datetime
from app.controllers.DataRecord import DataRecord


class PedidoAcademico():
    todos_pedidos = []
    db = DataRecord("Pedidos.json")
    status_aberto = "Aberto"
    status_andamento = "Em Andamento"
    status_concluido = "Concluído"
    status_cancelado = "Cancelado"

    def __init__(self, titulo, materia, descricao, valor, prazo, autor_id, status=None, prestador_id=None,
                 from_json=False, id=None, data_criacao=None, data_conclusao=None):
        self.id = id or str(uuid.uuid4())
        self.titulo = titulo
        self.materia = materia
        self.descricao = descricao
        self.valor = valor
        self.prazo = prazo
        self.autor_id = str(autor_id)  # str pra dá certo com o ID de teste temporário
        self.prestador_id = prestador_id or None
        self.status = status if status else self.status_aberto
        self.data_criacao = data_criacao or datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        self.data_conclusao = data_conclusao

        PedidoAcademico.todos_pedidos.append(self)
        if not from_json:
            self.db.add(self)

    @classmethod
    def criar_e_salvar(cls, titulo, materia, descricao, valor_str, prazo, criador_id):

        try:
            valor = float(valor_str)
        except (ValueError, TypeError):
            return None, "Erro: O valor deve ser um numero valido."

        if valor <= 0:
            return None, "O valor oferecido deve ser positivo."

        novo_pedido = cls(
            titulo=titulo,
            materia=materia,
            descricao=descricao,
            valor=valor,
            prazo=prazo,
            autor_id=criador_id
        )

        # data_record_instance.save() #implementar no banco
        return novo_pedido, None

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
            'data_criacao': self.data_criacao,
            'data_conclusao': self.data_conclusao
        }

    @classmethod
    def from_dict(cls, data):
        return cls(
            id=data['id'],
            titulo=data['titulo'],
            materia=data['materia'],
            descricao=data['descricao'],
            valor=data['valor'],
            prazo=data['prazo'],
            autor_id=str(data['autor_id']),
            prestador_id=data.get('prestador_id'),
            status=data['status'],
            data_criacao=data.get('data_criacao'),
            data_conclusao=data.get('data_conclusao'),
            from_json=True
        )

    def alterar_status(self, novo_status):
        print('chguei em pedidos.alterar status')
        mapping = {
            'aberto': self.status_aberto,
            'em_andamento': self.status_andamento,
            'concluido': self.status_concluido,
            'cancelado': self.status_cancelado,
            'em andamento': self.status_andamento,
            'concluído': self.status_concluido,
            'concluido': self.status_concluido
        }

        chave = (str(novo_status) or '').strip()
        chave_lower = chave.lower()
        target = mapping.get(chave_lower, None)

        if target is None:
            if chave in [self.status_andamento, self.status_concluido, self.status_cancelado, self.status_aberto]:
                target = chave

        if target in [self.status_andamento, self.status_concluido, self.status_cancelado, self.status_aberto]:
            self.status = target
            if target == self.status_concluido:
                from datetime import datetime
                self.data_conclusao = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

            try:
                self.db.update_por_id(self)
            except Exception:
                pass
                return True

        return False

    @classmethod
    def buscar_por_status(cls, status):
        return [p for p in cls.todos_pedidos if p.status == status]

    @classmethod
    def buscar_por_id(cls, id):
        for p in cls.todos_pedidos:
            if p.id == id:
                return p

        # import uuid
        # try:
        #     id_conv = uuid.UUID(str(id))
        # except Exception:
        #     id_conv = str(id)
        # for p in cls.todos_pedidos:
        #     if p.id == id_conv or str(p.id) == str(id_conv):
        #         return p

    def __repr__(self):
        return f"ID {self.id[:8]} - Pedidos: {self.titulo} - Status: {self.status}"

    @classmethod
    def load_from_file(cls):
        for d in cls.db.get_all():
            cls.from_dict(d)

    def aceitar_pedido(self, prestador_id):
        print('cheguei aqui em pedidos.aceitar_pedido')
        # se estiver fechado
        if self.status != PedidoAcademico.status_aberto:
            return False, "O pedido já foi aceito ou está fechado."

        self.prestador_id = str(prestador_id)
        self.alterar_status(PedidoAcademico.status_andamento)
        self.db.update_por_id(self)

        try:

            return True, None
        except Exception as e:
            return False, f"Erro de persistência ao aceitar pedido: {e}"

    def concluir_pedido(self):
        if self.status != PedidoAcademico.status_andamento:
            return False, "O pedido não está em andamento."

        self.status = PedidoAcademico.status_concluido
        self.data_conclusao = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

        try:
            self.db.update_por_id(self)
            return True, None
        except Exception as e:
            return False, f"Erro de persistência ao concluir pedido: {e}"


PedidoAcademico.load_from_file()
