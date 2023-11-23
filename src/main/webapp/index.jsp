<%@ page import = "shop_cart.conn.DbCon" %>
<%@ page import = "shop_cart.model.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    user auth = (user) request.getSession().getAttribute("auth");
    if(auth != null){
    	request.setAttribute("auth", auth);
    }
    %>
<!DOCTYPE html>
<html>
<head>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"rel="stylesheet">
<title>welcome to neco arc coffee shop</title>
<%@include file="includes/head.jsp"%>
<style>
	.main{
            font-weight:600;
            margin-left: 510px;
            padding-left: 76px;
            padding-top: 90px;
            width : 500px;
            display : inline-block;
            margin-top: 70px;
        }
    .order{
            margin-left: 610px;
        }
    .order .btn{
    	    width : 30%;
            height : 45px;
            background: orange;
            border: none;
            outline: none;
            border-radius: 40px;
            box-shadow: 0 0 10px rgba(0,0,0,.1);
            cursor: pointer;
            font-size:16px;
            color:#333;
            font-weight:600;
            margin-bottom: 20 0 15px;
     }
     body{
            background : url('coffee/default.jpg') no-repeat;
            background-size: cover;
            background-position: center -90px;
        }
</style>
</head>
<body>
<%@include file="includes/navbar.jsp" %>
<%@ page import="shop_cart.conn.DbCon" %>
<div class="main">
            <p style="font-size: 65px;
                      margin-bottom: 0px;">Welcome</p>
            <p style="font-size: 25px;
                      margin-top: 5px;">To Neco-Arc coffee shop</p>
</div>
<div class="order">
    <button class="btn" onclick="window.location.href='orders.jsp'">Order Here</button>
</div>

<%@include file="includes/footer.jsp"%>
</body>
</html>


