<%-- 
    Document   : logout
    Created on : 20 Sep, 2024, 3:17:30 PM
    Author     : aks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        session.invalidate();
//        String name = ""+session.getAttribute("name");
//        System.out.println(name);
        response.sendRedirect("index.html");
        
        %>
        <h1>Hello World!</h1>
    </body>
</html>
