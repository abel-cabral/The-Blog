<jsp:include page="/ArtigoController" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <jsp:include page="cabecalho.html" />
        <link rel="stylesheet" href="./index.css">
    </head>
    <body>
        <div class="container">
            <jsp:include page="menu_principal.jsp" />            
            <section>
                <div class="jumbotron">
                    <h1 class="display-4">Tela de Postagens</h1>            
                    <hr class="my-4">
                    <p>Aqui pode se ver todas as publicações dos autores</p>
                </div>
                <div class="row">
                    <div class="col-12">
                        <c:forEach var="artigo" items="${artigos}">
                            <div class="card mb-3">                                
                                <c:if test="${artigo.id_categoria eq 1}">
                                    <img class="card-img-top" alt="100%x180" src="./assets/images/politica.jpg" data-holder-rendered="true" style="height: 180px; width: 100%; display: block;">                                    
                                </c:if>
                                <c:if test="${artigo.id_categoria eq 2}">
                                    <img class="card-img-top" alt="100%x180" src="./assets/images/atualidade.jpg" data-holder-rendered="true" style="height: 180px; width: 100%; display: block;">
                                </c:if>
                                <c:if test="${artigo.id_categoria eq 3}">
                                    <img class="card-img-top" alt="100%x180" src="./assets/images/arte.jpg" data-holder-rendered="true" style="height: 180px; width: 100%; display: block;">
                                </c:if>                                
                                <div class="card-body">
                                    <h5 class="card-title">${artigo.titulo}</h5>
                                    <div class="card-text show-summary">${artigo.conteudo}</div>
                                    <div class="float-right">                                        
                                        <a href="./artigo.jsp" class="btn btn-primary">Continue lendo</a>
                                    </div>                    
                                    <p class="card-text"><small class="text-muted"><b>Author:</b> Author Name</small></p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
            </section>
        </div>
    </body>
    <jsp:include page="scripts_basicos.html" />    
    <script src="./index.js"></script>
</html>
