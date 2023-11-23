<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    * {
        font-family: "Poppins", sans-serif;
        color: #333;
        box-sizing: border-box;
    }

    .nav {
        text-align: right;
        margin-right: 125px; /* Adjust margin for responsiveness */
    }

    .nav .btn {
        padding: 6px;
        font-size: 18px;
        margin-left: 35px; 
        margin-right:35px;/* Adjust margin for responsiveness */
        font-weight: 600;
        text-decoration: none;
        display: inline-block;
    }

    /* Responsive styles */
    @media screen and (max-width: 600px) {
        .nav {
            text-align: center;
            margin-right: 0;
        }

        .nav .btn {
            margin: 10px 5px; /* Adjust margin for smaller screens */
        }
    }

    /* Dropdown styles */
    .dropdown {
        display: inline-block;
        position: relative;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        z-index: 1;
    }

    .dropdown:hover .dropdown-content {
        display: block;
    }

    .dropdown-content a {
        color: #333;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }
    .bx-menu {
    font-size: 35px; /* Adjust the size as needed */
  }
</style>
</head>
<body>
	<div class="nav">
	 
     <div class="dropdown">
     	<a href="#" class="btn"><i class='bx bx-menu'></i></a>
     	<div class="dropdown-content">
     		<a href="index.jsp" class="btn">Home</a>
		    <%if(auth != null){%>
		    	<a href="orders.jsp" class="btn">Order</a>
		        <a href="cart.jsp" class="btn">Cart</a>	
		        <a href="log-out" class="btn">Logout</a>
		    <% }
		    else{%>
		    	<a href="login.jsp" class="btn">Login</a>	
		    <% }%>
     	</div>    
	 </div>
</div>
</body>
</html>