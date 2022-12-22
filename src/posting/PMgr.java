package posting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class PMgr {

	 private member.Info.DButill pool = null;

	    public PMgr() {
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
		String SQL = "select QA_number from qa order by QA_number DESC";
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
	
	public int write(String QA_title, String mem_id, String QA_content, String mem_email) {
		Connection con = null;
        ResultSet rs = null;
		String SQL = "insert into qa values(?,?,?,?,?,?,?)";
		try {
			con = pool.getConnection();
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, QA_title);
			pstmt.setString(3, mem_id);
			pstmt.setString(4, getDate());
			pstmt.setString(5, QA_content);
			pstmt.setInt(6, 1);
			pstmt.setString(7, mem_email);
			
			
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	

	public ArrayList<PBean> getList(int pageNumber){
		Connection con = null;
        ResultSet rs = null;
		String SQL = "select * from qa where QA_number < ? and QA_available = 1 order by QA_number desc limit 10";
		ArrayList<PBean> list = new ArrayList<PBean>();
		try {
			con = pool.getConnection();
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				PBean pbean = new PBean();
				pbean.setQA_number(rs.getInt(1));
				pbean.setQA_title(rs.getString(2));
				pbean.setMem_id(rs.getString(3));
				pbean.setQA_date(rs.getString(4));
				pbean.setQA_content(rs.getString(5));
				pbean.setQA_available(rs.getInt(6));
				pbean.setMem_email(rs.getString(7));
				list.add(pbean);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public boolean nextPage(int pageNumber) {
		Connection con = null;
        ResultSet rs = null;
		String SQL = "select * from qa where QA_number < ? and QA_available = 1";
		
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
	
	
	public PBean getPBean(int QA_number) {
		Connection con = null;
        ResultSet rs = null;
		String SQL = "select * from qa where QA_number = ?";
		try {
			con = pool.getConnection();
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1,QA_number);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				PBean pbean = new PBean();
				pbean.setQA_number(rs.getInt(1));
				pbean.setQA_title(rs.getString(2));
				pbean.setMem_id(rs.getString(3));
				pbean.setQA_date(rs.getString(4));
				pbean.setQA_content(rs.getString(5));
				pbean.setQA_available(rs.getInt(6));
				pbean.setMem_email(rs.getString(7));
				return pbean;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int QA_number, String QA_title, String QA_content, String mem_email) {
		Connection con = null;
        ResultSet rs = null;
		String SQL = "update qa set QA_title = ?, QA_content =?, mem_email = ? where QA_number = ?";
		try {
			con = pool.getConnection();
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, QA_title);
			pstmt.setString(2, QA_content);
			pstmt.setString(3, mem_email);
			pstmt.setInt(4, QA_number);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}
	
	
	public int delete(int QA_number) {
		Connection con = null;
        ResultSet rs = null;
		String SQL = "update qa set QA_available=0 where QA_number = ?";
		try {
			con = pool.getConnection();
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, QA_number);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}
	
}