<%-- 
    Document   : clear_add_to_cart
    Created on : Jul 16, 2020, 10:56:41 PM
    Author     : Shree
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%
          String name=(String)session.getAttribute("user");       
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/reguser", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM orders WHERE name="+name);
if(i>0)  {
RequestDispatcher rd=request.getRequestDispatcher("submit_order.jsp");  
//servlet2 is the url-pattern of the second servlet  
  
rd.forward(request, response);//method may be include or forward
}
else{
    out.print("Sorry an error occured");
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>    </body>
</html>
