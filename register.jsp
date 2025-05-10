<%-- 
    Document   : register
    Created on : 6 Jan, 2025, 11:21:22 AM
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
       String mail = request.getParameter("mail");
       String password = request.getParameter("password");
       String cpassword = request.getParameter("cpassword");
       
       if(password.equals(cpassword)){
           
        
       
        Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Duplicatedownload?characterEncoding=utf8","root","admin");
                Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost/Duplicatedownload?characterEncoding=utf8","root","admin");
                Statement st = con.createStatement();
                Statement st2 = con2.createStatement();
               ResultSet rs = st.executeQuery("select * from userdetail where username ='"+name+"';");
                if(rs.next()){
                    JOptionPane.showMessageDialog(null, "Username already exists");
                }else{
                    int i = st2.executeUpdate("insert into userdetail(`username`,`mail`,`password`) values('"+name+"','"+mail+"','"+password+"')");
                    if(i>0){
                        JOptionPane.showMessageDialog(null, "Registered successfully");
                        response.sendRedirect("index.html");
                    }
                    
                }
            }else{
           
            JOptionPane.showMessageDialog(null, "Password and confirm password not matched");
            response.sendRedirect("index.html");
           
       }     
     
       %>
    </body>
</html>
