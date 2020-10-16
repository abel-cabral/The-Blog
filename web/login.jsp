<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <jsp:include page="cabecalho.html" />
    </head>
    <body>
        <div class="container">
            <jsp:include page="menu_principal.html" />
            <link rel="stylesheet" href="./login.css">        
            <div class="row mb-3 mt-5">
                <div class="col-4 offset-4 card bg-ligth">
                    <form id="formLogin" action="" method="POST">
                        <div class="form-group mt-2">           
                            <label class="control-label requerido" for="cpf">CPF*</label>
                            <input type="text" name="cpf" id="cpf" class="form-control cpf" placeholder="Digite o cpf" maxlength="14" data-mask="000.000.000-00" autocomplete="off" required="true">
                        </div>
                        <div class="form-group">
                            <label class="control-label requerido" for="senha">Senha*</label>
                            <input type="password" class="form-control" name="senha" id="senha" placeholder="Digite a senha" autocomplete="off" required="true">
                        </div>
                        <a href="./register.jsp">Criar Conta</a>
                        <div class="form-group mb-2">
                            <button type="submit" class="btn btn-outline-dark mr-2">Entrar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="scripts_basicos.html" />
    <script src="./login.js"></script>
</html>
