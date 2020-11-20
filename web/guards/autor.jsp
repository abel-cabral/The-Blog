<%
    try {
        Integer papel = Integer.parseInt((String) session.getAttribute("papel"));
        System.out.println(papel > 0);
        if (papel > 1) { %>
            <script type="text/javascript">
                window.location.href = 'index.jsp';
            </script>
        <% }
    } catch (Exception e) { %>
        <script type="text/javascript">
            window.location.href = 'index.jsp';
        </script>
<% }%>