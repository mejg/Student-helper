<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Solicitações | Student Help</title>
    <link rel="stylesheet" href="/static/CSS/prestador.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <nav class="navbar">
                <div class="nav-brand">
                    <span class="brand-name">STUDENT HELP</span>
                </div>
                <div class="nav-actions">
                    <div class="notification-badge" id="notificationBell">
                        <i class="fas fa-bell"></i>
                        <span class="badge-count">3</span>
                    </div>
                    <button class="btn btn-outline" id="logoutBtn">
                        <i class="fas fa-sign-out-alt"></i> Sair
                    </button>
                </div>
            </nav>
        </div>
    </header>

    <main class="dashboard">
        <div class="container">
            <!-- Conteúdo Principal - Solicitações -->
            <section class="content">
                <div class="content-header">
                    <div class="header-left">
                        <h1><i class="fas fa-handshake"></i> Solicitações Disponíveis</h1>
                        <p class="subtitle">Encontre trabalhos que combinam com suas habilidades</p>
                    </div>
                    <div class="header-actions">
                        <div class="search-box">
                            <i class="fas fa-search"></i>
                            <input type="text" id="searchInput" placeholder="Buscar por título, matéria...">
                        </div>
                        <div class="filters">
                            <div class="sort-dropdown">
                                <select id="sortSelect">
                                    <option value="recentes">Mais Recentes</option>
                                    <option value="valor_desc">Maior Valor</option>
                                    <option value="valor_asc">Menor Valor</option>
                                    <option value="prazo">Prazo Próximo</option>
                                    <option value="sem_candidatos">Sem Candidatos</option>
                                </select>
                            </div>
                            <button class="btn btn-outline" id="filterBtn">
                                <i class="fas fa-filter"></i> Filtros Avançados
                            </button>
                        </div>
                    </div>
                </div>
                
                <!-- Filtros de Matéria -->
                <div class="materias-quick-filter">
                    <button class="materia-filter-btn active" data-materia="todas">
                        <i class="fas fa-layer-group"></i> Todas
                    </button>
                    <button class="materia-filter-btn" data-materia="calculo">
                        <i class="fas fa-calculator"></i> Cálculo
                    </button>
                    <button class="materia-filter-btn" data-materia="programacao">
                        <i class="fas fa-code"></i> Programação
                    </button>
                    <button class="materia-filter-btn" data-materia="direito">
                        <i class="fas fa-gavel"></i> Direito
                    </button>
                    <button class="materia-filter-btn" data-materia="biologia">
                        <i class="fas fa-dna"></i> Biologia
                    </button>
                    <button class="materia-filter-btn" data-materia="logica">
                        <i class="fas fa-brain"></i> Lógica
                    </button>
                    <button class="materia-filter-btn" data-materia="outras">
                        <i class="fas fa-ellipsis-h"></i> Outras
                    </button>
                </div>
                
                <!-- Lista de Solicitações -->
                <div class="solicitacoes-lista">
                    % for pedido in pedidos:
                    <!-- Pedido Dinâmico: {{pedido.titulo}} -->
                    <div class="solicitacao-item" data-materia="{{pedido.materia}}" data-valor="{{pedido.valor}}" data-prazo="{{pedido.prazo}}">
                        <div class="solicitacao-main">
                            <div class="solicitacao-info">
                                <div class="solicitacao-header">
                                    <span class="solicitacao-materia">
                                        <i class="fas fa-book"></i> {{pedido.materia}}
                                    </span>
                                    <span class="solicitacao-badge badge-novo">
                                        <i class="fas fa-bolt"></i> NOVO
                                    </span>
                                </div>
                                <h3 class="solicitacao-titulo">{{pedido.titulo}}</h3>
                                <p class="solicitacao-descricao">{{pedido.descricao}}</p>
                                <div class="solicitacao-detalhes">
                                    <div class="detalhe-item">
                                        <i class="fas fa-money-bill-wave"></i>
                                        <strong>R$ {{pedido.valor}},00</strong>
                                    </div>
                                    <div class="detalhe-item">
                                        <i class="fas fa-calendar-alt"></i>
                                        <span>Entrega: <strong>{{pedido.prazo}}</strong></span>
                                    </div>
                                    <div class="detalhe-item">
                                        <i class="fas fa-clock"></i>
                                        <span>Criado: <strong>{{pedido.data_criacao}}</strong></span>
                                    </div>
                                </div>
                            </div>
                            <div class="solicitacao-client">
                                <div class="client-info">
                                    <div class="client-avatar">
                                        <i class="fas fa-user"></i>
                                    </div>
                                    <div class="client-details">
                                        <span class="client-name">Cliente ID: {{pedido.autor_id}}</span>
                                        <span class="client-rating">
                                            <i class="fas fa-star"></i> Novo cliente
                                        </span>
                                    </div>
                                </div>
                                <div class="solicitacao-actions">
                                    <button class="btn btn-outline btn-sm btn-detalhes">
                                        <i class="fas fa-eye"></i> Detalhes
                                    </button>
                                    <button class="btn btn-primary btn-sm btn-candidatar">
                                        <i class="fas fa-paper-plane"></i> Candidatar-se
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="solicitacao-extra">
                            <span class="tag"><i class="fas fa-clock"></i> {{pedido.data_criacao}}</span>
                            <span class="tag"><i class="fas fa-status"></i> {{pedido.status}}</span>
                        </div>
                    </div>
                    % end
                </div>
            </section>

            <!-- Sidebar do Perfil à Direita -->
            <aside class="profile-sidebar">
                <div class="profile-card">
                    <div class="profile-header">
                        <div class="profile-avatar-large">
                            <i class="fas fa-user-tie"></i>
                            <span class="online-status"></span>
                        </div>
                        <div class="profile-info">
                            <h2 class="profile-name">{{user.nome}}</h2>
                            <p class="profile-email">{{user.email}}</p>
                            <p class="profile-id">ID: {{user.id}}</p>
                            <p class="profile-tipo">Tipo: {{user.tipo}}</p>
                            <span class="profile-badge prestador">
                                <i class="fas fa-check-circle"></i> Prestador Verificado
                            </span>
                        </div>
                    </div>
                    
                    <div class="profile-stats">
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-star"></i>
                            </div>
                            <div class="stat-content">
                                <span class="stat-number">4.8</span>
                                <span class="stat-label">Avaliação Média</span>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <div class="stat-content">
                                <span class="stat-number">15</span>
                                <span class="stat-label">Trabalhos Concluídos</span>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div class="stat-content">
                                <span class="stat-number">3</span>
                                <span class="stat-label">Em Andamento</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="profile-details">
                        <h3><i class="fas fa-graduation-cap"></i> Formação</h3>
                        <p class="detail-item">Ciência da Computação - UFMG</p>
                        <p class="detail-item">4º período</p>
                        
                        <h3><i class="fas fa-trophy"></i> Conquistas</h3>
                        <div class="badges">
                            <span class="achievement-badge">
                                <i class="fas fa-rocket"></i> Iniciante
                            </span>
                            <span class="achievement-badge">
                                <i class="fas fa-bolt"></i> Rápido
                            </span>
                            <span class="achievement-badge">
                                <i class="fas fa-heart"></i> Qualidade
                            </span>
                        </div>
                    </div>
                    
                    <div class="specialties">
                        <h3><i class="fas fa-star"></i> Especialidades</h3>
                        <div class="specialty-tags">
                            <span class="tag active">
                                <i class="fas fa-code"></i> Programação
                                <span class="tag-count">8</span>
                            </span>
                            <span class="tag">
                                <i class="fas fa-calculator"></i> Cálculo
                                <span class="tag-count">5</span>
                            </span>
                            <span class="tag">
                                <i class="fas fa-brain"></i> Lógica
                                <span class="tag-count">2</span>
                            </span>
                            <button class="btn-add-tag">
                                <i class="fas fa-plus"></i>
                            </button>
                        </div>
                    </div>
                    
                    <div class="profile-actions">
                        <button class="btn btn-primary btn-block" id="editProfileBtn">
                            <i class="fas fa-edit"></i> Editar Perfil
                        </button>
                        <button class="btn btn-outline btn-block" id="viewPortfolioBtn">
                            <i class="fas fa-briefcase"></i> Ver Portfólio
                        </button>
                    </div>
                </div>
                
                <!-- Widget de Atividade Recente -->
                <div class="activity-widget">
                    <h3><i class="fas fa-history"></i> Atividade Recente</h3>
                    <div class="activity-list">
                        <div class="activity-item">
                            <i class="fas fa-paper-plane activity-icon sent"></i>
                            <div class="activity-content">
                                <p>Candidatura enviada para "Sistema Python"</p>
                                <span class="activity-time">Hoje 10:30</span>
                            </div>
                        </div>
                        <div class="activity-item">
                            <i class="fas fa-check-circle activity-icon accepted"></i>
                            <div class="activity-content">
                                <p>Selecionado para "Exercícios Cálculo"</p>
                                <span class="activity-time">Ontem 14:20</span>
                            </div>
                        </div>
                        <div class="activity-item">
                            <i class="fas fa-star activity-icon review"></i>
                            <div class="activity-content">
                                <p>Recebeu avaliação 5 estrelas</p>
                                <span class="activity-time">2 dias atrás</span>
                            </div>
                        </div>
                    </div>
                </div>
            </aside>
        </div>
    </main>

    <!-- Footer igual à homepage -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <div class="footer-logo">
                        <i class="fas fa-graduation-cap"></i>
                        STUDENT HELP
                    </div>
                    <p class="footer-description">
                        Conectando estudantes para compartilhar conhecimento e 
                        superar desafios acadêmicos juntos.
                    </p>
                    <div class="social-links">
                        <a href="#" class="social-link">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a href="#" class="social-link">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#" class="social-link">
                            <i class="fab fa-linkedin"></i>
                        </a>
                        <a href="#" class="social-link">
                            <i class="fab fa-whatsapp"></i>
                        </a>
                    </div>
                </div>
                
                <div class="footer-section">
                    <h3>Links Rápidos</h3>
                    <a href="#inicio">Início</a>
                    <a href="#materias">Matérias</a>
                    <a href="#sobre">Sobre Nós</a>
                    <a href="#avaliacoes">Avaliações</a>
                </div>
                
                <div class="footer-section">
                    <h3>Suporte</h3>
                    <a href="#">Central de Ajuda</a>
                    <a href="#">FAQ</a>
                    <a href="#">Contato</a>
                    <a href="#">Tutoriais</a>
                </div>
                
                <div class="footer-section">
                    <h3>Legal</h3>
                    <a href="#">Termos de Uso</a>
                    <a href="#">Política de Privacidade</a>
                    <a href="#">Cookies</a>
                    <a href="#">DMCA</a>
                </div>
            </div>
            
            <div class="footer-bottom">
                <p>&copy; 2025 STUDENT HELP. Todos os direitos reservados.</p>
                <p>Feito com ❤️ para estudantes</p>
            </div>
        </div>
    </footer>

    <script src="/static/JS/prestador.js"></script>
</body>
</html>