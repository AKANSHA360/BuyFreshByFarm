<%-- 
    Document   : Vegetables-Fruits
    Created on : Jun 3, 2020, 8:37:30 PM
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
      <li class="nav-item">
          <a class="nav-link" href="view_submitted_orders.jsp">Your Orders</a>                    
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
String sql ="select * from veg_fruits where Id='1'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>                
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>                
                <h6 class="card-subtitle text-muted">Rs.<%=resultSet.getInt(3)%>/0.25kg
                </h6>
                <br>
            <img src="./images/lady-finger.png" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                Get it fresh directly from farms<br> 
                    
                <form action="store_products.jsp" method="post">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select>   
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                <a href='#' data-name='<%= resultSet.getString(2) %>' data-s=
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
String sql ="select * from veg_fruits where Id='2'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>               
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>             
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6>
                <br>
                <img src="./images/Brinjals.png" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br> 
                                <form action="store_products.jsp">
                                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='primary' data-name='<%= resultSet.getString(2) %>' data-s=
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
String sql ="select * from veg_fruits where Id='3'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

                <h3 class="card-title"><%= resultSet.getString(2) %></h3>              
                               <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6>                
                <br>
                <img src="./images/Fenugreek-leaves.png" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                 <form action="store_products.jsp">
                     <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' data-name='<%= resultSet.getString(2) %>' data-s=
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
String sql ="select * from veg_fruits where Id='4'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>                
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>                
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/1kg</h6>
                <br>
            <img src="./images/tomatoes_1.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
String sql ="select * from veg_fruits where Id='5'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>                 
                <h3 class="card-title"><%= resultSet.getString(2) %></h3> 
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/1kg</h6>
                <br>
            <img src="./images/potato.png" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
String sql ="select * from veg_fruits where Id='6'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>  
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>  
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/1kg</h6>                
                <br>
                <img src="./images/Onion.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
String sql ="select * from veg_fruits where Id='7'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%> 
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>   
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6>                
                <br>
                <img src="./images/Cucumber.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
            </div></div>                        
                    </div>
          <div class="col-md-3">
        <div class="card">
            <div class="card-block">
<%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from veg_fruits where Id='8'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>                 
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6>                
                <br>
                <img src="./images/bitter-gourd.png" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
            </div></div>                        
                    </div>                    
                </div>
                <div class="row">                
                    <div class="col-md-3">                    
             <div class="card">
            <div class="card-block">
<%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from veg_fruits where Id='9'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>                  
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6>                
                <br>
                <img src="./images/Carrot.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
               <form action="store_products.jsp">
                   <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
String sql ="select * from veg_fruits where Id='10'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>                   
                <h3 class="card-title"><%= resultSet.getString(2) %></h3> 
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.2kg</h6>                
                <br>
                <img src="./images/Garlic.png" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
                <h3 class="card-title">CauliFlower</h3>
<%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from veg_fruits where Id='11'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>    
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6>                
                <br>
                <img src="./images/Cauli-Flower.png" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
            </div></div>                        
                    </div>
          <div class="col-md-3">
        <div class="card">
            <div class="card-block">
<%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from veg_fruits where Id='12'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%> 
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>   
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6>                
                <br>
                <img src="./images/Cabbage.png" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
            </div></div>                        
                    </div>                    
                </div>
                <div class="row">                
                    <div class="col-md-3">                    
             <div class="card">
            <div class="card-block">
<%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from veg_fruits where Id='13'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>  
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6>                
                <br>
                <img src="./images/Capsicum.png" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
String sql ="select * from veg_fruits where Id='14'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>  
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>  
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6>                
                <br>
                <img src="./images/Pumpkin.png" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
<form action="store_products.jsp">
    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
String sql ="select * from veg_fruits where Id='15'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>  
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>  
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6>                
                <br>
                <img src="./images/Peas.png" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
            </div></div>                        
                    </div>
          <div class="col-md-3">
        <div class="card">
            <div class="card-block">
<%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from veg_fruits where Id='16'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>   
                <h3 class="card-title"><%= resultSet.getString(2) %></h3> 
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6>                
                <br>
                <img src="./images/Grren-Chillies.png" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
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
            </div></div>                        
                    </div>                    
                </div> 
                <div class="row">                
                    <div class="col-md-3">                    
             <div class="card">
            <div class="card-block">
<%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from veg_fruits where Id='17'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%> 
                <h3 class="card-title"><%= resultSet.getString(2) %></h3> 
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/1piece</h6>
               
            <img src="./images/Corainder_Leaves.png" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
String sql ="select * from veg_fruits where Id='18'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>                    
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6> 
                <br>
            <img src="./images/Ginger.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
String sql ="select * from veg_fruits where Id='19'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>    
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/1piece</h6>
                <br>
            <img src="./images/Spinach.png" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
            </div></div>                        
                    </div>
          <div class="col-md-3">
        <div class="card">
            <div class="card-block">
<%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from veg_fruits where Id='20'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>                   
                <h3 class="card-title"><%= resultSet.getString(2) %></h3> 
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6>                
                <br>
                <img src="./images/beetroots.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
            </div></div>                        
                    </div>                    
                </div>                     
                <div class="row">                
                    <div class="col-md-3">                    
             <div class="card">
            <div class="card-block">
<%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from veg_fruits where Id='21'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>  
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6>
                <br>
            <img src="./images/Bottle_Gourd.png" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
String sql ="select * from veg_fruits where Id='22'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>  
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>  
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6> 
                <br>
            <img src="./images/Green_Beans.png" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
String sql ="select * from veg_fruits where Id='23'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>   
                <h3 class="card-title"><%= resultSet.getString(2) %></h3> 
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6>
             
            <img src="./images/Cluster_Beans.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
            </div></div>                        
                    </div>
          <div class="col-md-3">
        <div class="card">
            <div class="card-block">
<%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from veg_fruits where Id='24'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>    
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6>                
                <br>
                <img src="./images/Broad_Beans.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
            </div></div>                        
                    </div>                    
                </div>                     
                <div class="row">                
                    <div class="col-md-3">                    
             <div class="card">
            <div class="card-block">
<%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from veg_fruits where Id='25'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>  
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6>
                <br>
            <img src="./images/Ivy_Gourd.png" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
String sql ="select * from veg_fruits where Id='26'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>  
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>  
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.25kg</h6> 
                <br>
            <img src="./images/Pointed_Gourd.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
String sql ="select * from veg_fruits where Id='27'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>   
                <h3 class="card-title"><%= resultSet.getString(2) %></h3> 
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.5kg</h6>
                <br>
            <img src="./images/Apple.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
                <form action="store_products.jsp">
                    <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
            </div></div>                        
                    </div>
          <div class="col-md-3">
        <div class="card">
            <div class="card-block">
<%
               try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from veg_fruits where Id='28'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>    
                <h3 class="card-title"><%= resultSet.getString(2) %></h3>
                <h6 class="card-subtitle text-muted">Rs.<%= resultSet.getInt(3) %>/0.5 dozen</h6>                
                <br>
                <img src="./images/Banana.jpg" class="img-fluid">
            </div>
            <div class="card-block">
            <div class="card-text">
                                Get it fresh directly from farms<br>  
               <form action="store_products.jsp">
                   <select name="Qtys">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                    </select> 
                                    <input type="hidden" value="<%= resultSet.getInt(1) %>" name="Id">
                                    <input type="hidden" value="<%= resultSet.getString(2) %>" name="Item_name">
                                    <input type="hidden" value="<%= resultSet.getInt(3) %>" name="Price">
                                    <input type="hidden" value="<%= resultSet.getFloat(4) %>" name="Qty">
                                   
                <a href='#' class='' data-name='<%= resultSet.getString(2) %>' data-s=
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
            </div></div>                        
                    </div>                    
                </div>                     

            </div>
        </div>
        <footer class="footer">
            <div class="container"><p class="text-sm-center">&copy; Copyright info blah blah</p></div>
        </footer>

                <!--modals-->
        <!--<div class="modal fade" id="cart" tabindex="-1">
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
            </div> -->
            
        
        
        
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>  
    </body>
</html>
