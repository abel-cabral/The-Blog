<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <jsp:include page="./cabecalho.html" />
        <link rel="stylesheet" href="./register.css">        
    </head>
    <body class="h-100">
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">
                            <h1 class="card-title text-center">THE BLOG</h1>
                            <form id="formCadastro" method="POST" action="VerificarLogin" class="form-signin">
                                <div class="form-label-group">
                                    <label for="inputEmail">Nome</label>
                                    <input id="nome" name="nome" placeholder="Nome do usuário" type="text" required="required" class="form-control">
                                </div>

                                <div class="form-label-group">
                                    <label for="inputPassword">Email</label>
                                    <input id="email" name="email" placeholder="Email do usuário" type="text" class="form-control" required="required">
                                </div>

                                <div class="form-label-group">
                                    <label for="inputPassword">CPF</label>
                                    <input id="cpf" name="cpf" placeholder="Cpf do usuário" type="text" class="form-control" data-mask="000.000.000-00" required="required">
                                </div>

                                <div class="form-label-group">
                                    <label for="inputPassword">Senha</label>
                                    <input type="password" id="senha" name="senha" placeholder="Senha do usuário" type="text" class="form-control" required="required">                                   
                                </div>

                                <div class="form-label-group">
                                    <label for="inputPassword">Papel no sistema</label>
                                    <select id="papel" name="papel" class="custom-select" aria-describedby="papelHelpBlock" required="required">
                                        <option value="">Selecione</option>
                                        <option value="0">Administrador</option>
                                        <option value="1">Autor</option>
                                        <option value="2">Comentárista</option>
                                    </select>                                      
                                </div>
                                <br>          
                                <input type="hidden" name="tipo" value="novo">
                                <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Cadastrar</button>
                                <hr class="my-4">                                
                                <button class="btn btn-lg btn-google btn-block text-uppercase" type="button" onclick="location.href = 'login.jsp';">Já tem conta?</button>                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="./scripts_basicos.html"/>
        <script src="./register.js"></script>
    </body>
</html>
