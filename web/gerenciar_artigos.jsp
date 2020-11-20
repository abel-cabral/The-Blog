<jsp:include page="./guards/administrador.jsp" />
<jsp:include page="/ArtigoController" />
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
                    <h1 class="display-4">Controle de Artigos</h1>            
                    <hr class="my-4">
                </div>
                <div class="row">
                    <div class="col-12">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Autor</th>
                                    <th scope="col">Títulos</th>
                                    <th scope="col">Postagem</th>
                                    <th scope="col">Situação</th>
                                    <th scope="col">Controle</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="artigo" items="${artigos}">                                    
                                    <c:if test="${artigo.liberar eq 'S'}">
                                        <tr>
                                            <th scope="row">${artigo.id}</th>
                                            <td>${artigo.autor.nome}</td>
                                            <td>${artigo.titulo}</td>
                                            <td>
                                                <a href="artigo.jsp?id=${artigo.id}">Ver Artigo</a>
                                            </td>                                                                                                 
                                            <c:if test="${artigo.aprovado eq 'N'}">
                                                <td>Pedente</td> 
                                                <td>
                                                    <form action="ArtigoController" method="POST">
                                                        <input type="hidden" name="id_artigo" value="${artigo.id}">
                                                        <input type="hidden" name="cadastro_aprovado" value="S">
                                                        <input type="hidden" name="tipo" value="aprovado">
                                                        <button type="submit" class="btn btn-success" data-toggle="tooltip" data-placement="top" title="Aprovar"><i class="fa fa-check"></i></button>
                                                    </form>
                                                    <form action="ArtigoController" method="POST">
                                                        <input type="hidden" name="id_artigo" value="${artigo.id}">
                                                        <input type="hidden" name="tipo" value="delete">
                                                        <button type="submit" class="btn btn-danger" data-toggle="tooltip" data-placement="top" title="Deletar"><i class="fa fa-times-circle"></i></button>
                                                    </form>
                                                </td>
                                            </c:if>
                                            <c:if test="${artigo.aprovado eq 'S'}">
                                                <td>Publicado</td> 
                                                <td>
                                                    <form action="ArtigoController" method="POST">
                                                        <input type="hidden" name="id_artigo" value="${artigo.id}">
                                                        <input type="hidden" name="cadastro_aprovado" value="N">
                                                        <input type="hidden" name="tipo" value="aprovado">
                                                        <button type="submit" class="btn btn-warning" data-toggle="tooltip" data-placement="top" title="Suspender"><i class="fa fa-exclamation-circle"></i></button>   
                                                    </form>
                                                    <form action="ArtigoController" method="POST">
                                                        <input type="hidden" name="id_artigo" value="${artigo.id}">
                                                        <input type="hidden" name="tipo" value="delete">
                                                        <button type="submit" class="btn btn-danger" data-toggle="tooltip" data-placement="top" title="Deletar"><i class="fa fa-times-circle"></i></button>
                                                    </form>
                                                </td>
                                            </c:if>
                                        </tr>
                                    </c:if>                                    
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
