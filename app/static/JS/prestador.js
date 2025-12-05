document.addEventListener('DOMContentLoaded', function() {
    // Filtros de matéria
    const materiaFilterBtns = document.querySelectorAll('.materia-filter-btn');
    const solicitacaoItems = document.querySelectorAll('.solicitacao-item');
    
    materiaFilterBtns.forEach(button => {
        button.addEventListener('click', function() {
            // Remover active de todos os botões
            materiaFilterBtns.forEach(btn => btn.classList.remove('active'));
            
            // Adicionar active ao botão clicado
            this.classList.add('active');
            
            const materia = this.getAttribute('data-materia');
            
            // Filtrar as solicitações
            solicitacaoItems.forEach(item => {
                if (materia === 'todas' || materia === 'outras') {
                    item.style.display = 'flex';
                } else {
                    const itemMateria = item.getAttribute('data-materia');
                    if (itemMateria === materia) {
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
        const itemsArray = Array.from(solicitacaoItems);
        
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
                case 'sem_candidatos':
                    const candidatosA = parseInt(a.querySelector('.detalhe-item:nth-child(3) span').textContent);
                    const candidatosB = parseInt(b.querySelector('.detalhe-item:nth-child(3) span').textContent);
                    return candidatosA - candidatosB;
                default: // recentes
                    return 0;
            }
        });
        
        // Reordenar no DOM
        const container = document.querySelector('.solicitacoes-lista');
        itemsArray.forEach(item => container.appendChild(item));
    });
    
    // Busca
    const searchInput = document.getElementById('searchInput');
    searchInput.addEventListener('input', function() {
        const searchTerm = this.value.toLowerCase();
        
        solicitacaoItems.forEach(item => {
            const title = item.querySelector('.solicitacao-titulo').textContent.toLowerCase();
            const desc = item.querySelector('.solicitacao-descricao').textContent.toLowerCase();
            const materia = item.querySelector('.solicitacao-materia').textContent.toLowerCase();
            
            if (title.includes(searchTerm) || desc.includes(searchTerm) || materia.includes(searchTerm)) {
                item.style.display = 'flex';
            } else {
                item.style.display = 'none';
            }
        });
    });
    
    // Botão de candidatura
    const candidatarBtns = document.querySelectorAll('.btn-candidatar');
    candidatarBtns.forEach(button => {
        button.addEventListener('click', function() {
            const solicitacaoItem = this.closest('.solicitacao-item');
            const titulo = solicitacaoItem.querySelector('.solicitacao-titulo').textContent;
            const valor = solicitacaoItem.querySelector('.detalhe-item:first-child strong').textContent;
            
            if (confirm(`Deseja se candidatar para "${titulo}" no valor de ${valor}?`)) {
                this.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Enviando...';
                this.disabled = true;
                
                // Simular envio
                setTimeout(() => {
                    this.innerHTML = '<i class="fas fa-check"></i> Candidatura Enviada';
                    this.classList.remove('btn-primary');
                    this.classList.add('btn-accent');
                    
                    // Atualizar contador de candidatos
                    const candidatosSpan = solicitacaoItem.querySelector('.detalhe-item:nth-child(3) span');
                    const currentCount = parseInt(candidatosSpan.textContent);
                    candidatosSpan.textContent = currentCount + 1;
                    
                    // Adicionar à atividade recente
                    addActivityToFeed(`Candidatura enviada para "${titulo.substring(0, 30)}..."`);
                }, 1500);
            }
        });
    });
    
    // Botão de detalhes
    const detalhesBtns = document.querySelectorAll('.btn-detalhes');
    detalhesBtns.forEach(button => {
        button.addEventListener('click', function() {
            const solicitacaoItem = this.closest('.solicitacao-item');
            const titulo = solicitacaoItem.querySelector('.solicitacao-titulo').textContent;
            
            // Em uma implementação real, isso abriria um modal ou redirecionaria
            alert(`Abrindo detalhes completos de: ${titulo}`);
        });
    });
    
    // Botão de notificações
    const notificationBell = document.getElementById('notificationBell');
    notificationBell.addEventListener('click', function() {
        alert('Abrindo notificações...');
        // Zerar contador
        this.querySelector('.badge-count').textContent = '0';
        this.querySelector('.badge-count').style.display = 'none';
    });
    
    // Botões do perfil
    document.getElementById('editProfileBtn').addEventListener('click', function() {
        alert('Abrindo edição de perfil...');
    });
    
    document.getElementById('viewPortfolioBtn').addEventListener('click', function() {
        alert('Abrindo portfólio...');
    });
    
    // Botão de logout
    document.getElementById('logoutBtn').addEventListener('click', function() {
        if (confirm('Tem certeza que deseja sair?')) {
            window.location.href = '/';
        }
    });
    
    // Botão de filtros avançados
    document.getElementById('filterBtn').addEventListener('click', function() {
        alert('Abrindo filtros avançados...');
    });
    
    // Função para adicionar atividade ao feed
    function addActivityToFeed(text) {
        const activityList = document.querySelector('.activity-list');
        const newActivity = document.createElement('div');
        newActivity.className = 'activity-item';
        newActivity.innerHTML = `
            <i class="fas fa-paper-plane activity-icon sent"></i>
            <div class="activity-content">
                <p>${text}</p>
                <span class="activity-time">Agora</span>
            </div>
        `;
        activityList.insertBefore(newActivity, activityList.firstChild);
        
        // Limitar a 5 atividades
        if (activityList.children.length > 5) {
            activityList.removeChild(activityList.lastChild);
        }
    }
    
    // Simular algumas notificações iniciais
    setTimeout(() => {
        addActivityToFeed('Você foi selecionado para "Exercícios de Cálculo"');
    }, 2000);
});