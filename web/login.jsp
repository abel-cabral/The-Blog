<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="cabecalho.html" />
        <link rel="stylesheet" href="./login.css">        
    </head>
    <body class="h-100">        
        <div class="vertical-center">
            <div class="container">                
                <div class="row mb-3 mt-5">
                    <div class="col-4 offset-4 card bg-ligth">
                        <h1>THE BLOG</h1>
                        <form id="formLogin" method="POST" action="VerificarLogin" class="mb-3 mt-3">
                            <div class="form-group row">
                                <div class="col-12">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <i class="fa fa-address-card"></i>
                                            </div>
                                        </div>                                     
                                        <input type="text" name="cpf" id="cpf" class="form-control cpf" placeholder="Digite o CPF" maxlength="14" data-mask="000.000.000-00" autocomplete="off" required="true">
                                    </div>
                                    
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <div class="col-12">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <i class="fa fa-envelope"></i>
                                            </div>
                                        </div>                                     
                                        <input type="password" class="form-control" name="senha" id="senha" placeholder="Digite a senha" autocomplete="off" required="true">
                                    </div>
                                    
                                </div>
                            </div>                                           
                            <a href="./register.jsp">Criar Conta</a>
                            <div class="form-group mb-2">
                                <button type="submit" class="btn btn-outline-dark mr-2">Entrar</button>
                            </div>                        
                        </form>                        
                    </div>
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="scripts_basicos.html" />
    <script src="./login.js"></script>
</html>
