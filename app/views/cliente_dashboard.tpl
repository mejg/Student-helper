<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meus Pedidos | Student Help</title>
    <link rel="stylesheet" href="/static/CSS/cliente.css">
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
                    <a href="/pedidos_criar" class="btn btn-primary">
                        <i class="fas fa-plus"></i> Novo Pedido
                    </a>
                    <a href="/prestador" class="btn btn-outline">
                        <i class="fas fa-exchange-alt"></i> Modo Prestador
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
            <section class="content">
                <div class="content-header">
                    <div class="header-left">
                        <h1><i class="fas fa-tasks"></i> Meus Pedidos</h1>
                        <p class="subtitle">Acompanhe e gerencie todos os seus pedidos acadêmicos</p>
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
                                    <option value="antigos">Mais Antigos</option>
                                    <option value="valor_desc">Maior Valor</option>
                                    <option value="valor_asc">Menor Valor</option>
                                    <option value="prazo">Prazo Próximo</option>
                                </select>
                            </div>
                            <button class="btn btn-outline" id="filterBtn">
                                <i class="fas fa-filter"></i> Filtros
                            </button>
                        </div>
                    </div>
                </div>

                <div class="status-quick-filter">
                    <button class="status-filter-btn active" data-status="todos">
                        <i class="fas fa-layer-group"></i> Todos
                    </button>
                    <button class="status-filter-btn" data-status="aberto">
                        <i class="fas fa-hourglass-start"></i> Aberto
                    </button>
                    <button class="status-filter-btn" data-status="em_andamento">
                        <i class="fas fa-spinner"></i> Em Andamento
                    </button>
                    <button class="status-filter-btn" data-status="concluido">
                        <i class="fas fa-check-circle"></i> Concluído
                    </button>
                    <button class="status-filter-btn" data-status="cancelado">
                        <i class="fas fa-times-circle"></i> Cancelado
                    </button>
                </div>

                <div class="pedidos-lista">
                    % if pedidos:
                        % for pedido in pedidos:
                        <div class="pedido-item" data-status="{{pedido.status}}" data-valor="{{pedido.valor}}" data-prazo="{{pedido.prazo}}">
                            <div class="pedido-main">
                                <div class="pedido-info">
                                    <div class="pedido-header">
                                        <span class="pedido-materia">
                                            <i class="fas fa-book"></i> {{pedido.materia}}
                                        </span>
                                        <div class="pedido-status-group">
                                            % if pedido.status == 'aberto':
                                            <span class="pedido-status status-aberto">
                                                <i class="fas fa-hourglass-start"></i> ABERTO
                                            </span>
                                            % elif pedido.status == 'em_andamento':
                                            <span class="pedido-status status-em_andamento">
                                                <i class="fas fa-spinner"></i> EM ANDAMENTO
                                            </span>
                                            % elif pedido.status == 'concluido':
                                            <span class="pedido-status status-concluido">
                                                <i class="fas fa-check-circle"></i> CONCLUÍDO
                                            </span>
                                            % elif pedido.status == 'cancelado':
                                            <span class="pedido-status status-cancelado">
                                                <i class="fas fa-times-circle"></i> CANCELADO
                                            </span>
                                            % else:
                                            <span class="pedido-status">{{pedido.status}}</span>
                                            % end

                                            % if pedido.prazo == 'urgente' or pedido.prazo == 'hoje':
                                            <span class="pedido-badge badge-urgente">
                                                <i class="fas fa-clock"></i> URGENTE
                                            </span>
                                            % end
                                        </div>
                                    </div>
                                    <h3 class="pedido-titulo">{{pedido.titulo}}</h3>

                                    <p class="pedido-descricao">{{pedido.descricao[:200]}}...</p>
                                    <div class="pedido-detalhes">
                                        <div class="detalhe-item">
                                            <i class="fas fa-money-bill-wave"></i>
                                            <strong>R$ {{pedido.valor}}</strong>
                                        </div>
                                        <div class="detalhe-item">
                                            <i class="fas fa-calendar-alt"></i>
                                            <span>Prazo: <strong>{{pedido.prazo}}</strong></span>
                                        </div>
                                        % if pedido.prestador_id:
                                        <div class="detalhe-item">
                                            <i class="fas fa-user-check"></i>
                                            <span>Prestador: <strong>{{pedido.prestador_id}}</strong></span>
                                        </div>
                                        % end
                                    </div>
                                </div>

                                % if pedido.status == 'aberto':
                                <div class="pedido-candidatos">
                                    <div class="candidatos-header">
                                        <h4><i class="fas fa-user-friends"></i> Candidatos</h4>
                                        <button class="btn btn-sm btn-outline">
                                            <i class="fas fa-users"></i> Ver Todos
                                        </button>
                                    </div>
                                    <div class="pedido-actions">
                                        <button class="btn btn-outline btn-sm btn-editar">
                                            <i class="fas fa-edit"></i> Editar
                                        </button>
                                        <button class="btn btn-accent btn-sm btn-cancelar">
                                            <i class="fas fa-times"></i> Cancelar
                                        </button>
                                    </div>
                                </div>
                                % elif pedido.status == 'em_andamento':
                                <div class="pedido-prestador">
                                    <div class="prestador-info">
                                        <div class="prestador-avatar">
                                            <i class="fas fa-user-tie"></i>
                                        </div>
                                        <div class="prestador-details">
                                            <span class="prestador-name">{{pedido.prestador_id or '—'}}</span>
                                        </div>
                                    </div>
                                    <div class="pedido-actions">
                                        <button class="btn btn-outline btn-sm btn-acompanhar">
                                            <i class="fas fa-eye"></i> Acompanhar
                                        </button>
                                        <button class="btn btn-primary btn-sm btn-chat">
                                            <i class="fas fa-comment-dots"></i> Mensagem
                                        </button>
                                    </div>
                                </div>
                                % elif pedido.status == 'concluido':
                                <div class="pedido-conclusao">
                                    <div class="conclusao-header">
                                        <h4><i class="fas fa-clipboard-check"></i> Trabalho Entregue</h4>
                                    </div>
                                    <div class="pedido-actions">
                                        <button class="btn btn-outline btn-sm btn-ver">
                                            <i class="fas fa-eye"></i> Ver Entrega
                                        </button>
                                        <button class="btn btn-primary btn-sm btn-avaliar">
                                            <i class="fas fa-star"></i> Avaliar
                                        </button>
                                    </div>
                                </div>
                                % end
                            </div>

                            % if pedido.status == 'em_andamento':
                            <div class="pedido-progress">
                                <div class="progress-header">
                                    <span>Progresso do Trabalho</span>
                                    <span class="progress-percent">--</span>
                                </div>
                                <div class="progress-bar">
                                    <div class="progress-fill" style="width: 50%"></div>
                                </div>
                            </div>
                            % elif pedido.status == 'aberto' and (pedido.prazo == 'urgente' or pedido.prazo == 'hoje'):
                            <div class="pedido-extra">
                                <div class="urgency-warning">
                                    <i class="fas fa-exclamation-circle"></i>
                                    <span>Pedido urgente! Prazo próximo.</span>
                                </div>
                            </div>
                            % elif pedido.status == 'concluido':
                            <div class="pedido-satisfacao">
                                <div class="satisfacao-survey">
                                    <h5>Como foi sua experiência?</h5>
                                    <div class="satisfacao-buttons">
                                        <button class="btn-satisfacao">
                                            <i class="fas fa-smile"></i> Excelente
                                        </button>
                                        <button class="btn-satisfacao">
                                            <i class="fas fa-smile"></i> Boa
                                        </button>
                                        <button class="btn-satisfacao">
                                            <i class="fas fa-meh"></i> Regular
                                        </button>
                                        <button class="btn-satisfacao">
                                            <i class="fas fa-frown"></i> Ruim
                                        </button>
                                    </div>
                                </div>
                            </div>
                            % end
                                                <a href="/chat/{{pedido.id}}" class="btn btn-outline btn-sm btn-chat" title="Abrir chat do pedido">
                                                <i class="fas fa-comments"></i> Chat
                                            </a>
                        </div>
                        % end
                    % else:
                    <div class="empty-state">
                        <i class="fas fa-inbox fa-3x"></i>
                        <h3>Nenhum pedido encontrado</h3>
                        <p>Você ainda não criou nenhum pedido. Comece agora!</p>
                        <a href="/pedidos_criar" class="btn btn-primary">
                            <i class="fas fa-plus"></i> Criar Primeiro Pedido
                        </a>
                    </div>
                    % end
                </div>
            </section>

            <aside class="profile-sidebar">
                <div class="profile-card">
                    <div class="profile-header">
                        <div class="profile-avatar-large">
                            <i class="fas fa-user-graduate"></i>
                            <span class="online-status"></span>
                        </div>
                        <div class="profile-info">
                            <h2 class="profile-name">{{user.nome or 'Usuário'}}</h2>
                            <p class="profile-email">{{user.email}}</p>
                            <span class="profile-badge client">
                                <i class="fas fa-user"></i> {{user.tipo or 'Cliente'}}
                            </span>
                        </div>
                    </div>

                    <div class="profile-stats">
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-hourglass-start"></i>
                            </div>
                            <div class="stat-content">
                                <span class="stat-number">
                                    % if pedidos:
                                    {{sum(1 for p in pedidos if p.status == 'aberto')}}
                                    % else:
                                    0
                                    % end
                                </span>
                                <span class="stat-label">Abertos</span>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-spinner"></i>
                            </div>
                            <div class="stat-content">
                                <span class="stat-number">
                                    % if pedidos:
                                    {{sum(1 for p in pedidos if p.status == 'em_andamento')}}
                                    % else:
                                    0
                                    % end
                                </span>
                                <span class="stat-label">Em Andamento</span>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <div class="stat-content">
                                <span class="stat-number">
                                    % if pedidos:
                                    {{sum(1 for p in pedidos if p.status == 'concluido')}}
                                    % else:
                                    0
                                    % end

                                </span>
                                <span class="stat-label">Concluídos</span>
                            </div>
                        </div>
                    </div>

                    <div class="profile-details">
                        <h3><i class="fas fa-info-circle"></i> Informações</h3>
                        <p class="detail-item"><strong>ID:</strong> {{user.id}}</p>
                        <p class="detail-item"><strong>Tipo:</strong> {{user.tipo}}</p>
                        <p class="detail-item"><strong>Email:</strong> {{user.email}}</p>

                        <h3><i class="fas fa-graduation-cap"></i> Informações Acadêmicas</h3>
                        % if user.curso:
                        <p class="detail-item">{{user.curso}}</p>
                        % end
                        % if user.periodo:
                        <p class="detail-item">{{user.periodo}}º período</p>
                        % end

                        <h3><i class="fas fa-history"></i> Histórico Recente</h3>
                        <div class="history-items">
                            % if pedidos and len(pedidos) > 0:
                                % for pedido in pedidos[:2]:
                                <div class="history-item">
                                    <i class="fas fa-plus-circle history-icon created"></i>
                                    <div class="history-content">
                                        <p>Pedido "{{pedido.titulo[:20]}}..." criado</p>
                                        <span class="history-time">Recentemente</span>
                                    </div>
                                </div>
                                % end
                            % else:
                            <div class="history-item">
                                <i class="fas fa-info-circle history-icon"></i>
                                <div class="history-content">
                                    <p>Nenhuma atividade recente</p>
                                    <span class="history-time">---</span>
                                </div>
                            </div>
                            % end
                        </div>
                    </div>

                    <div class="preferencias">
                        <h3><i class="fas fa-cog"></i> Preferências</h3>
                        <div class="preferencia-item">
                            <span>Notificações por email</span>
                            <label class="switch">
                                <input type="checkbox" checked>
                                <span class="slider"></span>
                            </label>
                        </div>
                        <div class="preferencia-item">
                            <span>Lembretes de prazo</span>
                            <label class="switch">
                                <input type="checkbox" checked>
                                <span class="slider"></span>
                            </label>
                        </div>
                    </div>

                    <div class="profile-actions">
                        <a href="/pedidos_criar" class="btn btn-primary btn-block" id="newOrderBtn">
                            <i class="fas fa-plus"></i> Novo Pedido
                        </a>
                        <a href="/perfil" class="btn btn-outline btn-block" id="editProfileBtn">
                            <i class="fas fa-edit"></i> Editar Perfil
                        </a>
                    </div>
                </div>

                <div class="support-widget">
                    <h3><i class="fas fa-headset"></i> Precisa de Ajuda?</h3>
                    <p class="support-text">Nossa equipe está aqui para ajudar você com qualquer dúvida sobre seus pedidos.</p>
                    <div class="support-actions">
                        <button class="btn btn-outline btn-block">
                            <i class="fas fa-question-circle"></i> Central de Ajuda
                        </button>
                        <button class="btn btn-primary btn-block">
                            <i class="fas fa-comments"></i> Falar com Suporte
                        </button>
                    </div>
                </div>
            </aside>
        </div>
    </main>

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

    <script src="/static/JS/cliente.js"></script>
</body>
</html>
