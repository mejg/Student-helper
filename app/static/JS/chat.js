let idPedido = "{{idPedido}}";
let socket = new WebSocket("ws://localhost:8765");

socket.onopen = () => {
    // Envia o idPedido na primeira mensagem
    socket.send(JSON.stringify({idPedido: idPedido}));
};

socket.onmessage = (event) => {
    let div = document.createElement("div");
    div.textContent = event.data;
    document.getElementById("messages").appendChild(div);
};

function sendMsg() {
    let text = document.getElementById("msg").value;
    if (text.trim() === "") return;

    // Mostra sua mensagem localmente
    let div = document.createElement("div");
    div.textContent = "Você: " + text;
    document.getElementById("messages").appendChild(div);

    socket.send(text);
    document.getElementById("msg").value = "";
}
