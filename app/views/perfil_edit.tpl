<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Perfil | Student Help</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="static/CSS/perfil_edit.css">
</head>
<body>
    <div class="perfil-edit-container">
        <div class="perfil-left">
            <div class="logo-area">
                <div class="logo">
                    <i class="fas fa-hands-helping"></i>
                </div>
                <div class="brand-name">Student Help</div>
            </div>

            <h1 class="perfil-title">Editar Perfil</h1>
            <p class="perfil-subtitle">Atualize suas informações pessoais</p>

            <div class="user-info-card">
                <div class="user-avatar">
                    <i class="fas fa-user"></i>
                </div>
                <div class="user-details">
                    <h3>{{user.nome}}</h3>
                    <p class="user-email">{{user.email}}</p>
                    <div class="user-type-badge">
                        <i class="fas fa-tag"></i>
                        <span>
                            % if user.tipo == 'cliente':
                                Cliente
                            % else:
                                Prestador
                            % end
                        </span>
                    </div>
                </div>
            </div>

            <div class="tips-list">
                <div class="tip-item">
                    <i class="fas fa-info-circle"></i>
                    <span>Seu tipo de conta não pode ser alterado</span>
                </div>
                <div class="tip-item">
                    <i class="fas fa-lock"></i>
                    <span>Para alterar a senha, use o link dedicado</span>
                </div>
                <div class="tip-item">
                    <i class="fas fa-shield-alt"></i>
                    <span>Suas informações são protegidas</span>
                </div>
            </div>
        </div>

        <div class="perfil-form-container">
            <div class="form-header">
                <h2 class="form-title">
                    <i class="fas fa-edit"></i>
                    Editar Informações
                </h2>
                <p class="form-subtitle">Atualize seu nome e email. Seu tipo é:
                    <strong>
                        % if user.tipo == 'cliente':
                            Cliente
                        % else:
                            Prestador
                        % end
                    </strong>
                </p>
            </div>

            % if erro:
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i>
                {{erro}}
            </div>
            % end


            <form action="/perfil_post" method="post" class="perfil-form">
                <div class="form-section">
                    <h3 class="section-title">
                        <i class="fas fa-user"></i>
                        Informações Pessoais
                    </h3>

                    <div class="form-group">
                        <label for="nome" class="form-label">
                            <i class="fas fa-user"></i>
                            Nome Completo *
                        </label>
                        <input type="text" id="nome" name="nome" value="{{user.nome}}" required class="form-input" placeholder="Digite seu nome completo">
                    </div>

                    <div class="form-group">
                        <label for="email" class="form-label">
                            <i class="fas fa-envelope"></i>
                            Email *
                        </label>
                        <input type="email" id="email" name="email" value="{{user.email}}" required class="form-input" placeholder="Digite seu email">
                    </div>
                </div>

                <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-key"></i>
                            Senha
                        </label>
                        <input type="password" class="form-input disabled" placeholder="********" disabled>
                        <small class="form-help">
                            <a href="/senha" style="color: var(--primary); font-weight: 600;">
                                Clique aqui para Alterar a Senha
                            </a>
                        </small>
                    </div>

                <div class="form-actions">
                    <button type="submit" class="submit-btn">
                        <i class="fas fa-save"></i>
                        Salvar Alterações
                    </button>

                    <a href="/" class="cancel-btn">
                        <i class="fas fa-chevron-left"></i>
                        Voltar para Dashboard
                    </a>
                </div>
            </form>
        </div>
    </div>

    <script src="static/JS/perfil_edit.js"></script>
</body>
</html>
