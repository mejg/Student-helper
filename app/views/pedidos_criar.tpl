<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Publicar Pedido | Student Help</title>
    <link rel="stylesheet" href="/static/CSS/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <nav class="navbar">
                <div class="nav-brand">
                    <span class="brand-name">STUDENT HELP</span>
                </div>
            </nav>
        </div>
    </header>

    <div class="form-container">
        <div class="form-card">
            <h2><i class="fas fa-file-invoice"></i> Publicar Novo Pedido</h2>
            
            <form action="/pedidos_criar" method="post">
                
                <div class="form-group">
                    <br><br><br>
                    <label for="titulo">Título do Pedido:</label>
                    <input type="text" id="titulo" name="titulo" required placeholder="Ex: Resolução de 5 exercícios de Cálculo I">
                </div>
                
                <div class="two-columns">
                    <div class="form-group">
                        <label for="materia">Matéria:</label>
                        <select id="materia" name="materia" required>
                            <option value="">Selecione a matéria</option>
                            <option value="oo">Orientação a Objetos</option>
                            <option value="calculo">Cálculo I/II/III</option>
                            <option value="direito_penal">Direito Penal</option>
                            <option value="logica">Lógica e Algoritmos</option>
                            <option value="biologia">Biologia</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="valor">Valor Oferecido (R$):</label>
                        <input type="number" step="0.01" id="valor" name="valor" required placeholder="Ex: 50.00">
                    </div>
                </div>

                <div class="form-group">
                    <label for="prazo">Prazo de Entrega:</label>
                    <input type="date" id="prazo" name="prazo" required>
                </div>
                
                <div class="form-group">
                    <label for="descricao">Descrição Completa:</label>
                    <textarea id="descricao" name="descricao" rows="8" required placeholder="Descreva os requisitos, format, links e qualquer detalhe crucial."></textarea>
                </div>
                
                <button type="submit" class="btn btn-large btn-accent btn-submit">
                    <i class="fas fa-paper-plane"></i> Publicar Pedido
                </button>
                
            </form>
        </div>
    </div>
    
    <script src="/static/main.js"></script>
</body>
</html>