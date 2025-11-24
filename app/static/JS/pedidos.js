document.addEventListener('DOMContentLoaded', function() {
    const prazoInput = document.getElementById('prazo');
    const today = new Date();
    const formattedDate = today.toISOString().split('T')[0];
    prazoInput.min = formattedDate;
    
    const materiaSelect = document.getElementById('materia');
    const materiaItems = document.querySelectorAll('.materias-list li');
    
    materiaItems.forEach(item => {
        item.addEventListener('click', function() {

            materiaItems.forEach(i => i.classList.remove('active'));
            
            this.classList.add('active');
            
            const materiaValue = this.getAttribute('data-value');
            materiaSelect.value = materiaValue;
        });
    });
    

    const form = document.getElementById('pedidoForm');
    form.addEventListener('submit', function(e) {
        e.preventDefault();
        
        const titulo = document.getElementById('titulo').value.trim();
        const materia = document.getElementById('materia').value;
        const valor = document.getElementById('valor').value;
        const prazo = document.getElementById('prazo').value;
        const descricao = document.getElementById('descricao').value.trim();
        
        if (!titulo) {
            alert('Por favor, insira um título para o pedido.');
            return;
        }
        
        if (!materia) {
            alert('Por favor, selecione uma matéria.');
            return;
        }
        
        if (!valor || parseFloat(valor) <= 0) {
            alert('Por favor, insira um valor válido.');
            return;
        }
        
        if (!prazo) {
            alert('Por favor, selecione um prazo.');
            return;
        }
        
        if (!descricao) {
            alert('Por favor, insira uma descrição para o pedido.');
            return;
        }
        

        alert('Pedido publicado com sucesso!');

    });
    
    const valorInput = document.getElementById('valor');
    valorInput.addEventListener('input', function() {

        let value = this.value.replace(/\D/g, '');
        

        if (value.length > 2) {
            value = value.substring(0, value.length - 2) + '.' + value.substring(value.length - 2);
        }
        

        this.value = value;
    });
});