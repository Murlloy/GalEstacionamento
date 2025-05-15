<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String usuarioLogado = (String) session.getAttribute("usuario");

    if (usuarioLogado == null) {
        response.sendRedirect("index.html");
        return;
    }

    Connection conn = null;
    PreparedStatement st = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema", "root", "admin");

        String sql = "SELECT movimentacoes.id_usuario, movimentacoes.tipo_movimentacao, movimentacoes.data_hora, veiculos.placa " +
                     "FROM movimentacoes " +
                     "JOIN veiculos ON movimentacoes.id_veiculo = veiculos.id_veiculo";
        st = conn.prepareStatement(sql);
        rs = st.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Relatório de Movimentações</title>
    <link rel="stylesheet" href="styleMenu.css"/>
</head>
<body style="flex-direction: column; color: white;">
    <header>
        <article>
            <div><a href="menu.jsp"><img src="Marilyllo.png" alt="Logo"/></a></div>
            <nav>
                <a href="formulario.jsp">Entrada</a>
                <a href="#">Saída</a>
                <a href="mapa.jsp">Mapa</a>
                <a href="#">Relatório</a>
                <a href="configuracao.jsp">Configurações</a>
            </nav>
            <a href="logout.jsp">Logout</a>
        </article>
    </header>

    <h1>Relatório</h1>

    <table border="1">
        <thead>
            <tr>
                <th>ID Usuário</th>
                <th>Placa do Veículo</th>
                <th>Horário</th>
                <th>Tipo de Movimentação</th>
            </tr>
        </thead>
        <tbody>
            <%
                boolean temMovimentacoes = false;

                while(rs.next()) {
                    temMovimentacoes = true;

                    int id_usuario = rs.getInt("id_usuario");
                    String placa = rs.getString("placa");
                    String horario = rs.getString("data_hora");
                    String tipo_movimentacao = rs.getString("tipo_movimentacao");
            %>
            <tr>
                <td><%=id_usuario%></td>
                <td><%=placa%></td>
                <td><%=horario%></td>
                <td><%=tipo_movimentacao%></td>
            </tr>
            <%
                }

                if (!temMovimentacoes) {
            %>
            <tr>
                <td colspan="4"><h2>Nenhuma movimentação encontrada.</h2></td>
            </tr>
            <%
                }

            } catch (Exception e) {
                out.println("<p>Erro ao gerar relatório: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception e) {}
                if (st != null) try { st.close(); } catch (Exception e) {}
                if (conn != null) try { conn.close(); } catch (Exception e) {}
            }
            %>
        </tbody>
    </table>

</body>
</html>
