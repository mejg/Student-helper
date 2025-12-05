<!doctype html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login - Student Help</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="static/CSS/login.css">
</head>
<body>
    <div class="login-container">
        <!-- Lado Esquerdo - Informações -->
        <div class="login-left">
            <div class="logo-area">
                <div class="logo">
                    <i class="fas fa-hands-helping"></i>
                </div>
                <div class="brand-name">Student Help</div>
            </div>
            
            <h1 class="login-title">Conecte-se à sua conta</h1>
            <p class="login-subtitle">Acesse a plataforma para ajudar ou receber ajuda em atividades acadêmicas.</p>
            
            <div class="stats-container">
                <div class="stat-card">
                    <div class="stat-number">1.2k+</div>
                    <div class="stat-label">Estudantes Ativos</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">500+</div>
                    <div class="stat-label">Tarefas Concluídas</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number">95%</div>
                    <div class="stat-label">Satisfação</div>
                </div>
            </div>
        </div>
        
        <!-- Lado Direito - Formulário -->
        <div class="login-form-container">
            <div class="form-header">
                <h2 class="form-title">Login</h2>
                <p class="form-subtitle">Entre com suas credenciais</p>
            </div>
            
            <form class="login-form" action="/login_post" method="post">
                <div class="form-group">
                    <label class="form-label" for="campo_email">
                        <i class="fas fa-envelope"></i>
                        Email
                    </label>
                    <input class="form-input" id="campo_email" type="email" name="email" placeholder="Digite seu email" required>
                </div>
                
                <div class="form-group">
                    <label class="form-label" for="campo_senha">
                        <i class="fas fa-lock"></i>
                        Senha
                    </label>
                    <div class="password-container">
                        <input class="form-input" id="campo_senha" type="password" name="senha" placeholder="Digite sua senha" required>
                        <button type="button" class="toggle-password" id="togglePassword">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>
                
                <div class="form-options">
                    <label class="remember-me">
                        <input type="checkbox" name="remember">
                        <span>Lembrar-me</span>
                    </label>
                    <a href="#" class="forgot-link">Esqueceu a senha?</a>
                </div>
                
                <button type="submit" class="submit-btn">
                    <i class="fas fa-sign-in-alt"></i>
                    Entrar
                </button>
            </form>
            
            <div class="divider">
                <span>Ou entre com</span>
            </div>
            
            <div class="social-login">
                <button type="button" class="social-btn">
                    <i class="fab fa-google"></i>
                    Google
                </button>
                <button type="button" class="social-btn">
                    <i class="fab fa-github"></i>
                    GitHub
                </button>
            </div>
            
            <div class="register-link">
                Não tem uma conta? <a href="cadastrar.html">Cadastre-se agora</a>
            </div>
        </div>
    </div>

    <script src="static/JS/login.js"></script>
</body>
</html>