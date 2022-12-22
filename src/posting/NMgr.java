package posting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NMgr {
	 private member.Info.DButill pool = null;
	    public NMgr() {
	        try {
	            pool = member.Info.DButill.getInstance();
	        } catch (Exception e) {
	            System.out.println("Error !!");
	        }
	    }
	
	public String getDate() {
		Connection con = null;
        ResultSet rs = null;
		String SQL = "select NOW()";
		try {
			con = pool.getConnection();
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		Connection con = null;
        ResultSet rs = null;
		String SQL = "select n_number from notice order by n_number DESC";
		try {
			con = pool.getConnection();
			PreparedStatement pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0; 
	}
	
	public int write(String n_title, String n_content) {
		Connection con = null;
       
		String SQL = "insert into notice values(?,?,?,?,?)";
		try {
			con = pool.getConnection();
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, n_title);
			pstmt.setString(3, getDate());
			pstmt.setString(4, n_content);
			pstmt.setInt(5, 1);
			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	

	public ArrayList<NBean> getList(int pageNumber){
		Connection con = null;
        ResultSet rs = null;
		String SQL = "select * from notice where n_number < ? and n_available = 1 order by n_number desc limit 10";
		ArrayList<NBean> list = new ArrayList<NBean>();
		try {
			con = pool.getConnection();
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NBean nbean = new NBean();
				nbean.setN_number(rs.getInt(1));
				nbean.setN_title(rs.getString(2));
				nbean.setN_date(rs.getString(3));
				nbean.setN_content(rs.getString(4));
				nbean.setN_available(rs.getInt(5));
				list.add(nbean);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public boolean nextPage(int pageNumber) {
		Connection con = null;
        ResultSet rs = null;
		String SQL = "select * from notice where n_number < ? and n_available = 1";
		
		try {
			con = pool.getConnection();
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	public NBean getNBean(int n_number) {
		Connection con = null;
        ResultSet rs = null;
		String SQL = "select * from notice where n_number = ?";
		try {
			con = pool.getConnection();
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1,n_number);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				NBean nbean = new NBean();
				nbean.setN_number(rs.getInt(1));
				nbean.setN_title(rs.getString(2));
				nbean.setN_date(rs.getString(3));
				nbean.setN_content(rs.getString(4));
				nbean.setN_available(rs.getInt(5));
				return nbean;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int n_number, String n_title, String n_content) {
		Connection con = null;
      
		String SQL = "update notice set n_title = ?, n_content =? where n_number = ?";
		try {
			con = pool.getConnection();
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, n_title);
			pstmt.setString(2, n_content);
			pstmt.setInt(3, n_number);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}
	
	
	public int delete(int n_number) {
		Connection con = null; 
		
		String SQL = "update notice set n_available=0 where n_number = ?";
		try {
			con = pool.getConnection();
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, n_number);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}
	
}