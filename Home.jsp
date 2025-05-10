<%-- 
    Document   : Home
    Created on : 6 Jan, 2025, 12:23:35 PM
    Author     : aks
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
h1 {
    width: 700px;
    margin: auto;
    text-align: center;
    margin-top: 50px;
  font-size: 72px;
  background: -webkit-linear-gradient(#2b5876, #4e4376  );
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

         .btn-grad {background-image: linear-gradient(to right, #2b5876 0%, #4e4376  51%, #2b5876  100%)}
         .btn-grad {
            margin: 10px;
            padding: 15px 45px;
            text-align: center;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;            
            box-shadow: 0 0 20px #eee;
            border-radius: 10px;
            display: block;
          }

          .btn-grad:hover {
            background-position: right center; /* change the direction of the change here */
            color: #fff;
            text-decoration: none;
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
            <a><button class="nav-button">Home </button></a>
            <a href="files.jsp"><button class="nav-button">Files </button></a>
            <a href="logout.jsp" ><button id="add" class="nav-button">Logout </button></a>
          </nav>
                    <h1  >Welcome <%=uname%></h1>
        <form action="fileupload" method="POST" ENCTYPE="multipart/form-data" >
            <div style="box-shadow: 0px 0px 50px black; border-radius: 20px; position: absolute; top: 45%;  transform: translateX(140%); display: flex; flex-direction: column; width: 400px;margin: auto; border: 2px black solid;padding: 20px">
             
                <input  type="file" name="file">
                <button type="submit"  style="margin-top: 30px" class="btn-grad" >Upload</button>                

            </div>

        </form>
           <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
              <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
          <script>
              $("#add").click(
        function click(){
                        Swal.fire({
                      title: "LOGGED OUT!",
                      text: "Logged out successfully!",
                      icon: "success"
                    });

                    }
            );
          </script>
    </body>
</html>
