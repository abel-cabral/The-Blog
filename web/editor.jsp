<jsp:include page="./guards/autor.jsp" />
<jsp:include page="/PublicacaoController" />
<jsp:include page="/ArtigoController" />

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
                    <h1 class="display-4">Editor de Artigos</h1>            
                    <hr class="my-4">
                </div>
                <div class="row">
                    <div class="col-12">                        
                        <form method="POST" action="ArtigoController" id="formNoticia">
                            <div>
                                <input type="text" name="titulo" id="titulo" class="form-control" placeholder="Digite o Título" value="${artigo.titulo}" maxlength="60" autocomplete="off" required="true">
                                <label class="error" for="titulo"></label>
                            </div>
                            <div>
                                <select name="id_categoria" class="custom-select" aria-describedby="categoriaHelpBlock" required="required">                                    
                                    <c:if test="${artigo.id_categoria == null}">
                                        <option value="" disabled="" selected="true">Selecione uma Categoria</option>
                                    </c:if>
                                    <c:forEach var="categoria" items="${categorias}">                                        
                                        <c:if test="${artigo.id_categoria eq categoria.id}">                                                                                    
                                            <option value="${categoria.id}" selected="true">${categoria.descricao}</option>                                    
                                        </c:if>
                                        <c:if test="${artigo.id_categoria != categoria.id}">                                                                                    
                                            <option value="${categoria.id}">${categoria.descricao}</option>                                    
                                        </c:if>
                                    </c:forEach>      

                                </select>                                
                                <label class="error" for="categoria"></label>
                            </div>                            
                            <br/>
                            <div>
                                <textarea id="summernote" name="conteudo">${artigo.conteudo}</textarea>
                                <label class="error" for="conteudo"></label>
                            </div>
                            <div>
                                <input type="hidden" name="id_usuario" value="<%= session.getAttribute("id")%>"/>                                                                
                            </div>
                            <div>
                                <span class="float-right">
                                    <c:if test="${artigo.id == null}">
                                        <input type="hidden" name="tipo" value="novo"/>                                        
                                    </c:if>                                                                                                   
                                    <c:if test="${artigo.id != null}">
                                        <input type="hidden" name="tipo" value="update"/>
                                        <input type="hidden" id="liberar" name="id_artigo" value="${artigo.id}"/>                                                                                                          
                                    </c:if>                                    
                                    <button class="btn btn-outline-success btn-md mt-2 mb-3" id="buttaoSalvar">Salvar Artigo</button>
                                </span>
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
