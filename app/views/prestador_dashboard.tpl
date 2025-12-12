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
                    <a href="/cliente" class="btn btn-outline">
                        <i class="fas fa-exchange-alt"></i> Modo Cliente
                    </a>
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

                <!-- Lista de Solicitações Abertas -->
                <div class="section-header">
                    <h2 class="section-title" style="color: var(--primary);">
                        <i class="fas fa-hourglass-start"></i> Pedidos Abertos (Para Aceite)
                    </h2>
                </div>

                <div class="solicitacoes-lista">
                    % if pedidos:
                        % for pedido in pedidos:
                        <div class="solicitacao-item" data-materia="{{pedido.materia}}" data-valor="{{pedido.valor}}" data-prazo="{{pedido.prazo}}">
                            <div class="solicitacao-main">
                                <div class="solicitacao-info">
                                    <div class="solicitacao-header">
                                        <span class="solicitacao-materia">
                                            % if pedido.materia == 'calculo':
                                            <i class="fas fa-calculator"></i> Cálculo
                                            % elif pedido.materia == 'programacao':
                                            <i class="fas fa-code"></i> Programação
                                            % elif pedido.materia == 'direito':
                                            <i class="fas fa-gavel"></i> Direito
                                            % elif pedido.materia == 'biologia':
                                            <i class="fas fa-dna"></i> Biologia
                                            % elif pedido.materia == 'logica':
                                            <i class="fas fa-brain"></i> Lógica
                                            % else:
                                            <i class="fas fa-book"></i> {{pedido.materia}}
                                            % end
                                        </span>
                                        % if pedido.prazo == 'hoje' or pedido.prazo == 'amanha':
                                        <span class="solicitacao-badge badge-urgente">
                                            <i class="fas fa-clock"></i> URGENTE
                                        </span>
                                        % else:
                                        <span class="solicitacao-badge badge-novo">
                                            <i class="fas fa-bolt"></i> NOVO
                                        </span>
                                        % end
                                    </div>
                                    <h3 class="solicitacao-titulo">{{pedido.titulo}}</h3>
                                    <p class="solicitacao-descricao">{{pedido.descricao[:150]}}...</p>
                                    <div class="solicitacao-detalhes">
                                        <div class="detalhe-item">
                                            <i class="fas fa-money-bill-wave"></i>
                                            <strong>R$ {{pedido.valor}},00</strong>
                                        </div>
                                        <div class="detalhe-item">
                                            <i class="fas fa-calendar-alt"></i>
                                            <span>Prazo: <strong>{{pedido.prazo}}</strong></span>
                                        </div>
                                        <div class="detalhe-item">
                                            <i class="fas fa-user"></i>
                                            <span>Cliente ID: <strong>{{pedido.autor_id}}</strong></span>
                                        </div>
                                        % if pedido.data_criacao:
                                        <div class="detalhe-item">
                                            <i class="fas fa-clock"></i>
                                            <span>Criado: <strong>{{pedido.data_criacao}}</strong></span>
                                        </div>
                                        % end
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
                                        <form action="/pedidos_aceitar/{{pedido.id}}" method="post" style="display: inline;">
                                            <button type="submit" class="btn btn-primary btn-sm btn-candidatar">
                                                <i class="fas fa-paper-plane"></i> Aceitar Pedido
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="solicitacao-extra">
                                <span class="tag"><i class="fas fa-clock"></i> {{pedido.prazo}}</span>
                                <span class="tag"><i class="fas fa-info-circle"></i> {{pedido.status}}</span>
                                <span class="tag"><i class="fas fa-tag"></i> {{pedido.materia}}</span>
                            </div>
                        </div>
                        % end
                    % else:
                    <div class="empty-state">
                        <i class="fas fa-inbox fa-3x"></i>
                        <h3>Nenhum pedido aberto disponível</h3>
                        <p>No momento não há pedidos abertos para aceitação.</p>
                    </div>
                    % end
                </div>

                <!-- Lista de Pedidos Aceitos -->
                <div class="section-header" style="margin-top: 3rem;">
                    <h2 class="section-title" style="color: var(--secondary);">
                        <i class="fas fa-spinner"></i> Meus Pedidos em Andamento
                    </h2>
                </div>

                <div class="solicitacoes-lista">
                    % if pedidos_aceitos:
                        % for pedido in pedidos_aceitos:
                        <div class="solicitacao-item" data-materia="{{pedido.materia}}" data-status="{{pedido.status}}">
                            <div class="solicitacao-main">
                                <div class="solicitacao-info">
                                    <div class="solicitacao-header">
                                        <span class="solicitacao-materia">
                                            % if pedido.materia == 'calculo':
                                            <i class="fas fa-calculator"></i> Cálculo
                                            % elif pedido.materia == 'programacao':
                                            <i class="fas fa-code"></i> Programação
                                            % elif pedido.materia == 'direito':
                                            <i class="fas fa-gavel"></i> Direito
                                            % elif pedido.materia == 'biologia':
                                            <i class="fas fa-dna"></i> Biologia
                                            % elif pedido.materia == 'logica':
                                            <i class="fas fa-brain"></i> Lógica
                                            % else:
                                            <i class="fas fa-book"></i> {{pedido.materia}}
                                            % end
                                        </span>
                                        % if pedido.status == 'em_andamento':
                                        <span class="solicitacao-badge badge-novo">
                                            <i class="fas fa-spinner"></i> EM ANDAMENTO
                                        </span>
                                        % elif pedido.status == 'concluido':
                                        <span class="solicitacao-badge badge-facil">
                                            <i class="fas fa-check-circle"></i> CONCLUÍDO
                                        </span>
                                        % end
                                    </div>
                                    <h3 class="solicitacao-titulo">{{pedido.titulo}}</h3>
                                    <p class="solicitacao-descricao">{{pedido.descricao[:150]}}...</p>
                                    <div class="solicitacao-detalhes">
                                        <div class="detalhe-item">
                                            <i class="fas fa-money-bill-wave"></i>
                                            <strong>R$ {{pedido.valor}},00</strong>
                                        </div>
                                        <div class="detalhe-item">
                                            <i class="fas fa-calendar-alt"></i>
                                            <span>Prazo: <strong>{{pedido.prazo}}</strong></span>
                                        </div>
                                        <div class="detalhe-item">
                                            <i class="fas fa-user"></i>
                                            <span>Cliente: <strong>{{pedido.autor_id}}</strong></span>
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
                                                <i class="fas fa-star"></i> Cliente
                                            </span>
                                        </div>
                                    </div>
                                    <div class="solicitacao-actions">
                                        % if pedido.status == 'em_andamento':
                                        <form action="/pedidos_concluir/{{pedido.id}}" method="post" style="display: inline;">
                                            <button type="submit" class="btn btn-accent btn-sm btn-concluir">
                                                <i class="fas fa-check-circle"></i> Marcar como Concluído
                                            </button>
                                        </form>
                                        % elif pedido.status == 'concluido':
                                        <span class="pedido-status status-concluido">
                                            <i class="fas fa-check-circle"></i> CONCLUÍDO
                                        </span>
                                        % end
                                                                                    <!-- botão Chat -->
                                            <a href="/chat/{{pedido.id}}" class="btn btn-outline btn-sm btn-chat" title="Abrir chat do pedido">
                                                <i class="fas fa-comments"></i> Chat
                                            </a>
                                    </div>
                                </div>
                            </div>
                            <div class="solicitacao-extra">
                                <span class="tag"><i class="fas fa-clock"></i> {{pedido.prazo}}</span>
                                <span class="tag"><i class="fas fa-info-circle"></i> {{pedido.status}}</span>
                                <span class="tag"><i class="fas fa-tag"></i> {{pedido.materia}}</span>
                            </div>
                        </div>
                        % end
                    % else:
                    <div class="empty-state">
                        <i class="fas fa-inbox fa-3x"></i>
                        <h3>Nenhum pedido em andamento</h3>
                        <p>Você ainda não aceitou nenhum pedido.</p>
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
                            <span class="profile-badge prestador">
                                <i class="fas fa-check-circle"></i> Prestador
                            </span>
                        </div>
                    </div>

                    <div class="profile-stats">
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <div class="stat-content">
                                <span class="stat-number">
                                    % if pedidos_aceitos:
                                    {{len(pedidos_aceitos)}}
                                    % else:
                                    0
                                    % end
                                </span>
                                <span class="stat-label">Pedidos Aceitos</span>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div class="stat-content">
                                <span class="stat-number">
                                    % if pedidos_aceitos:
                                    {{sum(1 for p in pedidos_aceitos if p.status == 'em_andamento')}}
                                    % else:
                                    0
                                    % end
                                </span>
                                <span class="stat-label">Em Andamento</span>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-comments"></i>
                            </div>
                            <div class="stat-content">
                                <span class="stat-number">0</span>
                                <span class="stat-label">Conversas</span>
                            </div>
                        </div>
                    </div>

                    <div class="profile-details">
                        <h3><i class="fas fa-info-circle"></i> Informações</h3>
                        <p class="detail-item"><strong>ID:</strong> {{user.id}}</p>
                        <p class="detail-item"><strong>Email:</strong> {{user.email}}</p>
                        % if user.curso:
                        <p class="detail-item"><strong>Curso:</strong> {{user.curso}}</p>
                        % end
                        % if user.periodo:
                        <p class="detail-item"><strong>Período:</strong> {{user.periodo}}º</p>
                        % end

                        <h3><i class="fas fa-star"></i> Especialidades</h3>
                        <div class="specialty-tags">
                            <span class="tag">
                                <i class="fas fa-code"></i> Programação
                            </span>
                            <span class="tag">
                                <i class="fas fa-calculator"></i> Cálculo
                            </span>
                            <span class="tag">
                                <i class="fas fa-brain"></i> Lógica
                            </span>
                        </div>
                    </div>

                    <div class="profile-actions">
                        <button class="btn btn-primary btn-block" id="editProfileBtn">
                            <i class="fas fa-edit"></i> Editar Perfil
                        </button>
                        <button class="btn btn-outline btn-block" id="chatBtn">
                            <i class="fas fa-comments"></i> Mensagens
                        </button>
                    </div>
                </div>

                <!-- Widget de Atividade Recente -->
                <div class="activity-widget">
                    <h3><i class="fas fa-history"></i> Atividade Recente</h3>
                    <div class="activity-list">
                        % if pedidos_aceitos and len(pedidos_aceitos) > 0:
                            % for pedido in pedidos_aceitos[:3]:
                            <div class="activity-item">
                                <i class="fas fa-check-circle activity-icon accepted"></i>
                                <div class="activity-content">
                                    <p>Aceito: "{{pedido.titulo[:20]}}..."</p>
                                    <span class="activity-time">Recentemente</span>
                                </div>
                            </div>
                            % end
                        % else:
                        <div class="activity-item">
                            <i class="fas fa-info-circle activity-icon"></i>
                            <div class="activity-content">
                                <p>Nenhuma atividade recente</p>
                                <span class="activity-time">---</span>
                            </div>
                        </div>
                        % end
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

