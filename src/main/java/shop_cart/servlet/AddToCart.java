package shop_cart.servlet;

import shop_cart.model.*;
import java.io.PrintWriter;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class AddToCart
 */
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try (PrintWriter out = response.getWriter()){
			
			ArrayList<cart> cartList = new ArrayList<>();
			int id = Integer.parseInt(request.getParameter("id"));
			cart cm = new cart();
			cm.setId(id);
			cm.setQuantity(1);
			
			HttpSession session = request.getSession();
			ArrayList<cart> cart_list = (ArrayList<cart>) session.getAttribute("cart-list");
			
			if(cart_list == null) {
				cartList.add(cm);
				session.setAttribute("cart-list",cartList);
				response.sendRedirect("orders.jsp");
			}
			else {
				cartList = cart_list;
				boolean exist = false;
				
				for(cart c : cart_list) {
					if(c.getId() == id) {
						exist = true;
						out.println("<h3 style='color:crimson; text-align:center'>Item already exist on cart.<a href='cart.jsp'>Go to Cart page</a>");
					}
					
				}
				if(!exist) {
					cartList.add(cm);
					response.sendRedirect("orders.jsp");
				}
			}
		}
		
	}

}
