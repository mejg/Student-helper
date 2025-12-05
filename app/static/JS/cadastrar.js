// Aguarda o carregamento completo do DOM
document.addEventListener('DOMContentLoaded', function() {
    // Elementos do DOM
    const toggleSenhaBtn = document.getElementById('toggleSenha');
    const toggleConfirmarSenhaBtn = document.getElementById('toggleConfirmarSenha');
    const senhaInput = document.getElementById('senha');
    const confirmarSenhaInput = document.getElementById('confirmar_senha');
    const submitBtn = document.querySelector('.submit-btn');

    // Toggle de visibilidade da senha
    toggleSenhaBtn.addEventListener('click', function() {
        const type = senhaInput.getAttribute('type') === 'password' ? 'text' : 'password';
        senhaInput.setAttribute('type', type);
        
        // Atualizar ícone
        const icon = this.querySelector('i');
        icon.className = type === 'password' ? 'fas fa-eye' : 'fas fa-eye-slash';
        
        // Feedback visual
        this.style.transform = 'translateY(-50%) scale(1.1)';
        setTimeout(() => {
            this.style.transform = 'translateY(-50%) scale(1)';
        }, 200);
    });

    // Toggle de visibilidade da confirmação de senha
    toggleConfirmarSenhaBtn.addEventListener('click', function() {
        const type = confirmarSenhaInput.getAttribute('type') === 'password' ? 'text' : 'password';
        confirmarSenhaInput.setAttribute('type', type);
        
        // Atualizar ícone
        const icon = this.querySelector('i');
        icon.className = type === 'password' ? 'fas fa-eye' : 'fas fa-eye-slash';
        
        // Feedback visual
        this.style.transform = 'translateY(-50%) scale(1.1)';
        setTimeout(() => {
            this.style.transform = 'translateY(-50%) scale(1)';
        }, 200);
    });

    // Efeito no botão de submit
    submitBtn.addEventListener('click', function() {
        // Apenas efeito visual
        this.style.transform = 'scale(0.98)';
        setTimeout(() => {
            this.style.transform = 'scale(1)';
        }, 150);
    });

    // Efeitos visuais nos inputs
    const formInputs = document.querySelectorAll('.form-input');
    formInputs.forEach(input => {
        // Efeito ao focar
        input.addEventListener('focus', function() {
            this.style.transform = 'translateY(-2px)';
            this.style.boxShadow = '0 4px 12px rgba(0, 102, 204, 0.2)';
        });
        
        // Efeito ao perder foco
        input.addEventListener('blur', function() {
            this.style.transform = 'translateY(0)';
            this.style.boxShadow = 'none';
        });
    });

    // Adicionar animação de entrada aos elementos
    const animatedElements = document.querySelectorAll('.cadastro-left, .cadastro-form-container');
    animatedElements.forEach((element, index) => {
        element.style.animation = `fadeIn 0.6s ease-out ${index * 0.1}s forwards`;
        element.style.opacity = '0';
    });
});