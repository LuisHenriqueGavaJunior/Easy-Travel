$(document).ready(function() {
    var UserOperador = "operador";
    var SenhaOperador = "luisoperador";

    var UserLiberador = "liberador";
    var SenhaLiberador = "liberador123";

    var UserAprovador = "aprovador";
    var SenhaAprovador = "aprovador123";

    $('#loginButton').click(function() {
        var username = $('#user').val();
        var password = $('#senha').val();

        if(username === UserOperador && password === SenhaOperador) {
            window.location.href = "pages/Operador/SelecionarViagemOperador/SelecionarViagemOperador.html";} 

        else if(username === UserAprovador && password === SenhaAprovador) {
            window.location.href = "pages/Aprovador/SelecionarViagemAprovacao/SelecionarViagemAprovacao.html";}
            
        else if(username === UserLiberador && password === SenhaLiberador) {
            window.location.href = "pages/Liberador/Viagens/Viagens.html";} 
        else {
            $('#errorMessage').show();}
    });
});