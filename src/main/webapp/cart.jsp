<%@ page import = "shop_cart.conn.DbCon" %>
<%@ page import = "shop_cart.model.*" %>
<%@ page import = "shop_cart.dao.*" %>
<%@ page import = "java.util.* "%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    user auth = (user) request.getSession().getAttribute("auth");
    if(auth != null){
    	request.setAttribute("auth", auth);
    }
    
    ArrayList<cart> cart_list = (ArrayList<cart>) session.getAttribute("cart-list");
    List<cart> cartproduct = null;
    if(cart_list != null) {
    	ProductDao pDao = new ProductDao(DbCon.getConnection());
    	cartproduct = pDao.getCartProducts(cart_list);
    	int total = pDao.getTotalCartPrice(cart_list);
    	request.setAttribute("cart_list",cart_list);
    	request.setAttribute("total",total);
    }
    %>
<!DOCTYPE html>
<html>
<head>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"rel="stylesheet">
<title>Cart</title>
 <%@include file="includes/head.jsp"%>
<style type="text/css">
	.table tbody td{
		vertical-align : middle;
	}
	.btn-incre, .btn-decre{
		box-shadow : none;
		font-size : 25px;
	}
	body{
            background : url('coffee/default.jpg') no-repeat;
            background-size: cover;
            background-position: center -90px;
    }
    .container {
		background-color: rgba(255, 255, 255, 0.09); /* Adjust the alpha value as needed */
		padding: 20px; /* Add padding to make the background more visible */
		border-radius: 10px; /* Optional: Add border-radius for rounded corners */
		margin-top: 20px; /* Optional: Add margin-top to adjust the position */
	}
	.container th, .container td {
    	background-color: rgba(255, 255, 255, 0.09);
	}
</style>

</head>
<body>
<%@include file="includes/navbar.jsp" %>

<div class="container">
	<div class="d-flex py-3">
		<h3>Total Price : $ ${ (total > 0)?total:0 }</h3>
		<a href="cart-check-out" class="mx-3 btn btn-primary">Check Out</a>
	</div>
		<table class="table table-Loght">
		<thead>
			<tr>
				<th scope="col">Name</th>
				<th scope="col">Price</th>
				<th scope="col"></th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
		<%if(cart_list != null){
			for(cart c : cartproduct) {%>
				<tr>
				<td><%=c.getName() %></td>
				<td><%=c.getPrice() %></td>
				<td> 
					<form action="" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%= c.getId() %>" class="form-input">
						<div class="form-group d-flex justify-content-between">
							<a class="btn btn-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a>
							<input type="text" name="quantity" class="form-control" value="<%= c.getQuantity() %>" readonly>
							<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
						</div>
					</form>
				</td>
				<td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>	
			<%}
		}%>
			
		</tbody>
		</table>
</div>

<%@include file="includes/footer.jsp"%>
</body>
</html>