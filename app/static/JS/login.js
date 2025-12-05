// Aguarda o carregamento completo do DOM
document.addEventListener('DOMContentLoaded', function() {
    // Elementos do DOM
    const loginForm = document.getElementById('loginForm');
    const emailInput = document.getElementById('campo_email');
    const passwordInput = document.getElementById('campo_senha');
    const togglePasswordBtn = document.getElementById('togglePassword');
    const submitBtn = document.getElementById('submitBtn');
    const btnText = submitBtn.querySelector('.btn-text');
    const emailError = document.getElementById('emailError');
    const passwordError = document.getElementById('passwordError');
    const googleLoginBtn = document.getElementById('googleLogin');
    const githubLoginBtn = document.getElementById('githubLogin');
    const registerLink = document.getElementById('registerLink');
    const rememberMe = document.getElementById('rememberMe');

    // Carregar dados do localStorage (se existirem)
    loadSavedCredentials();

    // Toggle de visibilidade da senha
    togglePasswordBtn.addEventListener('click', function() {
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);
        
        // Atualizar ícone
        const icon = this.querySelector('i');
        icon.className = type === 'password' ? 'fas fa-eye' : 'fas fa-eye-slash';
        
        // Adicionar feedback visual
        this.style.transform = 'translateY(-50%) scale(1.1)';
        setTimeout(() => {
            this.style.transform = 'translateY(-50%) scale(1)';
        }, 200);
    });

    // Validação em tempo real do email
    emailInput.addEventListener('input', function() {
        validateEmail();
    });

    // Validação em tempo real da senha
    passwordInput.addEventListener('input', function() {
        validatePassword();
    });

    // Validação do formulário no submit
    loginForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        if (validateForm()) {
            // Simular envio do formulário
            simulateLogin();
        }
    });

    // Login com Google
    googleLoginBtn.addEventListener('click', function() {
        simulateSocialLogin('Google');
    });

    // Login com GitHub
    githubLoginBtn.addEventListener('click', function() {
        simulateSocialLogin('GitHub');
    });

    // Link de registro
    registerLink.addEventListener('click', function(e) {
        e.preventDefault();
        alert('Redirecionando para página de cadastro...');
        // Em uma aplicação real, seria: window.location.href = '/register';
    });

    // Função para validar email
    function validateEmail() {
        const email = emailInput.value.trim();
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        
        if (!email) {
            showError(emailError, 'Email é obrigatório');
            emailInput.classList.add('error');
            emailInput.classList.remove('success');
            return false;
        }
        
        if (!emailRegex.test(email)) {
            showError(emailError, 'Digite um email válido');
            emailInput.classList.add('error');
            emailInput.classList.remove('success');
            return false;
        }
        
        hideError(emailError);
        emailInput.classList.remove('error');
        emailInput.classList.add('success');
        return true;
    }

    // Função para validar senha
    function validatePassword() {
        const password = passwordInput.value;
        
        if (!password) {
            showError(passwordError, 'Senha é obrigatória');
            passwordInput.classList.add('error');
            passwordInput.classList.remove('success');
            return false;
        }
        
        if (password.length < 6) {
            showError(passwordError, 'Senha deve ter no mínimo 6 caracteres');
            passwordInput.classList.add('error');
            passwordInput.classList.remove('success');
            return false;
        }
        
        hideError(passwordError);
        passwordInput.classList.remove('error');
        passwordInput.classList.add('success');
        return true;
    }

    // Função para validar todo o formulário
    function validateForm() {
        const isEmailValid = validateEmail();
        const isPasswordValid = validatePassword();
        
        return isEmailValid && isPasswordValid;
    }

    // Função para simular login
    function simulateLogin() {
        // Salvar credenciais se "Lembrar-me" estiver marcado
        if (rememberMe.checked) {
            saveCredentials();
        } else {
            clearSavedCredentials();
        }
        
        // Mostrar estado de carregamento
        submitBtn.disabled = true;
        btnText.textContent = 'Entrando...';
        submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Entrando...';
        
        // Simular delay de rede
        setTimeout(() => {
            // Em uma aplicação real, aqui seria a lógica de autenticação
            alert('Login realizado com sucesso! Redirecionando...');
            
            // Resetar botão
            submitBtn.disabled = false;
            btnText.textContent = 'Entrar';
            submitBtn.innerHTML = '<i class="fas fa-sign-in-alt"></i><span class="btn-text">Entrar</span>';
            
            // Redirecionar (em uma aplicação real)
            // window.location.href = '/dashboard';
        }, 2000);
    }

    // Função para simular login social
    function simulateSocialLogin(provider) {
        const socialBtn = provider === 'Google' ? googleLoginBtn : githubLoginBtn;
        const originalText = socialBtn.innerHTML;
        
        // Mostrar estado de carregamento
        socialBtn.disabled = true;
        socialBtn.innerHTML = `<i class="fas fa-spinner fa-spin"></i> Conectando...`;
        
        // Simular delay de rede
        setTimeout(() => {
            alert(`Conectado com ${provider} com sucesso!`);
            
            // Restaurar botão
            socialBtn.disabled = false;
            socialBtn.innerHTML = originalText;
            
            // Em uma aplicação real, redirecionaria para dashboard
            // window.location.href = '/dashboard';
        }, 1500);
    }

    // Função para mostrar mensagem de erro
    function showError(element, message) {
        element.textContent = message;
        element.classList.add('show');
    }

    // Função para esconder mensagem de erro
    function hideError(element) {
        element.textContent = '';
        element.classList.remove('show');
    }

    // Função para salvar credenciais no localStorage
    function saveCredentials() {
        const credentials = {
            email: emailInput.value,
            remember: true
        };
        localStorage.setItem('educonnect_credentials', JSON.stringify(credentials));
    }

    // Função para carregar credenciais salvas
    function loadSavedCredentials() {
        const saved = localStorage.getItem('educonnect_credentials');
        if (saved) {
            const credentials = JSON.parse(saved);
            if (credentials.remember && credentials.email) {
                emailInput.value = credentials.email;
                rememberMe.checked = true;
                // Focar no campo de senha
                passwordInput.focus();
            }
        }
    }

    // Função para limpar credenciais salvas
    function clearSavedCredentials() {
        localStorage.removeItem('educonnect_credentials');
    }

    // Efeitos visuais nos inputs
    const formInputs = document.querySelectorAll('.form-input');
    formInputs.forEach(input => {
        // Efeito ao focar
        input.addEventListener('focus', function() {
            this.parentElement.style.transform = 'translateY(-2px)';
        });
        
        // Efeito ao perder foco
        input.addEventListener('blur', function() {
            this.parentElement.style.transform = 'translateY(0)';
        });
    });

    // Adicionar animação de entrada aos elementos
    const animatedElements = document.querySelectorAll('.login-left, .login-form-container, .floating-card');
    animatedElements.forEach((element, index) => {
        element.style.animation = `fadeIn 0.6s ease-out ${index * 0.1}s forwards`;
        element.style.opacity = '0';
    });

    // Prevenir múltiplos envios do formulário
    let isSubmitting = false;
    loginForm.addEventListener('submit', function(e) {
        if (isSubmitting) {
            e.preventDefault();
            return;
        }
        
        if (validateForm()) {
            isSubmitting = true;
            simulateLogin();
            
            // Resetar flag após 3 segundos (tempo suficiente para o login)
            setTimeout(() => {
                isSubmitting = false;
            }, 3000);
        }
    });
});