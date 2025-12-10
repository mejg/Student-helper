<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Perfil | Student Help</title>
    <link rel="stylesheet" href="/static/CSS/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <header class="header">...</header>

    <main class="dashboard">
        <div class="container">
            <div class="form-card" style="max-width: 500px; margin: 100px auto;">
                <h2><i class="fas fa-edit"></i> Editar Perfil</h2>
                <p class="subtitle">Atualize seu nome e email. Seu tipo é: {{user.tipo}}</p>

                % if erro:
                <div class="alert alert-error">{{erro}}</div>
                % end

                <form action="/perfil_post" method="post">
                    
                    <div class="form-group">
                        <label for="nome">Nome Completo:</label>
 
                        <input type="text" id="nome" name="nome" value="{{user.nome}}" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email:</label>

                        <input type="email" id="email" name="email" value="{{user.email}}" required>
                    </div>

                    <div class="form-group">

  
                        <label>Senha:</label>
                        <input type="password" placeholder="Para alterar a senha, use o link dedicado." disabled>
                    </div>
                    
                    <button type="submit" class="btn btn-large btn-primary" style="margin-top: 20px;">
                        <i class="fas fa-save"></i> Salvar Alterações
                    </button>
                    
                    <a href="/" class="btn btn-large btn-outline" style="margin-top: 10px;">
                         <i class="fas fa-chevron-left"></i> Voltar
                    </a>

                </form>
            </div>
        </div>
    </main>

    <footer class="footer">...</footer>
</body>
</html>