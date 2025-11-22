from datetime import datetime


class Carteira:
    def __init__(self,saldo=0.0, transacoes=None):
        self.saldo=saldo
        self.transacoes=transacoes

    def registrar_transacao(self,tipo,valor):
        self.transacoes.append({
            "tipo":tipo,
            "valor":valor,
            "data":datetime.now()
        })

    def depositar(self,valor):
        self.saldo+=valor
        self.registrar_transacao("entrada",valor)

    def sacar(self,valor):
        self.saldo-=valor
        self.registrar_transacao("saida",valor)

    def to_dict(self):
        return {
            "saldo":self.saldo,
            "transacoes":self.transacoes
        }

    @classmethod
    def from_dict(cls,data):
        return cls(saldo=data.get('saldo'),transacoes=data.get('transacoes',[]))

