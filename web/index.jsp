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
                                <img class="card-img-top" data-src="holder.js/100px180/" alt="100%x180" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%221089%22%20height%3D%22180%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%201089%20180%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1752e217378%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A54pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1752e217378%22%3E%3Crect%20width%3D%221089%22%20height%3D%22180%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%22386.34375%22%20y%3D%22114%22%3E1089x180%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="height: 180px; width: 100%; display: block;">
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
