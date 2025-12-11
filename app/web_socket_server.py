import asyncio
import websockets

connected_clients = set()

async def handler(websocket):
    connected_clients.add(websocket)
    print("Cliente conectado!")

    try:
        async for message in websocket:
            print(f"Mensagem recebida: {message}")

            # reenviar para todos
            for client in connected_clients:
                if client != websocket:
                    await client.send(message)

    except:
        print("Cliente desconectado!")

    finally:
        connected_clients.remove(websocket)


async def main():
    print("Servidor WebSocket rodando em ws://localhost:8765")
    async with websockets.serve(handler, "localhost", 8765):
        await asyncio.Future()  # roda pra sempre

asyncio.run(main())