<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chat WebSocket</title>
</head>
<body>
    <h2>Chat</h2>

    <div id="messages" style="border: 1px solid gray; height: 200px; overflow-y: scroll;"></div>

    <input id="msg" placeholder="Digite algo..." />
    <button onclick="sendMsg()">Enviar</button>

    <script>
        const socket = new WebSocket("ws://localhost:8765");

        const messagesDiv = document.getElementById("messages");

        socket.onopen = () => {
            messagesDiv.innerHTML += "<div><i>Conectado ao servidor...</i></div>";
        };

        socket.onmessage = (event) => {
            messagesDiv.innerHTML += `<div>${event.data}</div>`;
        };

        function sendMsg() {
            const text = document.getElementById("msg").value;
            socket.send(text);
            document.getElementById("msg").value = "";
        }
    </script>
</body>
</html>