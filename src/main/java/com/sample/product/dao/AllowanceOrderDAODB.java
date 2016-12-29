package com.sample.product.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.sample.product.entity.Product;
import com.sample.product.entity.AllowanceOrder;
import com.sample.product.entity.Manager;
import com.sample.product.entity.SalesOrder;

public class AllowanceOrderDAODB implements AllowanceOrderDAO{
	private DataSource dataSource;
	private Connection conn = null ;
	private ResultSet rs = null ;
	private PreparedStatement smt = null ;
	private PreparedStatement smt2 = null ;
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	/*public void update(long mid, long pid, long soid, String reason) {
		System.out.println("mid: " + mid);
		System.out.println("pid: " + pid);
		System.out.println("soid: " + soid);
		// remove first parameter when Id is auto-increment
	    String sql = "UPDATE returnOrder SET Reason = ? WHERE SOID = ? AND ProductID = ? AND ManagerID = ?" ;
		try {
			conn = dataSource.getConnection();
			smt = conn.prepareStatement(sql);
			smt.setString(1, reason);
			smt.setLong(2, soid);
			smt.setLong(3, pid);
			smt.setLong(4, mid);
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
		
	}*/
	
	public void insert(long mid, long pid, long soid , String detail) {
		System.out.println("mid: " + mid);
		System.out.println("pid: " + pid);
		System.out.println("soid: " + soid);
		// remove first parameter when Id is auto-increment
	    String sql = "INSERT INTO allowanceOrder (ProductID, ManagerID, SOID, allowanceOrderTime , Detail ) VALUES(?, ?, ?, NOW(),? )";
	    String sql2 = "UPDATE salesorderitem SET State = 'Allowance Requested' "
				+ "WHERE SOID = ? AND ProductID = ?";
		try {
			conn = dataSource.getConnection();
			smt = conn.prepareStatement(sql);
			smt.setLong(1, pid);
			smt.setLong(2, mid);
			smt.setLong(3, soid);
			smt.setString(4, detail);
			
			smt.executeUpdate();			
			smt.close();
			smt2 = conn.prepareStatement(sql2);
			smt2.setLong(1, soid);
			smt2.setLong(2, pid);
			smt2.executeUpdate();			
			smt2.close();
           
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

	
	public void confirmallowance(long pid,long soid,double APrice) {
		//String sql = "SELECT SOID FROM SalesOrder "
		String sql = "UPDATE allowanceOrder SET allowanceConfirmTime = Now() , APrice = ? "
				+ "WHERE SOID = ? AND ProductID = ? AND State is null ";
		String sql2 = "UPDATE salesorderitem SET State = 'Allowance Confirmed' "
				+ "WHERE SOID = ? AND ProductID = ?";
		
		System.out.println("pid="+pid+"soid="+soid);
		try {
			conn = dataSource.getConnection();
			smt = conn.prepareStatement(sql);
			smt.setDouble(1, APrice);
			smt.setLong(2, soid);
			smt.setLong(3, pid);
			
			smt.executeUpdate();			
			smt.close();
			smt2 = conn.prepareStatement(sql2);
			smt2.setLong(1, soid);
			smt2.setLong(2, pid);
			smt2.executeUpdate();			
			smt2.close();

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
	public void accept(long mid,long pid,long soid) {
		//String sql = "SELECT SOID FROM SalesOrder "
		String sql = "UPDATE allowanceOrder SET State = 'accepted' "
				+ "WHERE SOID = ? AND ProductID = ? AND State is null ";
		String sql2 = "UPDATE salesorderitem SET State = 'Allowance Accepted' "
				+ "WHERE SOID = ? AND ProductID = ?";
		
		System.out.println("pid="+pid+"soid="+soid);
		try {
			conn = dataSource.getConnection();
			smt = conn.prepareStatement(sql);
			
			smt.setLong(1, soid);
			smt.setLong(2, pid);
			
			smt.executeUpdate();			
			smt.close();
			smt2 = conn.prepareStatement(sql2);
			smt2.setLong(1, soid);
			smt2.setLong(2, pid);
			smt2.executeUpdate();			
			smt2.close();

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
	public void reject(long mid,long pid,long soid) {
		//String sql = "SELECT SOID FROM SalesOrder "
		String sql = "UPDATE allowanceOrder SET State = 'rejected' "
				+ "WHERE SOID = ? AND ProductID = ? AND State is null ";
		String sql2 = "UPDATE salesorderitem SET State = 'Arrived' "
				+ "WHERE SOID = ? AND ProductID = ?";
		
		System.out.println("pid="+pid+"soid="+soid);
		try {
			conn = dataSource.getConnection();
			smt = conn.prepareStatement(sql);
			
			smt.setLong(1, soid);
			smt.setLong(2, pid);
			
			smt.executeUpdate();			
			smt.close();
			smt2 = conn.prepareStatement(sql2);
			smt2.setLong(1, soid);
			smt2.setLong(2, pid);
			smt2.executeUpdate();			
			smt2.close();

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
	
	public List<AllowanceOrder> getList(){
		String sql = "SELECT * FROM allowanceorder";
		return getList(sql);
	}
	public List<AllowanceOrder> getList2(){
		String sql = "SELECT * FROM allowanceorder WHERE allowanceConfirmTime is null ";
		return getList(sql);
	}
	public List<AllowanceOrder> getList3(long mid ,long pid ,long soid){
		String sql = "SELECT * FROM allowanceorder "
				+"WHERE ManagerID = "+mid+" AND SOID = " + soid + " AND ProductID = " + pid + " AND State is null ";
		return getList(sql);
	}
	public List<AllowanceOrder> getList(String sql) {
		
		List<AllowanceOrder> AllowanceOrderList = new ArrayList<AllowanceOrder>();
		try {
			conn = dataSource.getConnection();
			smt = conn.prepareStatement(sql);
			rs = smt.executeQuery();
			int i=0;
			while(rs.next()){
				AllowanceOrder aAllowance = new AllowanceOrder();
				aAllowance.setCount(i);
				i++;
				aAllowance.setAId(rs.getLong("AID"));			
				aAllowance.setProductId(rs.getLong("ProductID"));
				aAllowance.setManagerId(rs.getLong("ManagerID"));
				aAllowance.setsoid(rs.getLong("SOID"));
				aAllowance.setAllowanceOrderTime(rs.getDate("allowanceOrderTime"));
				aAllowance.setAllowanceConfirmTime(rs.getDate("allowanceConfirmTime"));
				aAllowance.setaPrice(rs.getDouble("APrice"));
				aAllowance.setDetail(rs.getString("Detail"));
			
				AllowanceOrderList.add(aAllowance);
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
		return AllowanceOrderList;
	}

}
