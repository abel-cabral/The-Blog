<%-- 
    Document   : register
    Created on : 02/10/2020, 21:56:07
    Author     : Abel Cabral Arruda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Register</title>
        <jsp:include page="./cabecalho.html" />
        <link rel="stylesheet" href="./register.css">        
    </head>
    <body>
        <div class="container">
            <jsp:include page="./menu_principal.html" />

            <div class="row mb-3 mt-5">
                <div class="col-6 offset-4 card bg-ligth">
                    <form class="mb-3 mt-3">
                        <div class="form-group row">
                            <div class="col-12">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <i class="fa fa-user-circle-o"></i>
                                        </div>
                                    </div> 
                                    <input id="nome" name="nome" placeholder="Nome do usuário" type="text" required="required" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-12">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <i class="fa fa-envelope"></i>
                                        </div>
                                    </div> 
                                    <input id="email" name="email" placeholder="Email do usuário" type="text" class="form-control" required="required">
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">                           
                            <div class="col-12">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <i class="fa fa-address-card"></i>
                                        </div>
                                    </div> 
                                    <input id="cpf" name="cpf" placeholder="Cpf do usuário" type="text" class="form-control" required="required">
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-12">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <i class="fa fa-lock"></i>
                                        </div>
                                    </div> 
                                    <input id="senha" name="senha" placeholder="Senha do usuário" type="text" class="form-control" required="required">
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-12">
                                <span id="papelHelpBlock" class="form-text text-muted">Papel do usuário no sistema</span>
                                <select id="papel" name="papel" class="custom-select" aria-describedby="papelHelpBlock" required="required">
                                    <option value="0">Administrador</option>
                                    <option value="1">Autor</option>
                                    <option value="2">Comentárista</option>
                                </select>                                 
                            </div>
                        </div> 
                        <div class="form-group row">
                            <div class="offset-1 col-12">
                                <button name="submit" type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="./scripts_basicos.html"/>
        <script src="./register.js"></script>
    </body>
</html>
