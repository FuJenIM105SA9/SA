/**
 * sample program for web programming written by Ben Wu
 * reference: http://www.mkyong.com/spring/maven-spring-jdbc-example/
 */
package com.sample.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.sample.product.entity.Product;

public class ProductDAODB implements ProductDAO {
	private DataSource dataSource;
	private Connection conn = null ;
	private ResultSet rs = null ;
	private PreparedStatement smt = null ;
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public List<Product> getList(){
		String sql = "SELECT * FROM product WHERE State = 'Released'";
		return getList(sql);
	}
	public List<Product> getList2(){
		String sql = "SELECT * FROM product ";
		return getList(sql);
	}
public List<Product> getList3(String ser,String stype){
		
		String sql = "SELECT * FROM product  WHERE " + stype + " LIKE '%"+ser+"%'";
		return getList(sql);
	}

public List<Product> getList4(String c){
	
	String sql = "SELECT * FROM product  WHERE Category LIKE '%"+c+"%'";
	return getList(sql);
}
	// make it a generic method for different conditions
	public List<Product> getList(String sql) {
					
		List<Product> productList = new ArrayList<Product>();
		try {
			conn = dataSource.getConnection();
			smt = conn.prepareStatement(sql);
			rs = smt.executeQuery();
			while(rs.next()){
				Product aProduct = new Product();
				aProduct.setId(rs.getInt("productID"));			
				aProduct.setCategory(rs.getString("category"));
				aProduct.setDesc(rs.getString("description"));
				aProduct.setInventory(rs.getInt("inventory"));
				aProduct.setReorderPoint(rs.getInt("reorderPoint"));
				aProduct.setDetails(rs.getString("details"));
				aProduct.setPrice(rs.getDouble("price"));
				aProduct.setState(rs.getString("State"));
				productList.add(aProduct);
			}
			rs.close();
			smt.close();
 
		} catch (SQLException e) {
			throw new RuntimeException(e);
 
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}
		}
		return productList;
	}
		  

	public void insert(Product aProduct) {

		// remove first parameter when Id is auto-increment
	    String sql = "INSERT INTO product (Category, Description, Inventory, ReorderPoint , Price, State) VALUES(?, ?, ?, ?, ?, ?, ?)";	
		try {
			conn = dataSource.getConnection();
			smt = conn.prepareStatement(sql);
			smt.setString(1, aProduct.getCategory());
			smt.setString(2, aProduct.getDesc());
			smt.setInt(3, aProduct.getInventory());
			smt.setInt(4, aProduct.getReorderPoint());
			smt.setString(5, aProduct.getDetails());
			smt.setDouble(6, aProduct.getPrice());
			smt.setString(7, aProduct.getState());
			smt.executeUpdate();			
			smt.close();
 
		} catch (SQLException e) {
			throw new RuntimeException(e);
 
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}
		}
		
	}

	public Product get(long id) {
		Product aProduct = new Product();
		String sql = "SELECT * FROM product WHERE productID = ?";
		try {
			conn = dataSource.getConnection();
			smt = conn.prepareStatement(sql);
			smt.setLong(1, id);
			rs = smt.executeQuery();
			if(rs.next()){
				aProduct.setId(rs.getInt("productID"));
				aProduct.setCategory(rs.getString("category"));
				aProduct.setDesc(rs.getString("description"));
				aProduct.setInventory(rs.getInt("inventory"));
				aProduct.setReorderPoint(rs.getInt("reorderPoint"));
				aProduct.setDetails(rs.getString("details"));
				aProduct.setPrice(rs.getDouble("price"));
				aProduct.setState(rs.getString("State"));
			}
			rs.close();
			smt.close();
 
		} catch (SQLException e) {
			throw new RuntimeException(e);
 
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}
		}
		return aProduct;
	}
	
	public void update(Product aProduct) {
		
		String sql = "UPDATE product SET Category=?, Description=?, Inventory=?, ReorderPoint=?, Details=? ,Price=?, State=?"
				+ "WHERE productID = ?";
		
		try {
			conn = dataSource.getConnection();
			smt = conn.prepareStatement(sql);
			smt.setString(1, aProduct.getCategory());
			smt.setString(2, aProduct.getDesc());
			smt.setInt(3, aProduct.getInventory());
			smt.setInt(4, aProduct.getReorderPoint());
			smt.setString(5, aProduct.getDetails());
			smt.setDouble(6, aProduct.getPrice());
			smt.setString(7, aProduct.getState());
			smt.setLong(8, aProduct.getId());
			smt.executeUpdate();			
			smt.close();
 
		} catch (SQLException e) {
			throw new RuntimeException(e);
 
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}
		}
		
	}
	
public void release(long id) {
		System.out.println("pid="+id);
		String sql = "UPDATE product SET State = 'Released' WHERE productID = ?";
		try {
			conn = dataSource.getConnection();
			smt = conn.prepareStatement(sql);
			smt.setLong(1, id+1);
			smt.executeUpdate();			
			smt.close();
 
		} catch (SQLException e) {
			throw new RuntimeException(e);
 
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}
		}
	}
	
	public void delete(long id) {
		System.out.println("pid="+id);
		String sql = "UPDATE product SET State = 'Removed' WHERE productID = ?";
		try {
			conn = dataSource.getConnection();
			smt = conn.prepareStatement(sql);
			smt.setLong(1, id+1);
			smt.executeUpdate();			
			smt.close();
 
		} catch (SQLException e) {
			throw new RuntimeException(e);
 
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}
		}
	}

	public int count(){
		return 0; //no longer needed
	}


public Product get(Product aProduct) {
		
		String sql = "SELECT * FROM product WHERE productID = ?";
		try {
			conn = dataSource.getConnection();
			smt = conn.prepareStatement(sql);
			smt.setLong(1, aProduct.getId());
			rs = smt.executeQuery();
			if(rs.next()){
				aProduct.setId(rs.getInt("productID"));
				aProduct.setCategory(rs.getString("category"));
				aProduct.setDesc(rs.getString("description"));
				aProduct.setInventory(rs.getInt("inventory"));
				aProduct.setReorderPoint(rs.getInt("reorderPoint"));
				aProduct.setDetails(rs.getString("details"));	
				aProduct.setPrice(rs.getDouble("price"));
				aProduct.setState(rs.getString("State"));
			}
			rs.close();
			smt.close();
 
		} catch (SQLException e) {
			throw new RuntimeException(e);
 
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {}
			}
		}
		return aProduct;
	}
public List<Product> getAvailableList() {
	String sql = "SELECT * FROM product WHERE Inventory > 0";
	return getList(sql);
}


public List<Product> getReorderList() {
	String sql = "SELECT * FROM product WHERE Inventory < ReorderPoint";
	return getList(sql);
}
	

}//ProductDAOBean

