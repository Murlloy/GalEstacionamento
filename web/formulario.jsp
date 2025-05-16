<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@page import="java.sql.ResultSet" %>
<%@ page import="java.util.regex.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styleForm.css"/>
    </head>
    <body>
        
  
        
        <%
            try {
                //Fazer a conexão com o banco de dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/sistema";
                String user = "root";
                String password = "admin";
                conecta = DriverManager.getConnection(url, user, password);
                //Listar os dados da tabela produto do banco de dados
                String sql = ("SELECT numero FROM vagas WHERE status_vagas = 'disponivel'  ");
                st = conecta.prepareStatement(sql);
                ResultSet rs = st.executeQuery();
        %>
        
         <header>
            <article>
                <div><a href="menu.jsp"><img src="Marilyllo.png" alt="alt"/></a></div>
                <nav>
                    <a href="formulario.jsp">Entrada</a>
                    <a href="#">Saida</a>
                    <a href="mapa.jsp">Mapa</a>
                    <a href="relatorio.jsp">Relatorio</a>
                    <a href="configuracao.jsp">Configurações</a>
                </nav>
                <a href="logout.jsp">Logout</a>
            </article>
        </header>

        <form action="verificacaoPlaca.jsp" method="post">
            <input type="text" name="placa" placeholder="Placa">
            <input type="datetime-local" name="data_hora_entrada" required>
            <select name="numero" id="id" required>
                <option value="first">Vagas</option>
                <%             while (rs.next()) {
                %>
                <option value="<%=rs.getString("numero")%>">  <%=rs.getString("numero")%></option>
                <%
                    }
                %>
            </select>

            <button type="submit">Entrar</button>
        </form>
            
    <%
        } catch (Exception x) {
            out.print("Mensagem de erro: " + x.getMessage());
        }
    %>
   
 
</body>
</html>