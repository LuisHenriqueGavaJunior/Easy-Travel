document.addEventListener("DOMContentLoaded", function () {
    const deleteButtons = document.querySelectorAll('.iconeDeletar');
    deleteButtons.forEach(button => {
        button.addEventListener('click', function() {
            const modal = $('#confirmDeleteModal'); 
            modal.modal('show');  
            window.currentCard = button.closest('.cardDespesa');
        });
    });

    $('#deleteExpenseButton').on('click', function() {
        if (window.currentCard) {
            window.currentCard.remove();
        }

        const modal = $('#confirmDeleteModal');
        modal.modal('hide');
    });
});

document.addEventListener("DOMContentLoaded", function () {
    var finalizarButton = document.getElementById('finalizarViagemButton');
    if (finalizarButton) {
        finalizarButton.addEventListener('click', function() {
            $('#confirmacaoModal').modal('show'); 
        });
    }

    var confirmarButton = document.getElementById('confirmarFinalizacao');
    if (confirmarButton) {
        confirmarButton.addEventListener('click', function() {
            $('#confirmacaoModal').modal('hide'); 
            redirectTo('../SelecionarViagemOperador/SelecionarViagemOperador.html');
        });
    }
});