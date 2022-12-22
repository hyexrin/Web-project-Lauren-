package product;

import java.sql.*;
import java.util.Vector;


public class MemberMgr {

    private member.Info.DButill pool = null;

    public MemberMgr() {
        try {
            pool = member.Info.DButill.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }

    public boolean checkId(String id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean checkCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select id from member where id = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            checkCon = rs.next();

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return checkCon;
    }

 /*   public Vector zipcodeRead(String area3) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();
        try {
            con = pool.getConnection();
            String strQuery = "select * from zipcode where area3 like '" + area3 + "%'";
            pstmt = con.prepareStatement(strQuery);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ZipcodeBean tempZipcode = new ZipcodeBean();
                tempZipcode.setZipcode(rs.getString("zipcode"));
                tempZipcode.setArea1(rs.getString("area1"));
                tempZipcode.setArea2(rs.getString("area2"));
                tempZipcode.setArea3(rs.getString("area3"));
                tempZipcode.setArea4(rs.getString("area4"));
                vecList.addElement(tempZipcode);
            }

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return vecList;
    }*/

    public boolean memberInsert(member.Info.DBBean regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "insert into member(mem_name,mem_email,mem_birth,mem_tel,mem_comdept,mem_memo,mem_id,mem_password) values(?,?,?,?,?,?,?,?)";            
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getMem_name());
            pstmt.setString(2, regBean.getMem_email());
            pstmt.setString(3, regBean.getMem_birth());
            pstmt.setString(4, regBean.getMem_tel());
            pstmt.setString(5, regBean.getMem_comdept());
            pstmt.setString(6, regBean.getMem_memo());
            pstmt.setString(7, regBean.getMem_id());
            pstmt.setString(8, regBean.getMem_password());
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }

    public member.Info.DBBean getMember(String mem_id) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        member.Info.DBBean regBean = null;

        try {
            con = pool.getConnection();
            String strQuery = "select * from member where mem_id=?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, mem_id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                regBean = new member.Info.DBBean();
                regBean.setMem_number(rs.getInt("mem_number"));
                regBean.setMem_id(rs.getString("mem_id"));
                regBean.setMem_password(rs.getString("mem_password"));
                regBean.setMem_name(rs.getString("mem_name"));
                regBean.setMem_tel(rs.getString("mem_tel"));
                regBean.setMem_birth(rs.getString("mem_birth"));
                regBean.setMem_email(rs.getString("mem_email"));
                regBean.setMem_memo(rs.getString("mem_memo"));
                regBean.setMem_comdept(rs.getString("mem_comdept"));
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return regBean;
    }

    public Vector getMemberList() {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vecList = new Vector();

        try {
            con = pool.getConnection();
            String strQuery = "select * from member order by mem_number desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(strQuery);

            while (rs.next()) {
                member.Info.DBBean regBean = new member.Info.DBBean();

                regBean.setMem_number(rs.getInt("mem_number"));
                regBean.setMem_name(rs.getString("mem_name"));
                regBean.setMem_email(rs.getString("mem_email"));
                regBean.setMem_comdept(rs.getString("mem_comdept"));
                regBean.setMem_birth(rs.getString("mem_birth"));
                regBean.setMem_tel(rs.getString("mem_tel"));
				regBean.setMem_memo(rs.getString("mem_memo"));
				regBean.setMem_id(rs.getString("mem_id"));
				regBean.setMem_password(rs.getString("mem_password"));
                vecList.add(regBean);
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vecList;
    }

    public boolean memberUpdate(member.Info.DBBean regBean) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            con = pool.getConnection();
            String strQuery = "update member set mem_password=?, mem_name=?,";
            strQuery = strQuery + " mem_email=?, mem_tel=?, mem_comdept=?, mem_memo=?";
            strQuery = strQuery + " where mem_id=? ";

            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, regBean.getMem_password());
            pstmt.setString(2, regBean.getMem_name());
            pstmt.setString(3, regBean.getMem_email());
            pstmt.setString(4, regBean.getMem_tel());
            pstmt.setString(5, regBean.getMem_comdept());
            pstmt.setString(6, regBean.getMem_memo());
            pstmt.setString(7, regBean.getMem_id());
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }

    public boolean loginCheck(String id, String passwd) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean loginCon = false;
        try {
            con = pool.getConnection();
            String strQuery = "select mem_id, mem_password from member where mem_id = ? and mem_password = ?";
            pstmt = con.prepareStatement(strQuery);
            pstmt.setString(1, id);
            pstmt.setString(2, passwd);
            rs = pstmt.executeQuery();
            loginCon = rs.next();
        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return loginCon;
    }

//    public boolean adminCheck(String admin_id, String admin_passwd) {
//        Connection con = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        boolean loginCon = false;
//        try {
//            con = pool.getConnection();
//            String strQuery = "select admin_id, admin_passwd from admin where admin_id = ? and admin_passwd = ?";
//            pstmt = con.prepareStatement(strQuery);
//            pstmt.setString(1, admin_id);
//            pstmt.setString(2, admin_passwd);
//            rs = pstmt.executeQuery();
//            loginCon = rs.next();
//        } catch (Exception ex) {
//            System.out.println("Exception" + ex);
//        } finally {
//            pool.freeConnection(con, pstmt, rs);
//        }
//        return loginCon;
//    }
}
