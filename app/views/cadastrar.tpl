<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cadastro - Student Help</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="static/CSS/cadastrar.css">
</head>
<body>
    <div class="cadastro-container">
        <!-- Lado Esquerdo - Informações -->
        <div class="cadastro-left">
            <div class="logo-area">
                <div class="logo">
                    <i class="fas fa-hands-helping"></i>
                </div>
                <div class="brand-name">Student Help</div>
            </div>
            
            <h1 class="cadastro-title">Cadastre-se</h1>
            <p class="cadastro-subtitle">Conecte-se com outros estudantes. Ofereça ajuda ou encontre quem possa ajudar você.</p>
            
            <div class="benefits-list">
                <div class="benefit-item">
                    <i class="fas fa-user-graduate"></i>
                    <span>Cliente: Solicite ajuda em atividades</span>
                </div>
                <div class="benefit-item">
                    <i class="fas fa-chalkboard-teacher"></i>
                    <span>Prestador: Ofereça ajuda e ganhe</span>
                </div>
                <div class="benefit-item">
                    <i class="fas fa-shield-alt"></i>
                    <span>Plataforma segura e confiável</span>
                </div>
            </div>
        </div>
        
        <!-- Lado Direito - Formulário (MESMO CÓDIGO QUE VOCÊ TEM) -->
        <div class="cadastro-form-container">
            <div class="form-header">
                <h2 class="form-title">Cadastro</h2>
                <p class="form-subtitle">Preencha os dados abaixo</p>
            </div>
            
            <form action="/cadastrar_post" method="post" class="cadastro-form">
                <div class="form-group">
                    <label for="campo_nome" class="form-label">
                        <i class="fas fa-user"></i>
                        Nome:
                    </label>
                    <input id="campo_nome" type="text" name="nome" placeholder="Digite seu nome" required class="form-input">
                </div>
                
                <div class="form-group">
                    <label for="campo_senha" class="form-label">
                        <i class="fas fa-lock"></i>
                        Senha:
                    </label>
                    <input id="campo_senha" type="password" name="senha" placeholder="Digite sua senha" required class="form-input">
                </div>
                
                <div class="form-group">
                    <label for="campo_email" class="form-label">
                        <i class="fas fa-envelope"></i>
                        Email:
                    </label>
                    <input id="campo_email" type="email" name="email" placeholder="Digite seu email" required class="form-input">
                </div>
                
                <div class="form-group">
                    <h3 class="section-title">
                        <i class="fas fa-user-tag"></i>
                        Tipo:
                    </h3>
                    <select name="tipo" required class="form-input">
                        <option selected value="" disabled>Selecione um tipo</option>
                        <option value="cliente">Cliente</option>
                        <option value="prestador">Prestador</option>
                    </select>
                </div>
                
                <input type="submit" value="Cadastrar" class="submit-btn">
                
                <div class="login-link">
                    Já tem uma conta? <a href="login.html">Faça login</a>
                </div>
            </form>
        </div>
    </div>

    <!-- JavaScript simples apenas para efeitos visuais -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Efeito visual nos inputs ao focar
            const inputs = document.querySelectorAll('.form-input');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.style.transform = 'translateY(-2px)';
                    this.style.boxShadow = '0 4px 12px rgba(0, 102, 204, 0.2)';
                });
                
                input.addEventListener('blur', function() {
                    this.style.transform = 'translateY(0)';
                    this.style.boxShadow = 'none';
                });
            });
            
            // Efeito no botão de submit
            const submitBtn = document.querySelector('.submit-btn');
            submitBtn.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-2px)';
            });
            
            submitBtn.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0)';
            });
        });
    </script>
</body>
</html>