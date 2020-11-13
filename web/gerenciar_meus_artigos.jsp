<jsp:include page="/ArtigoController" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>        
        <jsp:include page="./cabecalho.html" />  
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
                                    <tr>
                                        <th scope="row">${artigo.id}</th>
                                        <td>${artigo.autor.nome}</td>
                                        <td>${artigo.titulo}</td>
                                        <td>
                                            <a href="artigo.jsp?id=${artigo.id}">Ver Artigo</a>
                                        </td>                                                                                                 
                                        <c:if test="${artigo.liberar eq 'N'}">
                                            <td>Escrevendo</td> 
                                            <td>
                                                <form class="d-inline" action="ArtigoController" method="POST">
                                                    <input type="hidden" name="id_artigo" value="${artigo.id}">
                                                    <input type="hidden" name="cadastro_liberado" value="S">
                                                    <input type="hidden" name="tipo" value="liberar">
                                                    <button type="submit" class="btn btn-success" data-toggle="tooltip" data-placement="top" title="Pronto"><i class="fa fa-check"></i></button>
                                                </form>
                                                <a href="editor.jsp?artigo=${artigo.id}"><button type="submit" class="btn btn-info" data-toggle="tooltip" data-placement="top" title="Editar Publicação"><i class="fa fa-pencil"></i></button></a>
                                                <form class="d-inline" action="ArtigoController" method="POST">
                                                    <input type="hidden" name="id_artigo" value="${artigo.id}">                                                    
                                                    <input type="hidden" name="tipo" value="deleteMeu">
                                                    <button type="submit" class="btn btn-danger" data-toggle="tooltip" data-placement="top" title="Deletar"><i class="fa fa-times-circle"></i></button>
                                                </form>
                                            </td>
                                        </c:if>
                                        <c:if test="${artigo.liberar eq 'S'}">
                                            <c:if test="${artigo.liberar eq 'S' and artigo.aprovado eq 'N'}">
                                                <td>Análise</td> 
                                            </c:if>
                                            <c:if test="${artigo.liberar eq 'S' and artigo.aprovado eq 'S'}">
                                                <td>Publicada</td> 
                                            </c:if>                                            
                                            <c:if test="${artigo.aprovado eq 'N'}">
                                                <td>
                                                    <form class="d-inline" action="ArtigoController" method="POST">
                                                        <input type="hidden" name="id_artigo" value="${artigo.id}">
                                                        <input type="hidden" name="cadastro_liberado" value="N">
                                                        <input type="hidden" name="tipo" value="liberar">
                                                        <button type="submit" class="btn btn-warning" data-toggle="tooltip" data-placement="top" title="Interromper Publicação"><i class="fa fa-asterisk"></i></button>
                                                    </form>                                                    
                                                    <form class="d-inline" action="ArtigoController" method="POST">
                                                        <input type="hidden" name="id_artigo" value="${artigo.id}">
                                                        <input type="hidden" name="tipo" value="deleteMeu">
                                                        <button type="submit" class="btn btn-danger" data-toggle="tooltip" data-placement="top" title="Deletar"><i class="fa fa-times-circle"></i></button>
                                                    </form>
                                                </td>
                                            </c:if>
                                            <c:if test="${artigo.aprovado eq 'S'}">
                                                <td>Desabilitado</td>
                                            </c:if>
                                        </c:if>
                                    </tr>                                                                       
                                </c:forEach>                                               
                            </tbody>
                        </table>
                    </div>
            </section>
        </div>
        <jsp:include page="./scripts_basicos.html"/>
    </body>
</html>
