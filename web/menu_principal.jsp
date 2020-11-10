<%
    // VARIAVEIS
    Integer papel = 100;
    Boolean status = false;
    String usuario = "";
    try {
        papel = Integer.parseInt((String) session.getAttribute("papel"));
        status = Boolean.parseBoolean((String) session.getAttribute("logado"));
        usuario = (String) session.getAttribute("NomeUsuarioLogado");
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="./index.jsp">Blog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="./index.jsp">Home<span class="sr-only">(current)</span></a>
            </li>

            <!-- SE FOR UM ADMINISTRADOR-->
            <% if (papel == 0) { %>            
            <li class="nav-item">
                <a class="nav-link" href="./administracao.jsp">Manager</a>
            </li>
            <% } %>

            <!-- SE FOR UM ADM OU UM AUTOR -->
            <% if (papel <= 1) { %>            
            <li class="nav-item">
                <a class="nav-link" href="./editor.jsp">Editor</a>
            </li>
            <% } %>            
        </ul>            
        <!-- VERIFICA SE ESTA LOGADO OU NAO -->
        <% if (status == true) { %>            
        <small class="text-light">Bem-vindo, <b><%=usuario%></b></small>
        <form name="logout" action="VerificarLogin" method="get">
            <a class="nav-link" onclick="callservlet()" href="#">Sair</a>
        </form>
        <%
        } else {
        %>
        <a class="nav-link" href="login.jsp">Entrar</a>
        <% }%>
    </div>
</nav>
<script>
    function callservlet() {
        //do your processing.
        document.getElementsByName('logout')[0].submit();
    }
</script>