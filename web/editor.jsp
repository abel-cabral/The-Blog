<%-- 
    Document   : editor.jsp
    Created on : 24/10/2020, 18:39:56
    Author     : Abel Cabral Arruda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="cabecalho.html" />
        <link href="./assets/editor/summernote-bs4.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./editor.css">
    </head>
    <body>
        <div class="container">
            <jsp:include page="menu_principal.html" />            
            <section>
                <h1>THE BLOG EDITOR</h1>
                <form method="post">
                    <textarea id="summernote" name="editordata"></textarea>
                </form>
            </section>
        </div>
    </body>
    <jsp:include page="scripts_basicos.html"/>    
    <script src="./assets/editor/summernote-bs4.min.js"></script>
    <script src="./assets/editor/lang/summernote-pt-BR.min.js"></script>
    <script src="./editor.js"></script>
</html>
