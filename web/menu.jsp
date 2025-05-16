<%

    String usuarioLogado = (String) session.getAttribute("usuario");

    if (usuarioLogado == null) {
        response.sendRedirect("index.html");
        return;
    }

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="styleMenu.css"/>
    </head>
    <body>
        <header>
            <article>
                <div><a href="menu.jsp"><img src="Marilyllo.png" alt="alt"/></a></div>
                <nav>
                    <a href="formulario.jsp">Entrada</a>
                    <a href="#">Saida</a>
                    <a href="mapa.jsp">Mapa</a>
                    <a href="relatorio.jsp">Relatorio</a>
                    <a href="configuracao.jsp">Configurações</a>
                    <a href="adicionar.jsp">Adicionar Operador</a>
                </nav>
                <a href="logout.jsp">Logout</a>
            </article>
        </header>
    </body>
</html>