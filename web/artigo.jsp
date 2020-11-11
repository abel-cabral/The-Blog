<jsp:include page="/ArtigoController" />
<%
    String conteudo = (String) request.getAttribute("conteudo");
    String titulo = (String) request.getAttribute("titulo");
%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <jsp:include page="cabecalho.html" />
        <link rel="stylesheet" href="./artigo.css">
    </head>
    <body>
        <div class="container">
            <jsp:include page="menu_principal.jsp" />            
            <section>
                <h1 class="display-4"><%= titulo%></h1>
                <div class="row">
                    <div class="col-12">
                        <%= conteudo%>
                    </div>               
                    <div class="m-2 pl-2 pr-2">
                        <p class="card-text"><small class="text-muted"><b>Autor:</b> <%= request.getAttribute("titulo")%></small></p>                    
                    </div>                    
                    <div>
                        <div class="m-2 pl-2 pr-2">
                            <h2>Comentários de Nossos Usuários</h2>
                        </div>
                        <% for (int i = 0; i < 2; i += 1) { %>
                        <div class="card-body">                                                        
                            <div class="card card-inner">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img src="./assets/images/usuario.jpg" class="img img-rounded img-fluid"/>
                                            <p class="text-secondary text-center">15 Minutes Ago</p>
                                        </div>
                                        <div class="col-md-10">
                                            <p><strong>Maniruzzaman Akash</strong></p>
                                            <p>Lorem Ipsum is simply dummy text of the pr make  but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                            <p>
                                                <!--
                                                <a class="float-right btn btn-outline-primary ml-2">  <i class="fa fa-reply"></i> Reply</a>
                                                -->                                                
                                                <a class="float-right btn text-white btn-danger"> <i class="fa fa-heart"></i> Like</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <% }%>                        
                        <div class="m-2 pl-2 pr-2 form-group">
                            <label for="comment">Nos deixe seu comentário</label>
                            <textarea class="form-control" rows="5" id="comment"></textarea>
                        </div>
                        <div class="m-2 pl-2 pr-2">
                            <button type="submit" class="btn btn-outline-dark mr-2">Comentar</button>
                        </div>     
                    </div>
                </div>
            </section>
        </div>
    </body>
    <jsp:include page="scripts_basicos.html" />
    <script src="./artigo.js"></script>
</html>
