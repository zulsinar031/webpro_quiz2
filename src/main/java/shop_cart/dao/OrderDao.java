package shop_cart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop_cart.model.Product;
import shop_cart.model.order;


public class OrderDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public OrderDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean InsertOrder(order model) {
		boolean result = false;
		try {
			query = "insert into orders (product_id, user_id, orders_quantity, order_date) values (?,?,?,?)";
		
			pst = this.con.prepareStatement(query);
			pst.setInt(1, model.getId());
			pst.setInt(2, model.getUid());
			pst.setInt(3, model.getQuantity());
			pst.setString(4, model.getDate());
			
			pst.executeUpdate();
			result = true;
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	public List<order>userorders(int id){
		List<order>list = new ArrayList<>();
		try {
			query = "select * from orders where user_id=? order by orders.orders_id desc";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				order order = new order();
				ProductDao productDao = new ProductDao(this.con);
				int pId = rs.getInt("product_id");
				Product product = productDao.getSingleProduct(pId);
				order.setOrderId(rs.getInt("orders_id"));
				order.setId(pId);
				order.setName(product.getName());
				order.setPrice(product.getPrice()*rs.getInt("order_quantity"));
				order.setQuantity(rs.getInt("order_quantity"));
				order.setDate(rs.getString("order_date"));
				list.add(order);
			}
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return list;
	}

	public void cancelOrder(int id) {
		try {
			query = "delete from orders where orders_id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();
		}
		catch(SQLException e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}





}
