<%-- 
    Document   : checkdownload
    Created on : 7 Jan, 2025, 12:23:58 PM
    Author     : aks
--%>

<%@page import="java.util.Properties"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.*"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
                        body{
                background-color: #D9AFD9;
                background-image: linear-gradient(90deg, #D9AFD9 0%, #97D9E1 100%);
                background-size: cover
            }
            </style>
    </head>
    <body>
        <%
        String filename = request.getParameter("filename");
        String username = ""+session.getAttribute("username");
        int flag =0;
             Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Duplicatedownload?characterEncoding=utf8","root","admin");
                Statement st = con.createStatement();
             ResultSet rs =  st.executeQuery("select * from filedetails where filename ='"+filename+"'");
             while(rs.next()) {                     
                     System.out.println(rs.getString("filehash"));
                     String reqhash = rs.getString("filehash");
                     Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost/Duplicatedownload?characterEncoding=utf8","root","admin");
                     Statement st2 = con2.createStatement();
                        ResultSet rs2 = st2.executeQuery("select * from downloaddetails where username = '"+username+"' and filename ='"+filename+"' and filehash = '"+reqhash+"';");
                        
                        if(rs2.next()){
 
                            flag = 0;
                            String mail = ""+ session.getAttribute("mail");
                            
                               try{       
               
                      String txt= "The filename : "+rs2.getString("filename")+" is already downloaded on : "+rs2.getString("date").replace("T", "  time : ");
                       String email = "javafabhost2021@gmail.com",  
                                        smtppassword = "txxbueavpxbixljq",  
                                        host = "smtp.gmail.com",  
                                        port = "465",  
                                        to = mail.trim(),  
                                        subject = "Download details",  
                                        text =txt.trim();  

                                        Properties props = new Properties();  
                                        props.put("mail.smtp.user", email);  
                                        props.put("mail.smtp.host", host);  
                                        props.put("mail.smtp.port", port);  
                                        props.put("mail.smtp.starttls.enable","true");  
                                        props.put("mail.smtp.auth", "true");  
                                        props.put("mail.smtp.socketFactory.port", port);  
                                        props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
                                        props.put("mail.smtp.socketFactory.fallback", "false");  

                                        SecurityManager security = System.getSecurityManager();  

                                        try  
                                        {  
                                        class SMTPAuthenticator extends javax.mail.Authenticator  
                                        {
                                            
                                        public PasswordAuthentication getPasswordAuthentication()  
                                        { 
                                            String email = "javafabhost2021@gmail.com",  
                                            password = "txxbueavpxbixljq";        
                                            return new PasswordAuthentication(email, password);  
                                        }  
                                        
                                        }
                                        SMTPAuthenticator auth = new SMTPAuthenticator();  
                                            Session sessions = Session.getInstance(props, auth);  
                                        sessions.setDebug(true);  

                                            MimeMessage msg = new MimeMessage(sessions);  
                                        msg.setText(text);  
                                        msg.setSubject(subject);  
                                        msg.setFrom(new InternetAddress(email));  
                                        msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));  

                                            Transport.send(msg);
                                        }catch(Exception e){
                                            System.out.println(e);
                                        }
                               }catch(Exception e){
                                   System.out.println(e);
                               }
                            
//                            JOptionPane.showMessageDialog(null, "already downloaded");
//                            JOptionPane.showMessageDialog(null, "You will get downloaded details on mail ");
//                            response.sendRedirect("files.jsp");
                        }else{
                            flag =2;
                            Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost/Duplicatedownload?characterEncoding=utf8","root","admin");
                            Statement st3 = con3.createStatement();
                            st3.executeUpdate("insert into downloaddetails(`filename`,`filehash`,`username`,`date`) values('"+filename+"','"+reqhash+"','"+username+"','"+ LocalDateTime.now() +"')");
//                            JOptionPane.showMessageDialog(null, "Downloaded sucessfully");
                           
                        }
                 }
//              response.sendRedirect("files.jsp");
        %>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
//              import Swal from 'sweetalert2'
            var flag = <%=flag%>;
            console.log(flag);
            if(flag<1){ 
                call();
            }else{
                call2();
            }
            
            function change(){
                 window.location.replace("http://localhost:8084/Deduplicate_download/files.jsp");
            }
                          function call(){
                    
           
                            Swal.fire({
                                title: 'File already downloaded!',
                                text: 'You will get downloaded details on mail',
                                icon: 'error',
//                                confirmButtonText: 'Cool'
                              })
                              setTimeout( change,2500);
                             
                                   }
                function call2(){
                    
           
                            Swal.fire({
                                title: 'Successfully!!',
                                text: 'File downloaded successfully',
                                icon: 'success',
//                                confirmButtonText: 'Cool'
                              })
                              setTimeout( change,2500);
                             
                                   }
                                   

        </script>
    </body>
</html>
