<%-- 
    Document   : administracao.jsp
    Created on : 08/10/2020, 18:35:34
    Author     : Abel Cabral Arruda
--%>
<jsp:include page="/Administracao" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>        
        <jsp:include page="./cabecalho.html" />
        <link rel="stylesheet" href="./administracao.css">       
    </head>
    <body>
        <div class="container">
            <jsp:include page="menu_principal.jsp" />            
            <section>
                <div class="jumbotron">
                    <h1 class="display-4">Tela de Administração</h1>            
                    <hr class="my-4">
                    <p>Lista de Usuários do Sistema</p>
                </div>
                <div class="row">
                    <div class="col-12">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Nome</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Cargo</th>
                                    <th scope="col">Situação</th>
                                    <th scope="col">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="usuario" items="${usuarios}">
                                <tr>
                                    <th scope="row">${usuario.id}</th>
                                    <td>${usuario.nome}</td>
                                    <td>${usuario.email}</td>
                                    <td>${usuario.papel}</td>
                                    <td>${usuario.cadastro_aprovado}</td>                                        
                                    <td>
                                        <c:if test="${usuario.cadastro_aprovado eq 'N'}">
                                            <button type="button" class="btn btn-success" data-toggle="tooltip" data-placement="top" title="Aprovar"><i class="fa fa-check"></i></button>
                                        </c:if>
                                        <c:if test="${usuario.cadastro_aprovado eq 'S'}">
                                            <button type="button" class="btn btn-warning" data-toggle="tooltip" data-placement="top" title="Suspender"><i class="fa fa-exclamation-circle"></i></button>   
                                            <button type="button" class="btn btn-danger" data-toggle="tooltip" data-placement="top" title="Deletar"><i class="fa fa-times-circle"></i></button>
                                        </c:if>
                                    </td>
                                </tr>                 
                                </tr>
                            </c:forEach>                                               
                            </tbody>
                        </table>
                    </div>
            </section>
        </div>
        <jsp:include page="./scripts_basicos.html"/>
        <script src="./administracao.js"></script>
    </body>
</html>
