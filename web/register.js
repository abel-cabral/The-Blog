$.validator.messages.required = "Este campo é obrigatório";
$("#formCadastro").validate({
    // debug: true,
    rules: {},
    messages: {        
        email: {
            required: "Informe um email válido"
        },
        nome: {
            required: "Nome completo é obrigatório"
        }
    }
});
