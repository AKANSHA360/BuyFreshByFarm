<%-- 
    Document   : store_products
    Created on : Jul 12, 2020, 9:34:33 PM
    Author     : Shree
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/reguser","root",""); 
//here sonoo is database name, root is username and password
PreparedStatement ps=con.prepareStatement("INSERT INTO submitted_order(Id, Qty, Item_name, Price, Total, name) "
        + " SELECT Id, Qty, Item_name, Price, Total, name FROM orders WHERE name =" + name);
      // out.print(ps.toString());   
int i=ps.executeUpdate();  
if(i>0)  {
RequestDispatcher rd=request.getRequestDispatcher("submit_order.jsp");  
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
