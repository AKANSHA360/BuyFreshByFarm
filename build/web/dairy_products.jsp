<%-- 
    Document   : dairy_products
    Created on : Jun 14, 2020, 1:39:37 PM
    Author     : Shree
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "reguser";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
PreparedStatement stmt=null;  

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
        <link rel="stylesheet" href="Vegetables-Fruits.css">
        <title>Buy Your Daily Essentials</title>
    </head>
    <body>
        <%   
  
String name=(String)session.getAttribute("user");  
  
%>  

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
    </ul>
    
  </div>
</nav>        
        <header class="header">
            <div class="htop">
                <div id="checkoutdiv" class="container">
            <div class="row">
                
                <div class="col-md-6 text-sm-right">(<span class="items text-muted"></span><small>items</small>) <span class="total"></span></div>
                <div class="col-md-6 text-sm-right">
                <span class="btn btn-success" data-toggle="modal" data-target="#cart">Open Shopping Cart</span>                
                <a href="Checkout.jsp" class="btn btn-primary">Proceed to Checkout</a>
                            </div>
            </div>
            </div>
            </div>  
           
            <div class="hbot">
                <div class="container">

                </div>
            </div>
        </header>
        <div class="content">
            <!--content changes on each page -->
            <div class="container">
                    <div class="row">
                        

                    <div class="col-md-3">
        <div class="card">
            <div class="card-block">
 <%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from dairy_products where Id='100'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>                
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>                
                <h6 class="card-subtitle text-muted">Rs.<%=resultSet.getInt(3)%>/<%=resultSet.getFloat(4)%>litre
                </h6>
                <br>
            <img src="./images/Amul-Milk.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                Get it fresh directly from farms<br>  
                <form action="store_products1.jsp">
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='productitem btn btn-primary' data-name='<%= resultSet.getString(2) %>' data-s=
                   '<%= resultSet.getFloat(4) %>kg'
                   data-price=<%= resultSet.getInt(3) %>
                   data-id=<%= resultSet.getInt(1) %>>
                  
                    <input type="submit" class='productitem btn btn-primary' value="Add To Cart"></a>
                                </form>

                                                   <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 

            </div>
            </div></div></div>

                    <div class="col-md-3">
                    <div class="card">
            <div class="card-block">
<%                
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from dairy_products where Id='101'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>               
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>             
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/<%= resultSet.getFloat(4) %>g</h6>
                <br>
                <img src="./images/amul-masti-dahi.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  

                <form action="store_products1.jsp">
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='productitem btn btn-primary' data-name='<%= resultSet.getString(2) %>' data-s=
                   '<%= resultSet.getFloat(4) %>kg'
                   data-price=<%= resultSet.getInt(3) %>
                   data-id=<%= resultSet.getInt(1) %>>
                  
                    <input type="submit" class='productitem btn btn-primary' value="Add To Cart"></a>
                                </form>

                                                   <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 
            </div>
            </div></div></div>
                    <div class="col-md-3">                    
        <div class="card">
            <div class="card-block">
                <%
                    try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from dairy_products where Id='102'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

                <h3 class="card-title"><%= resultSet.getString(2) %></h3>              
                               <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/<%= resultSet.getFloat(4) %>g</h6>                
                <br>
                <img src="./images/britannia-cheese.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products1.jsp">
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='productitem btn btn-primary' data-name='<%= resultSet.getString(2) %>' data-s=
                   '<%= resultSet.getFloat(4) %>kg'
                   data-price=<%= resultSet.getInt(3) %>
                   data-id=<%= resultSet.getInt(1) %>>
                  
                    <input type="submit" class='productitem btn btn-primary' value="Add To Cart"></a>
                                </form>

                                                   <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 
            </div>
            </div></div></div>
                    <div class="col-md-3">                    
        <div class="card">
            <div class="card-block">
<%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from dairy_products where Id='103'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>                
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>                
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/<%= resultSet.getFloat(4) %>g</h6>
                <br>
            <img src="./images/amul-cheese.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products1.jsp">
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='productitem btn btn-primary' data-name='<%= resultSet.getString(2) %>' data-s=
                   '<%= resultSet.getFloat(4) %>kg'
                   data-price=<%= resultSet.getInt(3) %>
                   data-id=<%= resultSet.getInt(1) %>>
                  
                    <input type="submit" class='productitem btn btn-primary' value="Add To Cart"></a>
                                </form>

                                                   <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 
            </div>
            </div></div></div>
                </div>
                    <div class="row">
                        

                    <div class="col-md-3">
        <div class="card">
            <div class="card-block">
 <%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from dairy_products where Id='104'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>                
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>                
                <h6 class="card-subtitle text-muted">Rs.<%=resultSet.getInt(3)%>/<%=resultSet.getFloat(4)%>gram
                </h6>
                <br>
            <img src="./images/Amul-Butter.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                Get it fresh directly from farms<br>  
                <form action="store_products1.jsp">
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='productitem btn btn-primary' data-name='<%= resultSet.getString(2) %>' data-s=
                   '<%= resultSet.getFloat(4) %>kg'
                   data-price=<%= resultSet.getInt(3) %>
                   data-id=<%= resultSet.getInt(1) %>>
                  
                    <input type="submit" class='productitem btn btn-primary' value="Add To Cart"></a>
                                </form>

                                                   <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 

            </div>
            </div></div></div>

                    <div class="col-md-3">
                    <div class="card">
            <div class="card-block">
<%                
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from dairy_products where Id='105'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>               
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>             
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/<%= resultSet.getFloat(4) %>g</h6>
                <br>
                <img src="./images/gowardhan-dahi.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  

               <form action="store_products1.jsp">
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='productitem btn btn-primary' data-name='<%= resultSet.getString(2) %>' data-s=
                   '<%= resultSet.getFloat(4) %>kg'
                   data-price=<%= resultSet.getInt(3) %>
                   data-id=<%= resultSet.getInt(1) %>>
                  
                    <input type="submit" class='productitem btn btn-primary' value="Add To Cart"></a>
                                </form>

                                                   <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 
            </div>
            </div></div></div>
                    <div class="col-md-3">                    
        <div class="card">
            <div class="card-block">
                <%
                    try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from dairy_products where Id='106'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

                <h3 class="card-title"><%= resultSet.getString(2) %></h3>              
                               <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/<%= resultSet.getFloat(4) %>g</h6>                
                <br>
                <img src="./images/amul-cheese-slice.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products1.jsp">
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='productitem btn btn-primary' data-name='<%= resultSet.getString(2) %>' data-s=
                   '<%= resultSet.getFloat(4) %>kg'
                   data-price=<%= resultSet.getInt(3) %>
                   data-id=<%= resultSet.getInt(1) %>>
                  
                    <input type="submit" class='productitem btn btn-primary' value="Add To Cart"></a>
                                </form>

                                                   <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 
            </div>
            </div></div></div>
                    <div class="col-md-3">                    
        <div class="card">
            <div class="card-block">
<%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from dairy_products where Id='107'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>                
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>                
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/<%= resultSet.getFloat(4) %>g</h6>
                <br>
            <img src="./images/britannia-cheese-slices.png" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
               <form action="store_products1.jsp">
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='productitem btn btn-primary' data-name='<%= resultSet.getString(2) %>' data-s=
                   '<%= resultSet.getFloat(4) %>kg'
                   data-price=<%= resultSet.getInt(3) %>
                   data-id=<%= resultSet.getInt(1) %>>
                  
                    <input type="submit" class='productitem btn btn-primary' value="Add To Cart"></a>
                                </form>

                                                   <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 

            </div>
            </div></div></div>
                </div>
                    <div class="row">
                        

                    <div class="col-md-3">
        <div class="card">
            <div class="card-block">
 <%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from dairy_products where Id='108'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>                
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>                
                <h6 class="card-subtitle text-muted">Rs.<%=resultSet.getInt(3)%>/<%=resultSet.getFloat(4)%>litre
                </h6>
                <br>
            <img src="./images/Mother-Dairy-milk.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                Get it fresh directly from farms<br>  
                <form action="store_products1.jsp">
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='productitem btn btn-primary' data-name='<%= resultSet.getString(2) %>' data-s=
                   '<%= resultSet.getFloat(4) %>kg'
                   data-price=<%= resultSet.getInt(3) %>
                   data-id=<%= resultSet.getInt(1) %>>
                  
                    <input type="submit" class='productitem btn btn-primary' value="Add To Cart"></a>
                                </form>

                                                   <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 
            </div>
            </div></div></div>

                    <div class="col-md-3">
                    <div class="card">
            <div class="card-block">
<%                
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from dairy_products where Id='109'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>               
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>             
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/<%= resultSet.getFloat(4) %>g</h6>
                <br>
                <img src="./images/amul-fresh-cream.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  

                <form action="store_products1.jsp">
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='productitem btn btn-primary' data-name='<%= resultSet.getString(2) %>' data-s=
                   '<%= resultSet.getFloat(4) %>kg'
                   data-price=<%= resultSet.getInt(3) %>
                   data-id=<%= resultSet.getInt(1) %>>
                  
                    <input type="submit" class='productitem btn btn-primary' value="Add To Cart"></a>
                                </form>

                                                   <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 

            </div>
            </div></div></div>
                    <div class="col-md-3">                    
        <div class="card">
            <div class="card-block">
                <%
                    try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from dairy_products where Id='110'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

                <h3 class="card-title"><%= resultSet.getString(2) %></h3>              
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/<%= resultSet.getFloat(4) %>litre</h6>                
                <br><br>
                <img src="./images/amul-buttermilk.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products1.jsp">
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='productitem btn btn-primary' data-name='<%= resultSet.getString(2) %>' data-s=
                   '<%= resultSet.getFloat(4) %>kg'
                   data-price=<%= resultSet.getInt(3) %>
                   data-id=<%= resultSet.getInt(1) %>>
                  
                    <input type="submit" class='productitem btn btn-primary' value="Add To Cart"></a>
                                </form>

                                                   <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 
            </div>
            </div></div></div>
                    <div class="col-md-3">                    
        <div class="card">
            <div class="card-block">
<%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from dairy_products where Id='111'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>                
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>                
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/<%= resultSet.getFloat(4) %>g</h6>
                <br><br>
            <img src="./images/amul-lassi.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products1.jsp">
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='productitem btn btn-primary' data-name='<%= resultSet.getString(2) %>' data-s=
                   '<%= resultSet.getFloat(4) %>kg'
                   data-price=<%= resultSet.getInt(3) %>
                   data-id=<%= resultSet.getInt(1) %>>
                  
                    <input type="submit" class='productitem btn btn-primary' value="Add To Cart"></a>
                                </form>

                                                   <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 

            </div>
            </div></div></div>
                </div>
                    <div class="row">
                    <div class="col-md-3">
        <div class="card">
            <div class="card-block">
 <%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from dairy_products where Id='112'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>                
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>                
                <h6 class="card-subtitle text-muted">Rs.<%=resultSet.getInt(3)%>/<%=resultSet.getFloat(4)%>litre
                </h6>
                <br>
            <img src="./images/amul-malai-paneer.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                Get it fresh directly from farms<br>  
                <form action="store_products1.jsp">
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='productitem btn btn-primary' data-name='<%= resultSet.getString(2) %>' data-s=
                   '<%= resultSet.getFloat(4) %>kg'
                   data-price=<%= resultSet.getInt(3) %>
                   data-id=<%= resultSet.getInt(1) %>>
                  
                    <input type="submit" class='productitem btn btn-primary' value="Add To Cart"></a>
                                </form>

                                                   <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 
            </div>
            </div></div></div>    
                    </div>
                            </div>
        </div>
        <footer class="footer">
            <div class="container"><p class="text-sm-center">&copy; Copyright info blah blah</p></div>
        </footer>

                <!--modals-->
       <!-- <div class="modal fade" id="cart" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header"><h4 class="modal-title">Shopping Cart</h4>
                        <button type="button" class="close" data-dismiss="modal">
                    &times;            
                    </button></div>
                    <div class="modal-body">
                        <table class="table table-hover">
                            <thead class="thead-inverse">
                                <tr>
                                    <th>Remove</th>
                                    <th>Qty</th>
                                    <th>Item Name </th>
                                    <th>Cost</th>
                                    <th class="text-xs-right">Subtotal</th>
                                </tr>
                            </thead>
                            <tbody id="output">
                            
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <div><button type="button" class="btn btn-warning" data-dismiss="modal">Continue Shopping</button><a href="Checkout.jsp" class="btn btn-primary">Proceed to Checkout</a></div>
                    </div>                        
                    </div>
                </div>
            </div>-->
            
        
        
        
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
        <!--<script src="Vegetables-Fruits.js"></script>-->    </body>
</html>
