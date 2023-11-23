package shop_cart.servlet;

import shop_cart.conn.DbCon;
import shop_cart.dao.OrderDao;
import shop_cart.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Servlet implementation class CheckOutSerlet
 */
public class CheckOutSerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()) {
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
			Date date = new Date();
			
			ArrayList<cart> cart_list = (ArrayList<cart>) request.getSession().getAttribute("cart-list");
			user auth = (user) request.getSession().getAttribute("auth");
			
			if(cart_list != null && auth != null) {
				for(cart c: cart_list) {
					order order = new order();
					order.setId(c.getId());
					order.setUid(auth.getUser_id());
					order.setQuantity(c.getQuantity());
					order.setDate(formatter.format(date));
					
					OrderDao oDao = new OrderDao(DbCon.getConnection());
					boolean result = oDao.InsertOrder(order);
					if(!result) break;
				}
				cart_list.clear();
				response.sendRedirect("orders.jsp");
			}
			else {
				if(auth == null) response.sendRedirect("login.jsp");
				response.sendRedirect("cart.jsp");
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
