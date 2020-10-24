<%-- 
    Document   : editor.jsp
    Created on : 24/10/2020, 18:39:56
    Author     : Abel Cabral Arruda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <jsp:include page="cabecalho.html" />
        <link href="./assets/editor/summernote-bs4.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./editor.css">
    </head>
    <body>
        <div class="container">
            <jsp:include page="menu_principal.html" />            
            <section>
                <div class="jumbotron">
                    <h1 class="display-4">Tela de Publicação</h1>            
                    <hr class="my-4">
                    <p>Escreva sua postagem aqui</p>
                </div>
                <div class="row">
                    <div class="col-12">
                        <form method="post">
                            <textarea id="summernote" name="editordata"></textarea>
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
