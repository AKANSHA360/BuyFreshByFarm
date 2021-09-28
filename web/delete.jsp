<%-- 
    Document   : delete
    Created on : Jul 18, 2020, 7:53:48 PM
    Author     : Shree
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                <%
             String name=(String)session.getAttribute("user");  
             String Id=request.getParameter("Id");
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/reguser","root",""); 
//here sonoo is database name, root is username and password
PreparedStatement ps=con.prepareStatement(  
"DELETE FROM orders WHERE Id=? AND name=?");
ps.setString(1,Id);          
ps.setString(2,name);
int i=ps.executeUpdate();  
if(i>0)  {    
RequestDispatcher rd=request.getRequestDispatcher("addtocart.jsp");  
//servlet2 is the url-pattern of the second servlet  
  
rd.forward(request, response);//method may be include or forward
}
else{
    out.print("Sorry an error occured");
}
    }
catch (Exception e2) {System.out.println(e2);}%> 
    </body>
</html>
