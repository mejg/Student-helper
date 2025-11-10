<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>STUDENT HELP | Freelancer Acadêmico</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="/static/main.css">
</head>
<body>

    <header class="header">
        <div class="container">
            <nav class="navbar">
                <div class="nav-brand">
                    <div class="logo">
                        <i class="fas fa-graduation-cap"></i>
                    </div>
                    <span class="brand-name">STUDENT HELP</span>
                </div>
                
                <div class="nav-links">
                    <a href="#inicio" class="nav-link active">Início</a>
                    <a href="#materias" class="nav-link">Matérias</a>
                    <a href="#sobre" class="nav-link">Sobre</a>
                    <a href="#avaliacoes" class="nav-link">Avaliações</a>
                </div>
                
                <div class="nav-actions">
                    <button class="btn btn-outline">Login</button>
                    <button class="btn btn-primary">Cadastrar</button>
                </div>
                
                <button class="mobile-menu-btn">
                    <i class="fas fa-bars"></i>
                </button>
            </nav>
        </div>
    </header>

    <!-- inicio ali -->
    <section id="inicio" class="hero">
        <div class="container">
            <div class="hero-content">
                <h1 class="hero-title">
                    Seu hub de ajuda Acadêmica para 
                    <span class="highlight">momentos de desespero</span>
                </h1>
                <p class="hero-description">
                    Conecte-se com estudantes especializados para qualquer trabalho ou atividade. 
                    Ajuda rápida, confiável e acessível.
                </p>
                <div class="hero-actions">
                    <button class="btn btn-large btn-accent" id="btnSolicitar">
                        <i class="fas fa-rocket"></i>
                        Solicitar Ajuda
                    </button>
                    <button class="btn btn-large btn-outline" id="btnOferecer">
                        <i class="fas fa-hand-holding-heart"></i>
                        Oferecer Ajuda
                    </button>
                </div>
                
                <div class="hero-stats">
                    <div class="stat">
                        <div class="stat-number">1K+</div>
                        <div class="stat-label">Estudantes Ativos</div>
                    </div>
                    <div class="stat">
                        <div class="stat-number">50+</div>
                        <div class="stat-label">Matérias</div>
                    </div>
                    <div class="stat">
                        <div class="stat-number">98%</div>
                        <div class="stat-label">Satisfação</div>
                    </div>
                </div>
            </div>
            
            <div class="hero-visual">
                <div class="floating-card">
                    <i class="fas fa-book"></i>
                    <span>Matérias</span>
                </div>
                <div class="floating-card">
                    <i class="fas fa-users"></i>
                    <span>Comunidade</span>
                </div>
                <div class="floating-card">
                    <i class="fas fa-star"></i>
                    <span>Avaliações</span>
                </div>
            </div>
        </div>
    </section>

    <!-- Matérias -->
    <section id="materias" class="materias-section">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Matérias Disponíveis</h2>
                <p class="section-subtitle">Encontre ajuda especializada em diversas disciplinas acadêmicas</p>
            </div>
            
            <div class="materias-filters">
                <button class="filter-btn active" data-filter="all">Todas</button>
                <button class="filter-btn" data-filter="exatas">Exatas</button>
                <button class="filter-btn" data-filter="humanas">Humanas</button>
                <button class="filter-btn" data-filter="biologicas">Biológicas</button>
            </div>
            
            <div class="materias-grid" id="materiasGrid">
                <!-- Matérias serão carregadas via JavaScript -->
            </div>
            
            <div class="materias-cta">
                <p>Não encontrou a matéria que precisa?</p>
                <button class="btn btn-outline">
                    <i class="fas fa-plus"></i>
                    Sugerir Nova Matéria
                </button>
            </div>
        </div>
    </section>

    <!-- Como Funciona -->
    <section class="como-funciona">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">Como Funciona</h2>
                <p class="section-subtitle">Simples, rápido e eficiente</p>
            </div>
            
            <div class="passos-grid">
                <div class="passo-card">
                    <div class="passo-number">01</div>
                    <div class="passo-icon">
                        <i class="fas fa-search"></i>
                    </div>
                    <h3>Encontre</h3>
                    <p>Busque por matéria ou área de conhecimento</p>
                </div>
                
                <div class="passo-card">
                    <div class="passo-number">02</div>
                    <div class="passo-icon">
                        <i class="fas fa-handshake"></i>
                    </div>
                    <h3>Conecte</h3>
                    <p>Entre em contato com estudantes especializados</p>
                </div>
                
                <div class="passo-card">
                    <div class="passo-number">03</div>
                    <div class="passo-icon">
                        <i class="fas fa-tasks"></i>
                    </div>
                    <h3>Realize</h3>
                    <p>Conclua seu trabalho com ajuda qualificada</p>
                </div>
                
                <div class="passo-card">
                    <div class="passo-number">04</div>
                    <div class="passo-icon">
                        <i class="fas fa-star"></i>
                    </div>
                    <h3>Avalie</h3>
                    <p>Compartilhe sua experiência com a comunidade</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Avaliações -->
    <section id="avaliacoes" class="avaliacoes-section">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">O Que Dizem Nossos Usuários</h2>
                <p class="section-subtitle">Feedback real de estudantes como você</p>
            </div>
            
            <div class="avaliacoes-grid">
                <div class="avaliacao-card">
                    <div class="avaliacao-header">
                        <div class="user-info">
                            <div class="user-avatar">
                                <i class="fas fa-user"></i>
                            </div>
                            <div class="user-details">
                                <div class="user-name">Karollyna Eloáh</div>
                                <div class="user-course">Vagabundagem</div>
                            </div>
                        </div>
                        <div class="rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                    <p class="avaliacao-text">
                        "Eu achei o site muito ruim, as criadoras são duas preguiçosas"
                    </p>
                    <div class="avaliacao-materia">
                        <i class="fas fa-calculator"></i>
                        Cálculo III
                    </div>
                </div>
                
                <div class="avaliacao-card">
                    <div class="avaliacao-header">
                        <div class="user-info">
                            <div class="user-avatar">
                                <i class="fas fa-user"></i>
                            </div>
                            <div class="user-details">
                                <div class="user-name">Kauê Victor</div>
                                <div class="user-course">Direito</div>
                            </div>
                        </div>
                        <div class="rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                    <p class="avaliacao-text">
                        "Lindo, criadora linda e gostosa."
                    </p>
                    <div class="avaliacao-materia">
                        <i class="fas fa-book"></i>
                        Direito Penal
                    </div>
                </div>
                
                <div class="avaliacao-card">
                    <div class="avaliacao-header">
                        <div class="user-info">
                            <div class="user-avatar">
                                <i class="fas fa-user"></i>
                            </div>
                            <div class="user-details">
                                <div class="user-name">Gabriel Lactose</div>
                                <div class="user-course">Engenharias</div>
                            </div>
                        </div>
                        <div class="rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                    <p class="avaliacao-text">
                        "Me ajudou bastante sou burro e feio e não sei de nada e nem fazer nada."
                    </p>
                    <div class="avaliacao-materia">
                        <i class="fas fa-brain"></i>
                        Orientação a Obejetos
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- rodapé do sapo não lavaa o pé -->
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

    <script src="/static/main.js"></script>

</body>
</html>