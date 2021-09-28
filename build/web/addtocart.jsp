<%-- 
    Document   : addtocart
    Created on : Jul 14, 2020, 8:41:29 PM
    Author     : Shree
--%>

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">My Account</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Shop From
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Vegetables-Fruits.jsp">Fruits & Vegetables</a>
          <a class="dropdown-item disabled" href="#">Daily Essentials</a>
          <a class="dropdown-item" href="dairy_products.jsp">Dairy Products</a>
          <a class="dropdown-item disabled" href="#">Grains</a>          
          <a class="dropdown-item" href="#">Daily Subscription</a>          
          <a class="dropdown-item disabled" href="#">Monthly Subscription</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Contact</a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="addtocart.jsp">Your Cart</a>                    
      </li>
       <li class="nav-item">
          <a class="nav-link" href="view_submitted_orders.jsp">Your Orders</a>                    
      </li>
    </ul>
    
  </div>
</nav> 
        <%
             String name=(String)session.getAttribute("user");
            
            try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/reguser","root","");  
              
PreparedStatement ps=con.prepareStatement("select * from orders where name=?");  
ps.setString(1,name);  
PreparedStatement pos=con.prepareStatement("select sum(total) from orders where name=?");
pos.setString(1,name);
out.print("<table width=50% border=1>");

  
ResultSet rs=ps.executeQuery();  
ResultSet ros=pos.executeQuery();  
String Countrun="";
/* Printing column names */  
ResultSetMetaData rsmd=rs.getMetaData();  
int total=rsmd.getColumnCount();  
out.print("<tr>");  
for(int i=1;i<=5;i++)  
{  
out.print("<th>"+rsmd.getColumnName(i)+"</th>");  
}  
  
out.print("</tr>");  
              
/* Printing result */  
  
while(rs.next())  
{
    
out.print("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getInt(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getInt(4)+"</td><td>"+rs.getInt(5)+"</td><td>"+"<a href='delete.jsp?id="+rs.getString("Id")+"'><span class='btn btn-danger remove-item'>x</span>"+"</td></a></tr>");                                   
 %>       

<%
}


        out.print("</table>");
while(ros.next()){
Countrun = ros.getString(1);
out.println("Subtotal :" +Countrun);
}
    }
    catch (Exception e2) {e2.printStackTrace();}%>
    <form action="submitted_orders.jsp" style="text-align: center;">
    <input type="submit" value="Place Order">
</form>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>  
    </body></html>
