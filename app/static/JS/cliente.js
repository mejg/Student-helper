document.addEventListener('DOMContentLoaded', function() {
    // Filtros de status
    const statusFilterBtns = document.querySelectorAll('.status-filter-btn');
    const pedidoItems = document.querySelectorAll('.pedido-item');
    
    statusFilterBtns.forEach(button => {
        button.addEventListener('click', function() {
            // Remover active de todos os botões
            statusFilterBtns.forEach(btn => btn.classList.remove('active'));
            
            // Adicionar active ao botão clicado
            this.classList.add('active');
            
            const status = this.getAttribute('data-status');
            
            // Filtrar os pedidos
            pedidoItems.forEach(item => {
                if (status === 'todos') {
                    item.style.display = 'flex';
                } else {
                    const itemStatus = item.getAttribute('data-status');
                    if (itemStatus === status) {
                        item.style.display = 'flex';
                    } else {
                        item.style.display = 'none';
                    }
                }
            });
        });
    });
    
    // Ordenação
    const sortSelect = document.getElementById('sortSelect');
    sortSelect.addEventListener('change', function() {
        const sortType = this.value;
        const itemsArray = Array.from(pedidoItems);
        
        itemsArray.sort((a, b) => {
            const valorA = parseFloat(a.getAttribute('data-valor'));
            const valorB = parseFloat(b.getAttribute('data-valor'));
            const prazoA = a.getAttribute('data-prazo');
            const prazoB = b.getAttribute('data-prazo');
            
            switch(sortType) {
                case 'valor_desc':
                    return valorB - valorA;
                case 'valor_asc':
                    return valorA - valorB;
                case 'prazo':
                    // Urgentes primeiro, depois por número de dias
                    if (prazoA === 'urgente' && prazoB !== 'urgente') return -1;
                    if (prazoA !== 'urgente' && prazoB === 'urgente') return 1;
                    if (prazoA === 'urgente' && prazoB === 'urgente') return 0;
                    return parseInt(prazoA) - parseInt(prazoB);
                case 'antigos':
                    return 1; // Em produção, seria por data
                default: // recentes
                    return -1;
            }
        });
        
        // Reordenar no DOM
        const container = document.querySelector('.pedidos-lista');
        itemsArray.forEach(item => container.appendChild(item));
    });
    
    // Busca
    const searchInput = document.getElementById('searchInput');
    searchInput.addEventListener('input', function() {
        const searchTerm = this.value.toLowerCase();
        
        pedidoItems.forEach(item => {
            const title = item.querySelector('.pedido-titulo').textContent.toLowerCase();
            const desc = item.querySelector('.pedido-descricao').textContent.toLowerCase();
            const materia = item.querySelector('.pedido-materia').textContent.toLowerCase();
            
            if (title.includes(searchTerm) || desc.includes(searchTerm) || materia.includes(searchTerm)) {
                item.style.display = 'flex';
            } else {
                item.style.display = 'none';
            }
        });
    });
    
    // Botão de novo pedido
    document.getElementById('newOrderBtn').addEventListener('click', function() {
        window.location.href = '/pedidos';
    });
    
    // Botão de editar perfil
    document.getElementById('editProfileBtn').addEventListener('click', function() {
        alert('Abrindo edição de perfil...');
    });
    
    // Botão de logout
    document.getElementById('logoutBtn').addEventListener('click', function() {
        if (confirm('Tem certeza que deseja sair?')) {
            window.location.href = '/';
        }
    });
    
    // Botão de filtros
    document.getElementById('filterBtn').addEventListener('click', function() {
        alert('Abrindo filtros avançados...');
    });
    
    // Ações dos botões dos pedidos
    document.querySelectorAll('.pedido-actions .btn').forEach(button => {
        button.addEventListener('click', function(e) {
            e.stopPropagation();
            const action = this.querySelector('i').className;
            
            if (action.includes('fa-eye')) {
                // Acompanhar/Ver
                const pedido = this.closest('.pedido-item');
                const titulo = pedido.querySelector('.pedido-titulo').textContent;
                alert(`Acompanhando pedido: ${titulo}`);
            } else if (action.includes('fa-comment-dots')) {
                // Abrir chat
                alert('Abrindo chat com o prestador...');
            } else if (action.includes('fa-star')) {
                // Avaliar
                showAvaliacaoModal();
            } else if (action.includes('fa-times')) {
                // Cancelar
                if (confirm('Tem certeza que deseja cancelar este pedido?')) {
                    this.closest('.pedido-item').style.opacity = '0.5';
                    alert('Pedido cancelado com sucesso!');
                }
            } else if (action.includes('fa-edit')) {
                // Editar
                alert('Editando pedido...');
            }
        });
    });
    
    // Botões de contato
    document.querySelectorAll('.btn-contact').forEach(button => {
        button.addEventListener('click', function(e) {
            e.stopPropagation();
            if (this.querySelector('i').className.includes('fa-comments')) {
                alert('Abrindo chat...');
            } else {
                alert('Iniciando chamada...');
            }
        });
    });
    
    // Botões de download
    document.querySelectorAll('.btn-download').forEach(button => {
        button.addEventListener('click', function(e) {
            e.stopPropagation();
            const fileName = this.parentElement.querySelector('span').textContent;
            alert(`Baixando arquivo: ${fileName}`);
        });
    });
    
    // Botões de selecionar candidato
    document.querySelectorAll('.candidato-item .btn-primary').forEach(button => {
        button.addEventListener('click', function(e) {
            e.stopPropagation();
            const candidatoName = this.parentElement.querySelector('.candidato-name').textContent;
            if (confirm(`Selecionar ${candidatoName} para este trabalho?`)) {
                this.innerHTML = '<i class="fas fa-check"></i> Selecionado';
                this.disabled = true;
                this.classList.remove('btn-primary');
                this.classList.add('btn-accent');
                
                // Atualizar status do pedido
                const pedidoItem = this.closest('.pedido-item');
                const statusBadge = pedidoItem.querySelector('.pedido-status');
                statusBadge.innerHTML = '<i class="fas fa-spinner"></i> EM ANDAMENTO';
                statusBadge.className = 'pedido-status status-em_andamento';
                pedidoItem.setAttribute('data-status', 'em_andamento');
            }
        });
    });
    
    // Botões de satisfação
    document.querySelectorAll('.btn-satisfacao').forEach(button => {
        button.addEventListener('click', function() {
            const satisfacao = this.textContent.trim();
            alert(`Obrigado por avaliar sua experiência como: ${satisfacao}`);
            
            // Resetar todos os botões
            document.querySelectorAll('.btn-satisfacao').forEach(btn => {
                btn.style.background = 'var(--dark-2)';
                btn.style.color = 'var(--text-secondary)';
                btn.style.borderColor = 'var(--dark-3)';
            });
            
            // Destacar o botão clicado
            this.style.background = 'var(--primary)';
            this.style.color = 'white';
            this.style.borderColor = 'var(--primary)';
        });
    });
    
    // Botões de sugestão
    document.querySelectorAll('.btn-suggestion').forEach(button => {
        button.addEventListener('click', function() {
            const action = this.textContent.trim();
            if (action.includes('Aumentar Valor')) {
                const novoValor = prompt('Digite o novo valor:');
                if (novoValor) {
                    const valorElement = this.closest('.pedido-item').querySelector('.detalhe-item:first-child strong');
                    valorElement.textContent = `R$ ${novoValor},00`;
                    alert('Valor atualizado com sucesso!');
                }
            } else {
                alert(`Compartilhando pedido nas redes sociais...`);
            }
        });
    });
    
    // Switches de preferências
    document.querySelectorAll('.preferencia-item input[type="checkbox"]').forEach(checkbox => {
        checkbox.addEventListener('change', function() {
            const label = this.nextElementSibling;
            if (this.checked) {
                label.style.background = 'var(--primary)';
                alert('Preferência ativada!');
            } else {
                label.style.background = 'var(--dark-3)';
                alert('Preferência desativada!');
            }
        });
    });
    
    // Click no card do pedido
    pedidoItems.forEach(card => {
        card.addEventListener('click', function(e) {
            if (!e.target.closest('.pedido-actions') && 
                !e.target.closest('.btn-contact') && 
                !e.target.closest('.btn-download') && 
                !e.target.closest('.btn-satisfacao') &&
                !e.target.closest('.btn-suggestion') &&
                !e.target.closest('.candidato-item .btn')) {
                const titulo = this.querySelector('.pedido-titulo').textContent;
                alert(`Abrindo detalhes completos do pedido: ${titulo}`);
            }
        });
    });
    
    // Função para mostrar modal de avaliação
    function showAvaliacaoModal() {
        const modalHTML = `
            <div class="modal-overlay">
                <div class="modal">
                    <div class="modal-header">
                        <h3><i class="fas fa-star"></i> Avaliar Trabalho</h3>
                        <button class="close-modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="rating-stars">
                            <i class="fas fa-star" data-rating="1"></i>
                            <i class="fas fa-star" data-rating="2"></i>
                            <i class="fas fa-star" data-rating="3"></i>
                            <i class="fas fa-star" data-rating="4"></i>
                            <i class="fas fa-star" data-rating="5"></i>
                        </div>
                        <textarea placeholder="Deixe um comentário sobre o trabalho..." rows="4"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-outline cancel-modal">Cancelar</button>
                        <button class="btn btn-primary submit-avaliacao">Enviar Avaliação</button>
                    </div>
                </div>
            </div>
        `;
        
        document.body.insertAdjacentHTML('beforeend', modalHTML);
        
        // Adicionar estilos do modal
        const style = document.createElement('style');
        style.textContent = `
            .modal-overlay {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(0, 0, 0, 0.8);
                display: flex;
                align-items: center;
                justify-content: center;
                z-index: 2000;
            }
            .modal {
                background: var(--dark-2);
                border-radius: 16px;
                padding: 2rem;
                width: 90%;
                max-width: 500px;
                border: 1px solid var(--dark-3);
            }
            .modal-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 1.5rem;
            }
            .modal-header h3 {
                display: flex;
                align-items: center;
                gap: 10px;
                color: var(--text-primary);
            }
            .close-modal {
                background: none;
                border: none;
                color: var(--text-secondary);
                font-size: 1.5rem;
                cursor: pointer;
            }
            .rating-stars {
                display: flex;
                gap: 10px;
                margin-bottom: 1.5rem;
                justify-content: center;
            }
            .rating-stars i {
                font-size: 2rem;
                color: var(--text-muted);
                cursor: pointer;
                transition: var(--transition);
            }
            .rating-stars i:hover,
            .rating-stars i.active {
                color: var(--accent);
            }
            .modal-body textarea {
                width: 100%;
                padding: 12px;
                background: var(--dark-3);
                border: 1px solid var(--dark-3);
                border-radius: 8px;
                color: var(--text-primary);
                resize: vertical;
            }
            .modal-footer {
                display: flex;
                gap: 1rem;
                margin-top: 1.5rem;
                justify-content: flex-end;
            }
        `;
        document.head.appendChild(style);
        
        // Funcionalidade do modal
        const modalOverlay = document.querySelector('.modal-overlay');
        const closeModal = document.querySelector('.close-modal');
        const cancelBtn = document.querySelector('.cancel-modal');
        const submitBtn = document.querySelector('.submit-avaliacao');
        const stars = document.querySelectorAll('.rating-stars i');
        
        let selectedRating = 0;
        
        stars.forEach(star => {
            star.addEventListener('click', function() {
                const rating = parseInt(this.getAttribute('data-rating'));
                selectedRating = rating;
                
                stars.forEach((s, index) => {
                    if (index < rating) {
                        s.classList.add('active');
                    } else {
                        s.classList.remove('active');
                    }
                });
            });
        });
        
        function closeModalFunc() {
            modalOverlay.remove();
            style.remove();
        }
        
        closeModal.addEventListener('click', closeModalFunc);
        cancelBtn.addEventListener('click', closeModalFunc);
        
        submitBtn.addEventListener('click', function() {
            if (selectedRating === 0) {
                alert('Por favor, selecione uma avaliação');
                return;
            }
            
            alert(`Avaliação enviada: ${selectedRating} estrelas! Obrigado.`);
            closeModalFunc();
        });
        
        // Fechar modal ao clicar fora
        modalOverlay.addEventListener('click', function(e) {
            if (e.target === modalOverlay) {
                closeModalFunc();
            }
        });
    }
    
    // Simular atualizações de progresso
    setInterval(() => {
        const progressBars = document.querySelectorAll('.progress-fill');
        progressBars.forEach(bar => {
            const currentWidth = parseFloat(bar.style.width) || 65;
            const newWidth = Math.min(currentWidth + Math.random() * 5, 100);
            bar.style.width = `${newWidth}%`;
            
            // Atualizar porcentagem
            const percentSpan = bar.closest('.pedido-progress').querySelector('.progress-percent');
            if (percentSpan) {
                percentSpan.textContent = `${Math.round(newWidth)}%`;
            }
            
            const newOrderBtn = document.getElementById('newOrderBtn');
            if (newOrderBtn) {
                newOrderBtn.addEventListener('click', function() {
                    window.location.href = '/pedidos_criar';
                });
}

// Logout
            const logoutBtn = document.getElementById('logoutBtn');
            if (logoutBtn) {
                logoutBtn.addEventListener('click', function() {
                    window.location.href = '/logout';
                });
}
        });
    }, 10000); 
});