<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <jsp:include page="cabecalho.html" />
    </head>
    <body>
        <div class="container">
            <jsp:include page="menu_principal.html" />

            <div class="row mb-3 mt-5">
                <div class="col-4 offset-4 card bg-ligth">
                    <form action="Login" method="POST">
                        <div class="form-group mt-2">           
                            <label class="control-label requerido" for="cpf">CPF*</label>
                            <input type="text" name="cpf" id="cpf" class="form-control cpf" placeholder="Digite o cpf" maxlength="14"
                                   autocomplete="on">
                        </div>
                        <div class="form-group">
                            <label class="control-label requerido" for="senha">Senha*</label>
                            <input type="password" class="form-control" name="senha" id="senha" placeholder="Digite a senha">
                        </div>
                        <p></p>
                        <div class="form-group">
                            <button type="submit" class="btn btn-outline-dark mr-2">Entrar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="scripts_basicos.html" />
    
    <script src="assets/jquery/jquery.mask.min.js"></script>

    <script>
    $(document).ready(function () {
        $(function () {
            $('.cpf').mask('999.999.999-99');
        });
    });
</script>
</html>
