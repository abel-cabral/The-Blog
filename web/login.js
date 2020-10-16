/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$("#formLogin").validate({
    debug: true,
    rules: {},
    messages: {
        cpf: {
            required: "Informe seu CPF"
        },
        senha: {
            required: "Informe sua senha"
        }
    }
});
