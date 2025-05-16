<%-- 
    Document   : adicionar.jsp
    Created on : 16 de mai. de 2025, 09:33:39
    Author     : mingu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header style="display: flex; flex-direction: column; align-items: center; justify-content: space-between">
            <article style="display: flex; flex-direction: column; align-items: center; gap: 30px;">
            <h1>Estacionamento!</h1>
            <nav style="display: flex; gap: 40px;">
                <a href="formulario.jsp">Entrada de Carros</a>
                <a href="#">Saida de Carros</a>
                <a href="mapa.jsp">Mapa em tempo real</a>
                <a href="#">Gerar Relatorio</a>
                <a href="configuracao.jsp">Configurações</a>
            </nav>
                <a href="logout.jsp">Logout</a>
            </article>
        </header>
        <h1>Adicionar Operador</h1>
        <main>
            <form action="adicionarOperador.jsp" method="post">
                <input placeholder="Nome" required name="nome">
                <input placeholder="Login" required name="login">
                <input placeholder="Senha" required name="senha">
                <input value="adicionar" type="submit">
            </form>
        </main>
    </body>
</html>
