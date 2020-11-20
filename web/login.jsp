<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="cabecalho.html" />
        <link rel="stylesheet" href="./login.css">        
    </head>
    <body class="h-100">       
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">
                            <h1 class="card-title text-center">THE BLOG</h1>
                            <form id="formLogin" method="POST" action="VerificarLogin" class="form-signin">
                                <div class="form-label-group">
                                    <label for="inputEmail">CPF</label>
                                    <input type="text" name="cpf" id="cpf" class="form-control cpf" placeholder="Digite o CPF" maxlength="14" data-mask="000.000.000-00" autocomplete="off" required="true">                                    
                                </div>

                                <div class="form-label-group">
                                    <label for="inputPassword">Senha</label>
                                    <input type="password" class="form-control" name="senha" id="senha" placeholder="Digite a senha" autocomplete="off" required="true">                                    
                                </div>
                                <br>                                
                                <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Entrar</button>
                                <hr class="my-4">                                
                                <button class="btn btn-lg btn-google btn-block text-uppercase" type="button" onclick="location.href='register.jsp';">Criar Conta</button>                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="scripts_basicos.html" />
    <script src="./login.js"></script>
</html>
