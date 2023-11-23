<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "shop_cart.model.*" %>
<%
	user auth = (user) request.getSession().getAttribute("auth");
	if(auth != null){
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<%--<%@include file="includes/head.jsp"%> --%>
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: url('coffee/log_coffee.jpg') no-repeat;
            background-size: cover;
            background-position: center;
        }

        .wrapper {
            width: 420px;
            background: transparent;
            border: 2px solid rgba(255, 255, 255, .2);
            backdrop-filter: blur(20px);
            box-shadow: 0 0 10px rgba(0, 0, 0, .2);
            color: #fff;
            border-radius: 10px;
            padding: 30px 40px;
        }

        .wrapper h1 {
            font-size: 36px;
            text-align: center;
        }

        .wrapper .input-box {
            position: relative;
            width: 100%;
            height: 50px;
            margin: 30px 0;
        }

        .wrapper .btn {
            width: 100%;
            height: 45px;
            background: #fff;
            border: none;
            outline: none;
            border-radius: 40px;
            box-shadow: 0 0 10px rgba(0, 0, 0, .1);
            cursor: pointer;
            font-size: 16px;
            color: #333;
            font-weight: 600;
            margin-bottom: 20 0 15px;
        }

        .wrapper .reg-link {
            font-size: 14.5px;
            text-align: center;
            margin-top: 20px;
            margin-bottom: 5px;
        }

        .reg-link p a {
            color: #fff;
            text-decoration: none;
            font-weight: 600;
        }

        .input-box input {
            width: 100%;
            height: 100%;
            background: transparent;
            border: none;
            outline: none;
            border: 2px solid rgba(255, 255, 255, .2);
            border-radius: 40px;
            font-size: 16px;
            color: #fff;
            padding: 20px 45px 20px 20px;
        }

        .input-box input::placeholder {
            color: #fff;
        }

        .input-box i {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 20px;
        }
    </style>
</head>
<body>

<div class="wrapper">
    <h1>Login</h1>
    <form action="user-login" method="post">

        <div class="input-box">
            <input type="email" name="Login-email" placeholder="Enter your email" required>
            <i class='bx bxs-envelope'></i>
        </div>

        <div class="input-box">
            <input type="password" name="Login-password" placeholder="Enter your password" required>
            <i class='bx bxs-lock-alt'></i>
        </div>

        <div class="text-center">
            <button type="submit" class="btn">Login</button>
        </div>

    </form>
    <div class="reg-link">
        <p>Don't have an account? <a href="#">Register</a></p>
    </div>
</div>

<%@include file="includes/footer.jsp"%>
</body>
</html>