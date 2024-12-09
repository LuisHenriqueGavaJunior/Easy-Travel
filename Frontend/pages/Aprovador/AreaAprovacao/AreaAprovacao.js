function expandImage(src) {
    const modalImage = document.getElementById('modalImage');
    modalImage.src = src;
    $('#imageModal').modal('show');
}

function aprovarTodos() {
    const checkboxes = document.querySelectorAll('.checkboxDespesa');
    const aprovarTodosCheckbox = document.getElementById('aprovarTodos');

    checkboxes.forEach(checkbox => {
        checkbox.checked = aprovarTodosCheckbox.checked;
    });
}

function finalizarRevisao() {
    alert('Revisão finalizada!');
    $('#confirmModal').modal('hide');
}

function showConfirmModal() {
    $('#confirmModal').modal('show');
}

function finalizarRevisao() {
    redirectTo('../SelecionarViagemAprovacao/SelecionarViagemAprovacao.html');
}
