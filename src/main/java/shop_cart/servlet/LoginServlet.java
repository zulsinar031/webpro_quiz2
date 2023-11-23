package shop_cart.servlet;

import jakarta.servlet.ServletException;
import shop_cart.dao.*;
import shop_cart.model.user;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import shop_cart.conn.DbCon;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.SQLException;
/**
 * Servlet implementation class LoginServlet
 */

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out = response.getWriter()) {
			String email = request.getParameter("Login-email");
			String password = request.getParameter("Login-password");
			
			try {
				UserDao udao = new UserDao(DbCon.getConnection());
				user user = udao.userlogin(email, password);
			
				if(user != null) {
					request.getSession().setAttribute("auth",user);
					response.sendRedirect("index.jsp");
				}
				else {
					out.print("SEMANGATT FIXNYA");
				}
			}
			catch (ClassNotFoundException | SQLException e){
				e.printStackTrace();
				
			}
			//out.print(email+password);
		}
	}
}
