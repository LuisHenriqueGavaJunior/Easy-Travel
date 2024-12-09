document.addEventListener("DOMContentLoaded", function () {
    const deleteButtons = document.querySelectorAll('.iconeDeletar');
    deleteButtons.forEach(button => {
        button.addEventListener('click', function () {
            const modal = $('#confirmDeleteModal');
            if (modal.length) {
                modal.modal('show'); 
                window.currentCard = button.closest('tr'); 
            } else {
                console.error("Modal não encontrado.");
            }
        });
    });

    $('#deleteExpenseButton').on('click', function () {
        if (window.currentCard) {
            window.currentCard.remove();
        }
        $('#confirmDeleteModal').modal('hide'); 
    });
});
