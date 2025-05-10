<%-- 
    Document   : files
    Created on : 6 Jan, 2025, 6:46:22 PM
    Author     : aks
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Files</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
                        body{
                background-color: #D9AFD9;
                background-image: linear-gradient(90deg, #D9AFD9 0%, #97D9E1 100%);
                background-size: cover
            }
.navbar {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  height: 75px;
  padding: 0 20px;
  background: linear-gradient(to right, #758f85  50%, #758f85  50%);
}

.nav-button {
  margin-left: 20px;
  margin-right: 20px;
  padding: 10px 20px;
  font-size: 16px;
  color: white;
  background-color: #4EA685;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.nav-button:hover {
  background-color: #57B894;
}
        </style>
    </head>
    <body>
        
        <%
                     //   validating session 
                        String uname = ""+session.getAttribute("username");
                        System.out.println(uname);
                        if(uname.equals("null")){
                            JOptionPane.showMessageDialog(null, "Session timeout login first");
                            response.sendRedirect("index.html");
                        }    
                    %>
                  <nav class="navbar">
                        <a href="Home.jsp"><button class="nav-button">Home </button></a>
                        <a href="files.jsp"><button class="nav-button">Files </button></a>
                        <a href="logout.jsp" ><button class="nav-button">Logout </button></a>
                 </nav>
        
                  <table class="table table-dark table-striped" style="width: 800px;margin: auto;margin-top: 100px;border-radius: 10px">
                <thead class="thead-dark">
                  <tr>
                    <th scope="col">S.no</th>
                    <th scope="col">Filename</th>
                    <th scope="col">Uploaded_by</th>
                    <th scope="col">Download</th>
     
                  </tr>
                </thead>
                <tbody>
        <%
             Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Duplicatedownload?characterEncoding=utf8","root","admin");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from filedetails");
                int i = 1;
                while (rs.next()) {                        
                        %>

    <tr>
      <th scope="row"><%=i%></th>
      <td><%=rs.getString("filename")%></td>
      <td><%=rs.getString("uploadedby")%></td>
      <td><a href="checkdownload.jsp?filename=<%=rs.getString("filename")%>" ><button onclick="call()" class="btn btn-success">Download</button></a></td>
    </tr>


                        
        <%
                  i++;  }
        %>
          </tbody>
</table>
          
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            import Swal from 'sweetalert2'
            
            function call(){
                
                            Swal.fire({
                            title: 'Error!',
                            text: 'Do you want to continue',
                            icon: 'error',
                            confirmButtonText: 'Cool'
                          })
            }
            

        </script>
    
    </body>
</html>
