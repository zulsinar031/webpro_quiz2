package shop_cart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import shop_cart.model.*;

public class ProductDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	
	public ProductDao(Connection con) {
		super();
		this.con = con;
	}

	public List<Product> getAllProduct() {
		List<Product> products = new ArrayList<Product>();
		try {
			query = "select * from product";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("product_id"));
				row.setName(rs.getString("product_name"));
				row.setPrice(rs.getInt("product_price"));
				row.setImage(rs.getString("product_image"));
				
				products.add(row);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return products;
	}

	public Product getSingleProduct(int id){
		Product row = null;
		try {
			query = "select * from products where product_id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				row = new Product();
				row.setId(rs.getInt("product_id"));
				row.setName(rs.getString("product_name"));
				row.setPrice(rs.getInt("product_price"));
				row.setImage(rs.getString("product_image"));
			}
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return row;
	}
	
	public List<cart> getCartProducts(ArrayList<cart> cartList){
		List<cart> products = new ArrayList<cart>();
		try {
			if(cartList.size() > 0) {
				for(cart item : cartList) {
					query = "select * from product where product_id=?"; //pinpont debug
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while (rs.next()) {
						cart row = new cart();
						row.setId(rs.getInt("product_id"));
						row.setName(rs.getString("product_name"));
						row.setPrice(rs.getInt("product_price")*item.getQuantity());
						row.setQuantity(item.getQuantity());
						
						products.add(row);
					}
				}
			}
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			
		}
		return products;
	}
	public int getTotalCartPrice(ArrayList<cart> cartList) {
		int sum = 0;
		try {
			if(cartList.size() > 0) {
				for(cart item : cartList) {
					query = "select product_price from product where product_id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					
					while(rs.next()) {
						sum+=rs.getInt("product_price")*item.getQuantity();
					}
				}
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return sum;
	}
}





