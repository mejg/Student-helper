import asyncio
import websockets
import json

salas = {}  # salas por idPedido

async def handler(websocket):
    try:
        # Primeira mensagem do cliente deve ser o JSON com idPedido
        msg = await websocket.recv()
        data = json.loads(msg)
        idPedido = data.get('idPedido')

        if not idPedido:
            await websocket.close()
            return

        # Cria a sala se não existir
        if idPedido not in salas:
            salas[idPedido] = []

        salas[idPedido].append(websocket)
        print(f"Cliente entrou na sala {idPedido}")

        # Loop para receber mensagens subsequentes
        async for message in websocket:
            for client in salas[idPedido]:
                if client != websocket:
                    await client.send(message)

    except websockets.ConnectionClosed:
        pass
    finally:
        # Remove o websocket da sala ao desconectar
        if idPedido in salas and websocket in salas[idPedido]:
            salas[idPedido].remove(websocket)
            print(f"Cliente saiu da sala {idPedido}")


async def main():
    print("Servidor WebSocket rodando em ws://localhost:8765")
    async with websockets.serve(handler, "localhost", 8765):
        await asyncio.Future()  # Mantém o servidor rodando

asyncio.run(main())