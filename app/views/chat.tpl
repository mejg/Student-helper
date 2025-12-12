<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Chat | Student Help</title>
    <link rel="stylesheet" href="/static/CSS/chat.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="chat-container">
        <div class="chat-header">
            <div class="chat-header-left">
                <a href="/cliente" class="back-btn">
                    <i class="fas fa-arrow-left"></i>
                </a>
                <div class="chat-title">
                    <h2><i class="fas fa-comments"></i> Chat do Pedido</h2>
                    <p class="chat-subtitle">ID: {{idPedido}}</p>
                </div>
            </div>
            <div class="chat-status">
                <span class="status-indicator online"></span>
                <span class="status-text">Conectado</span>
            </div>
        </div>

        <div class="messages-container" id="messages">
            <div class="welcome-message">
                <div class="welcome-icon">
                    <i class="fas fa-comment-dots"></i>
                </div>
                <div class="welcome-text">
                    <h4>Bem-vindo ao chat!</h4>
                    <p>Esta é a conversa sobre o pedido. Todas as mensagens são salvas automaticamente.</p>
                </div>
            </div>
        </div>

        <div class="input-container">
            <div class="input-wrapper">
                <input type="text" id="msg" placeholder="Digite sua mensagem aqui..." autocomplete="off">
                <div class="input-actions">
                    <button class="input-action-btn" id="attachBtn" title="Anexar arquivo">
                        <i class="fas fa-paperclip"></i>
                    </button>
                    <button class="input-action-btn" id="emojiBtn" title="Emojis">
                        <i class="fas fa-smile"></i>
                    </button>
                    <button class="send-btn" onclick="sendMsg()" id="sendBtn" title="Enviar mensagem">
                        <i class="fas fa-paper-plane"></i>
                    </button>
                </div>
            </div>
            <div class="input-hint">
                <i class="fas fa-info-circle"></i>
                Pressione Enter para enviar
            </div>
        </div>
    </div>

<script src="/static/JS/chat.js">
</script>
</body>
</html>