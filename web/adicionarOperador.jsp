<%@page import="java.sql.*"%>

<%

        String nome = request.getParameter("nome");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
    
    
    try {
    
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sistema", "root", "admin");

        String sql = "SELECT * FROM usuario WHERE login = ?";
        PreparedStatement st = conn.prepareStatement(sql);
        st.setString(1, login);
        ResultSet rs = st.executeQuery();
        
        if(rs.next()){
            out.print("Já existe um usuario com este login!!");
            %> 
            <a href="adicionar.jsp">Voltar</a>
<% 
            
        }else {
        sql = "INSERT INTO usuario(nome, login, senha, nivel_acesso) VALUES (?,?,?,'operador')";
        st = conn.prepareStatement(sql);
        st.setString(1, nome);
        st.setString(2, login);
        st.setString(3, senha);
        st.executeUpdate();
        
        response.sendRedirect("menu.jsp");
    }
        
        
    
    } catch (Exception e) {
        out.print("Erro: " + e.getMessage());
    }

%>