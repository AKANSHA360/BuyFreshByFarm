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
int Id = Integer.parseInt(request.getParameter("Id"));
String Item_name=request.getParameter("Item_name");
int Price = Integer.parseInt(request.getParameter("Price"));         
int Qty = Integer.parseInt(request.getParameter("Qtys"));
int total;
total=Qty*Price;
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/reguser","root",""); 
//here sonoo is database name, root is username and password
PreparedStatement ps=con.prepareStatement(  
"insert into orders values(?,?,?,?,?,?)");
ps.setInt(1,Id);
ps.setInt(2,Qty);
ps.setString(3,Item_name);
ps.setInt(4,Price);
ps.setInt(5,total);
ps.setString(6,name);
          
int i=ps.executeUpdate();  
if(i>0)  {    
RequestDispatcher rd=request.getRequestDispatcher("Vegetables-Fruits.jsp");  
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
