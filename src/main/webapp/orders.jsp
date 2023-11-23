<%@ page import = "shop_cart.conn.DbCon" %>
<%@ page import = "shop_cart.model.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List" %>
<%@page import ="shop_cart.dao.*" %>
<%@page import ="shop_cart.conn.DbCon" %>
    <%
    user auth = (user) request.getSession().getAttribute("auth");
    if(auth != null){
    	request.setAttribute("auth", auth);
    }
    
    ProductDao pd = new ProductDao(DbCon.getConnection());
    List<Product> products = pd.getAllProduct();
    
    %>
<!DOCTYPE html>
<html>
<head>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"rel="stylesheet">
<title>Orders</title>
 <%@include file="includes/head.jsp"%>
<style>
body{
            background : url('coffee/default.jpg') no-repeat;
            background-size: cover;
            background-position: center -90px;
        }

</style>

</head>
<body>
<%@include file="includes/navbar.jsp" %>
	<div class="container">
		<%-- <div class="card-header my-3">Menu</div> --%>
		<div class="row">
		
		<%
			if(!products.isEmpty()){
				for(Product p : products) {%>
					<div class="col-md-3 my-3">
					<div class="card w-100" style="width: 18rem;">
					  <img class="card-img-top" src="<%= p.getImage() %>" alt="Card image cap">
					  <div class="card-body">
					    <h5 class="card-title"><%= p.getName() %></h5>
					    <h6 class="price">Price: $ <%= p.getPrice()%></h6>
					    <div class="mt-3 d-flex justify-content-between">
					    	<a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-primary">Add to Cart</a>
					    </div>
					  </div>
					</div>
				</div>
				<%}
			}
		%>
		
		
		</div>
	</div>
	
<%@include file="includes/footer.jsp"%>
</body>
</html>