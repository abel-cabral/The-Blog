<jsp:include page="/ArtigoController" />
<jsp:include page="/ComentarioController" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                <h1 class="display-4"><%= request.getAttribute("titulo")%></h1>
                <div class="row">
                    <div class="col-12">
                        <%= request.getAttribute("conteudo")%>
                    </div>               
                    <div class="m-2 pl-2 pr-2">
                        <p class="card-text"><small class="text-muted"><b>Autor:</b> <%= request.getAttribute("autor")%></small></p>                    
                    </div>                    
                    <div>
                        <div class="m-2 pl-2 pr-2">
                            <h2>Comentários de Nossos Usuários</h2>
                        </div>
                        <c:forEach var="comentario" items="${comentarios}">
                            <div class="card-body">                                                        
                                <div class="card card-inner">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <img src="./assets/images/usuario.jpg" class="img img-rounded img-fluid"/>
                                                <c:if test="${comentario.usuario.papel eq '0'}">
                                                    <p class="text-secondary text-center">Administrador</p>    
                                                </c:if>                                                
                                                <c:if test="${comentario.usuario.papel eq '1'}">
                                                    <p class="text-secondary text-center">Autor</p>    
                                                </c:if>                                                
                                                <c:if test="${comentario.usuario.papel eq '2'}">
                                                    <p class="text-secondary text-center">Comentarista</p>    
                                                </c:if>                                                
                                            </div>                                            
                                            <div class="col-md-10">
                                                <p><strong>${comentario.usuario.nome}</strong></p>
                                                <p>${comentario.comentario}</p>
                                                <c:set var="id_comentador" value="${comentario.usuario.id}" />
                                                <c:set var="id_usuario" value="<%= session.getAttribute("id") %>" />                                                                                                
                                                <c:if test="${id_comentador eq id_usuario}">
                                                    <form method="POST" action="ComentarioController">
                                                        <input type="hidden" name="tipo" value="delete">
                                                        <input type="hidden" name="id_artigo" value="<%= request.getAttribute("id_artigo")%>">  
                                                        <input type="hidden" name="id_comentario" value="${comentario.id}" >
                                                        <button type="submit" class="float-right btn text-white btn-danger"> <i class="fa fa-crosshairs"></i> Apagar</button>
                                                    </form> 
                                                </c:if>                              
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </c:forEach>
                        <form method="POST" action="ComentarioController">
                            <div class="m-2 pl-2 pr-2 form-group">
                            <label for="comment">Nos deixe seu comentário</label>
                            </div>
                            <% if(session.getAttribute("logado") == "true") { %>
                            <div class="m-2 pl-2 pr-2 form-group">
                                <textarea class="form-control" rows="5" name="comentario"></textarea>                                
                                <input type="hidden" name="id_usuario" value="<%= session.getAttribute("id") %>">                                
                                <input type="hidden" name="id_artigo" value="<%= request.getAttribute("id_artigo")%>">                                
                                <input type="hidden" name="tipo" value="novo">
                            </div>
                            <div class="m-2 pl-2 pr-2">
                                <button type="submit" class="btn btn-outline-dark mr-2">Comentar</button>
                            </div>
                            <% } %>
                        </form>
                    </div>
                </div>
            </section>
        </div>
    </body>
    <jsp:include page="scripts_basicos.html" />
    <script src="./artigo.js"></script>
</html>
