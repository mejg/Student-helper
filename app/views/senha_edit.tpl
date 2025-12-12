<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alterar Senha | Student Help</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="static/CSS/senha_edit.css">
</head>
<body>
<div class="senha-container">

    <div class="senha-left">
        <div class="logo-area">
            <div class="logo">
                <i class="fas fa-hands-helping"></i>
            </div>
            <div class="brand-name">Student Help</div>
        </div>

        <h1 class="senha-title">Alterar Senha</h1>
        <p class="senha-subtitle">Mantenha sua conta segura atualizando sua senha regularmente</p>

        <div class="security-tips">
            <div class="tip-item">
                <i class="fas fa-shield-alt"></i>
                <div class="tip-content">
                    <h4>Segurança da Conta</h4>
                    <p>Proteja seu acesso alterando sua senha periodicamente</p>
                </div>
            </div>

            <div class="tip-item">
                <i class="fas fa-lightbulb"></i>
                <div class="tip-content">
                    <h4>Dicas de Senha</h4>
                    <p>Use uma senha única que você não usa em outros sites</p>
                </div>
            </div>

            <div class="tip-item">
                <i class="fas fa-user-secret"></i>
                <div class="tip-content">
                    <h4>Privacidade</h4>
                    <p>Sua senha é criptografada e nunca compartilhada</p>
                </div>
            </div>
        </div>
    </div>


    <div class="senha-form-container">
        <div class="form-header">
            <h2 class="form-title">
                <i class="fas fa-lock"></i>
                Alterar Senha
            </h2>
            <p class="form-subtitle">Insira sua senha atual para definir uma nova senha</p>
        </div>

        % if erro:
        <div class="alert alert-error">
            <i class="fas fa-exclamation-circle"></i>
            {{erro}}
        </div>
        % end

        <form action="/senha" method="post" class="senha-form">
            <div class="form-section">
                <h3 class="section-title">
                    <i class="fas fa-key"></i>
                    Dados de Acesso
                </h3>

                <div class="form-group">
                    <label for="senha_atual" class="form-label">
                        <i class="fas fa-lock"></i>
                        Senha Atual *
                    </label>
                    <div class="password-container">
                        <input type="password" id="senha_atual" name="senha_atual" placeholder="Sua senha atual"
                               required class="form-input">
                        <button type="button" class="toggle-password" data-target="senha_atual">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="form-section">
                <h3 class="section-title">
                    <i class="fas fa-key"></i>
                    Nova Senha
                </h3>

                <div class="form-group">
                    <label for="senha_nova" class="form-label">
                        <i class="fas fa-key"></i>
                        Nova Senha *
                    </label>
                    <div class="password-container">
                        <input type="password" id="senha_nova" name="senha_nova" placeholder="Digite a nova senha"
                               required class="form-input">
                        <button type="button" class="toggle-password" data-target="senha_nova">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>

                <div class="form-group">
                    <label for="senha_confirma" class="form-label">
                        <i class="fas fa-key"></i>
                        Confirmar Nova Senha *
                    </label>
                    <div class="password-container">
                        <input type="password" id="senha_confirma" name="senha_confirma"
                               placeholder="Repita a nova senha" required class="form-input">
                        <button type="button" class="toggle-password" data-target="senha_confirma">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="form-actions">
                <button type="submit" class="submit-btn">
                    <i class="fas fa-check"></i>
                    Alterar Senha
                </button>

                <a href="/perfil" class="cancel-btn">
                    <i class="fas fa-chevron-left"></i>
                    Voltar à Edição de Perfil
                </a>
            </div>
        </form>
    </div>
</div>

<script src="static/JS/senha_edit.js"></script>
</body>
</html>
