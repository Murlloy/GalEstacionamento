<%@page import="java.sql.*" %> 

<%
    
        String usuarioLogado = (String) session.getAttribute("usuario");
        
        if(usuarioLogado == null){
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
    </head>
    <body>
        <header style="display: flex; flex-direction: column; align-items: center; justify-content: space-between">
            <article style="display: flex; flex-direction: column; align-items: center; gap: 30px;">
            <a href="menu.jsp"><h1>Estacionamento!</h1></a>
            <nav style="display: flex; gap: 40px;">
                <a href="formulario.jsp">Entrada de Carros</a>
                <a href="saidaform.jsp">Saida de Carros</a>
                <a href="mapa.jsp">Mapa em tempo real</a>
                <a href="#">Gerar Relatorio</a>
                <a href="configuracao.jsp">Configurações</a>
            </nav>
                <a href="logout.jsp">Logout</a>
            </article>
        </header>
        
        <main style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 50vh;">
            <form action="action" style="align-items: center; display: flex; flex-direction: column">
                <h1>Saida de Veiculos</h1>
                <input type="text" name="placa" placeholder="Digite a placa" required>
                <input type="datetime-local" name="data_hora_saida" placeholder="horario de saida" min="" required>
                
            </form>

        </main>
    </body>
</html>
