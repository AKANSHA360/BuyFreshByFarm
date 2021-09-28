<%-- 
    Document   : first
    Created on : Jun 3, 2020, 8:01:15 PM
    Author     : Shree
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="first.css">        
        <title>Order Your Essentials Online</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%   
  
String name=request.getParameter("uname");  
  
session.setAttribute("user",name);  
  
  
%>  
        <!--<div class="container">-->

  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="./images/logo1.png" alt="Los Angeles" >
      </div>

      <div class="item">
        <img src="./images/logo1.png" alt="Chicago" >
      </div>
    
      <div class="item">
        <img src="./images/logo3.jpg" alt="New york" >
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
<br>
<br>
<!--</div>-->
<table><tr>
    <div></div>
    <td><div class="card">
    <a href="Vegetables-Fruits.jsp"> 
  <img src="./images/vegetables.jpg" alt="Avatar">
  <div class="container">
    <h4><b>Vegetables & Fruits</b></h4>
  </div>
    </a>
    </div>
    </td>
    <td> 
    </td>

    <td>     <div class="card">
            <a href="dairy_products.jsp">
  <img src="./images/dairy-products.jpg" alt="Avatar">
  <div class="container">
    <h4><b>Dairy-Products</b></h4>
  </div>
            </a>
</div>
    </td>
        <td>     <div class="card">
                <h2 align="center">Coming Soon</h2>
  <img src="./images/grain.jpg" alt="Avatar">
  <div class="container">
    <h4><b>Grains</b></h4>
  </div>
</div>
    </td>
</tr>

</table>
<br>
<br>
<table>
<tr>
     <td>     <div class="card">
             <h2 align="center">Coming Soon</h2>
  <img src="./images/daily-groceries.png" alt="Avatar">
  <div class="container">
    <h4><b>Daily-Groceries</b></h4>
  </div>
</div>
    </td>
</tr>
</table>
    </body>
</html>
