function esconderTexto(id) {
    $('.' + id).hide();
    mostrarEditor(id);
}

function mostrarEditor(id) {
    $('#' + id).show();
}