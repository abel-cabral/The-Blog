
<jsp:include page="/Administracao" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>        
        <jsp:include page="./cabecalho.html" />
        <link rel="stylesheet" href="./gerenciar_usuarios.css">       
    </head>
    <body>
        <div class="container">
            <jsp:include page="menu_principal.jsp" />            
            <section>
                <div class="jumbotron">
                    <h1 class="display-4">Controle de Usuários</h1>            
                    <hr class="my-4">
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
                                    <th scope="col">Controle</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="usuario" items="${usuarios}">
                                    <tr>
                                        <th scope="row">${usuario.id}</th>
                                        <td>${usuario.nome}</td>
                                        <td>${usuario.email}</td>
                                        <c:if test="${usuario.papel eq 0}">
                                            <td>Administrador</td>
                                        </c:if>
                                        <c:if test="${usuario.papel eq 1}">
                                            <td>Editor</td>
                                        </c:if>
                                        <c:if test="${usuario.papel eq 2}">
                                            <td>Comentarista</td>
                                        </c:if>                                                                       
                                        <c:if test="${usuario.cadastro_aprovado eq 'N'}">
                                            <td>Pedente</td> 
                                            <td>
                                                <form name="updateUsuario1" action="Administracao" method="POST">
                                                    <input type="hidden" name="id" value="${usuario.id}">
                                                    <input type="hidden" name="cadastro_aprovado" value="S">
                                                    <input type="hidden" name="tipo" value="update">
                                                    <button type="submit" class="btn btn-success" data-toggle="tooltip" data-placement="top" title="Aprovar"><i class="fa fa-check"></i></button>
                                                </form>
                                            </td>
                                        </c:if>
                                        <c:if test="${usuario.cadastro_aprovado eq 'S'}">
                                            <td>Ativo</td> 
                                            <td>
                                                <form name="updateUsuario2" action="Administracao" method="POST">
                                                    <input type="hidden" name="id" value="${usuario.id}">
                                                    <input type="hidden" name="cadastro_aprovado" value="N">
                                                    <input type="hidden" name="tipo" value="update">
                                                    <button type="submit" class="btn btn-warning" data-toggle="tooltip" data-placement="top" title="Suspender"><i class="fa fa-exclamation-circle"></i></button>   
                                                </form>
                                                <form name="deleteUsuario" action="Administracao" method="POST">
                                                    <input type="hidden" name="id" value="${usuario.id}">
                                                    <input type="hidden" name="tipo" value="delete">
                                                    <button type="submit" class="btn btn-danger" data-toggle="tooltip" data-placement="top" title="Deletar"><i class="fa fa-times-circle"></i></button>
                                                </form>
                                            </td>
                                        </c:if>

                                    </tr>                 
                                    </tr>
                                </c:forEach>                                               
                            </tbody>
                        </table>
                    </div>
            </section>
        </div>
        <jsp:include page="./scripts_basicos.html"/>
        <script src="./gerenciar_usuarios.js"></script>
    </body>
</html>
