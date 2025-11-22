document.addEventListener('DOMContentLoaded', function () {


    const materiasData = [
        {
            id: 1,
            nome: "Matemática",
            categoria: "exatas",
            icone: "fas fa-calculator",
            descricao: "Cálculo, Álgebra, Geometria e muito mais",
            estudantes: 250,
            avaliacao: 4.9
        },
        {
            id: 2,
            nome: "Física",
            categoria: "exatas",
            icone: "fas fa-atom",
            descricao: "Mecânica, Termodinâmica, Eletromagnetismo",
            estudantes: 180,
            avaliacao: 4.8
        },
        {
            id: 3,
            nome: "Química",
            categoria: "exatas",
            icone: "fas fa-flask",
            descricao: "Orgânica, Inorgânica, Físico-Química",
            estudantes: 150,
            avaliacao: 4.7
        },
        {
            id: 4,
            nome: "Português",
            categoria: "humanas",
            icone: "fas fa-language",
            descricao: "Gramática, Redação, Literatura",
            estudantes: 200,
            avaliacao: 4.8
        },
        {
            id: 5,
            nome: "História",
            categoria: "humanas",
            icone: "fas fa-monument",
            descricao: "Brasil, Mundial, Antiga, Contemporânea",
            estudantes: 120,
            avaliacao: 4.6
        },
        {
            id: 6,
            nome: "Geografia",
            categoria: "humanas",
            icone: "fas fa-globe-americas",
            descricao: "Física, Humana, Política, Econômica",
            estudantes: 110,
            avaliacao: 4.7
        },
        {
            id: 7,
            nome: "Biologia",
            categoria: "biologicas",
            icone: "fas fa-dna",
            descricao: "Genética, Ecologia, Fisiologia",
            estudantes: 170,
            avaliacao: 4.8
        },
        {
            id: 8,
            nome: "Cálculo 1",
            categoria: "exatas",
            icone: "fas fa-square-root-alt",
            descricao: "Limites, Derivadas, Integrais",
            estudantes: 300,
            avaliacao: 4.9
        }
    ];

    function carregarMaterias(categoria = 'all') {
        const grid = document.getElementById('materiasGrid');
        grid.innerHTML = ''; 

        const filtradas = categoria === 'all'
            ? materiasData
            : materiasData.filter(m => m.categoria === categoria);

        filtradas.forEach(materia => {
            const card = document.createElement('div');
            card.classList.add('materia-card');
            card.innerHTML = `
                <i class="${materia.icone}"></i>
                <h3>${materia.nome}</h3>
                <p>${materia.descricao}</p>
                <div class="categoria">${materia.categoria}</div>
                <p><strong>${materia.estudantes}</strong> estudantes • ⭐ ${materia.avaliacao}</p>
            `;
            grid.appendChild(card);
        });
    }

    function setupFiltros() {
        const botoes = document.querySelectorAll('.filter-btn');
        botoes.forEach(btn => {
            btn.addEventListener('click', function () {
                botoes.forEach(b => b.classList.remove('active'));
                this.classList.add('active');
                const filtro = this.getAttribute('data-filter');
                carregarMaterias(filtro);
            });
        });
    }

    function setupBotoes() {
        const solicitar = document.getElementById('btnSolicitar');
        const oferecer = document.getElementById('btnOferecer');

        if (solicitar) {
            solicitar.addEventListener('click', () => {
                alert("🔹 Solicitação de ajuda iniciada!");
            });
        }

        if (oferecer) {
            oferecer.addEventListener('click', () => {
                alert("💡 Você pode oferecer ajuda agora!");
            });
        }
    }



    function initApp() {
        alert('chegeui aqui');
        carregarMaterias();
        setupFiltros();
        setupBotoes();
    }

    initApp();
});