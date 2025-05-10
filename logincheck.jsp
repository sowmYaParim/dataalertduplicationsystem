<%-- 
    Document   : logincheck
    Created on : 6 Jan, 2025, 11:29:29 AM
    Author     : aks
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
            String name = request.getParameter("name");
            String password = request.getParameter("password");

        Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Duplicatedownload?characterEncoding=utf8","root","admin");
                Statement st = con.createStatement();
                ResultSet flag = st.executeQuery("select * from userdetail where username ='"+name+"' and password ='"+password+"'");
                if(flag.next()){
                    session.setAttribute("username", name);
                    session.setAttribute("mail", flag.getString("mail"));
                    JOptionPane.showMessageDialog(null, "Login success");
                    response.sendRedirect("Home.jsp");
                }else{
                    JOptionPane.showMessageDialog(null, "Wrogn credentials");
                    response.sendRedirect("index.html");
                }
       %>
    </body>
</html>
