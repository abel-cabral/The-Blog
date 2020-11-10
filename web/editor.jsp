<jsp:include page="/Publicacao" />
<jsp:include page="/ArtigoController" />
<%
    // VARIAVEIS
    String id = (String) session.getAttribute("id");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>        
        <jsp:include page="cabecalho.html" />
        <link href="./assets/editor/summernote-bs4.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./editor.css">
    </head>
    <body>
        <div class="container">
            <jsp:include page="menu_principal.jsp" />
            <section>
                <div class="jumbotron">
                    <h1 class="display-4">Tela de Publicação</h1>            
                    <hr class="my-4">
                    <p>Escreva sua postagem aqui</p>
                </div>
                <div class="row">
                    <div class="col-12">
                        <form method="POST" action="ArtigoController" id="formNoticia">
                            <div>
                                <input type="text" name="titulo" id="titulo" class="form-control" placeholder="Digite o Título" maxlength="20" autocomplete="off" required="true">
                                <label class="error" for="titulo"></label>
                            </div>
                            <div>
                                <select name="id_categoria" class="custom-select" aria-describedby="categoriaHelpBlock" required="required">
                                    <option value="" disabled="" selected="">Categoria da Notícia</option>
                                    <c:forEach var="categoria" items="${categorias}">                                        
                                        <option value="${categoria.id}">${categoria.descricao}</option>                                    
                                    </c:forEach>      
                                    
                                </select>                                
                                <label class="error" for="categoria"></label>
                            </div>                            
                            <br/>
                            <div>
                                <textarea id="summernote" name="conteudo"></textarea>
                                <label class="error" for="conteudo"></label>
                            </div>
                            <div>
                                <input type="hidden" name="id_usuario" value="<%= id %>"/>
                                <input type="hidden" name="tipo" value="novoArtigo"/>
                            </div>
                            <div class="">
                                <button class="btn btn-dark btn-md mt-2 mb-3">Publicar</button>
                            </div>
                        </form>
                    </div>
            </section>
        </div>
    </body>
    <jsp:include page="scripts_basicos.html"/>    
    <script src="./assets/editor/summernote-bs4.min.js"></script>
    <script src="./assets/editor/lang/summernote-pt-BR.min.js"></script>
    <script src="./editor.js"></script>
</html>
