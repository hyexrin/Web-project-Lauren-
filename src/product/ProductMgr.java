package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class ProductMgr {

    private member.Info.DButill pool = null;

    public ProductMgr() {
        try {
            pool = member.Info.DButill.getInstance();
        } catch (Exception e) {
            System.out.println("Error !!");
        }
    }

    public boolean insertProduct(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
     
           String uploadDir =this.getClass().getResource("").getPath();
        	uploadDir =	   uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"JspWork/WebContent/data";
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

            con = pool.getConnection();
            String query = "insert into shop_product(name, price, detail, date, stock, image, gender, kind, sub1, sub2, sub3)"
                    + "values(?, ?, ?, now(), ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, multi.getParameter("name"));
            pstmt.setString(2, multi.getParameter("price"));
            pstmt.setString(3, multi.getParameter("detail"));
            pstmt.setString(4, multi.getParameter("stock"));

            if (multi.getFilesystemName("image") == null) {
                pstmt.setString(5, "ready.gif");
            } else {
                pstmt.setString(5, multi.getFilesystemName("image"));
            }
            
            pstmt.setString(6, multi.getParameter("gender"));
            pstmt.setString(7, multi.getParameter("kind"));
            
            if (multi.getFilesystemName("sub1") == null) {
                pstmt.setString(8, "ready.gif");
            } else {
                pstmt.setString(8, multi.getFilesystemName("sub1"));
            }
            
            if (multi.getFilesystemName("sub2") == null) {
                pstmt.setString(9, "ready.gif");
            } else {
                pstmt.setString(9, multi.getFilesystemName("sub2"));
            }
            
            if (multi.getFilesystemName("sub3") == null) {
                pstmt.setString(10, "ready.gif");
            } else {
                pstmt.setString(10, multi.getFilesystemName("sub3"));
            }
            
            
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;

        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }

    public ProductBean getProduct(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ProductBean product = null;

        try {
            con = pool.getConnection();
            String query = "select * from shop_product where no=?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                product = new ProductBean();
                product.setNo(rs.getInt("no"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("date"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
                product.setGender(rs.getString("gender"));
                product.setView(rs.getInt("view"));
                product.setKind(rs.getString("kind"));
                product.setSub1(rs.getString("sub1"));
                product.setSub2(rs.getString("sub2"));
                product.setSub3(rs.getString("sub3"));
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt, rs);
        }
        return product;

    }

    public boolean updateProduct(HttpServletRequest req) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        
        String uploadDir =this.getClass().getResource("").getPath();
     	uploadDir =	   uploadDir.substring(1,uploadDir.indexOf(".metadata"))+"JspWork/WebContent/data";

        try {
            con = pool.getConnection();
            MultipartRequest multi = new MultipartRequest(req, uploadDir, 5 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());

            if (multi.getFilesystemName("image") == null) {
                String query = "update shop_product set name = ?, price = ?, detail = ?, stock = ?, gender = ?, kind = ?, sub1 = ?, sub2 = ?, sub3 = ?  where no = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("name"));
                pstmt.setString(2, multi.getParameter("price"));
                pstmt.setString(3, multi.getParameter("detail"));
                pstmt.setString(4, multi.getParameter("stock"));
                pstmt.setString(5, multi.getParameter("gender"));
                pstmt.setString(6, multi.getParameter("kind"));
                pstmt.setString(7, multi.getFilesystemName("sub1"));
                pstmt.setString(8, multi.getFilesystemName("sub2"));
                pstmt.setString(9, multi.getFilesystemName("sub3"));
                pstmt.setString(10, multi.getParameter("no"));
            } else {
                String query = "update shop_product set name =? ,price = ?, detail = ?,stock = ?, image = ?, gender = ?, kind = ?, sub1 = ?, sub2 = ?, sub3 = ? where no = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, multi.getParameter("name"));
                pstmt.setString(2, multi.getParameter("price"));
                pstmt.setString(3, multi.getParameter("detail"));
                pstmt.setString(4, multi.getParameter("stock"));
                pstmt.setString(5, multi.getFilesystemName("image"));
                pstmt.setString(6, multi.getParameter("gender"));
                pstmt.setString(7, multi.getParameter("kind"));
                pstmt.setString(8, multi.getFilesystemName("sub1"));
                pstmt.setString(9, multi.getFilesystemName("sub2"));
                pstmt.setString(10, multi.getFilesystemName("sub3"));
                pstmt.setString(11, multi.getParameter("no"));
            }
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }

    public void reduceProduct(OrderBean order) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = pool.getConnection();
            String query = "update shop_product set stock = (stock - ? ) where no = ? ";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, order.getQuantity());
            pstmt.setString(2, order.getProduct_no());
            pstmt.executeUpdate();
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
    }

    public void viewIncrease(OrderBean order) {
    	Connection con = null;
    	PreparedStatement pstmt = null;
    	try {
			con = pool.getConnection();
			String query = "update shop_product set view = (view + ?) where no = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, order.getQuantity());
			pstmt.setString(2, order.getProduct_no());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("Exception :" + e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
    }

    public Vector getProductList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_product order by no desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
                product.setNo(rs.getInt("no"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("date"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
                product.setGender(rs.getString("gender"));
                product.setView(rs.getInt("view"));
                product.setKind(rs.getString("kind"));
                product.setSub1(rs.getString("sub1"));
                product.setSub2(rs.getString("sub2"));
                product.setSub3(rs.getString("sub3"));
                
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vProduct;
    }
    
    public Vector getBestList() throws SQLException {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        Vector vProduct = new Vector();

        try {
            con = pool.getConnection();
            String query = "select * from shop_product order by view desc";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                ProductBean product = new ProductBean();
                product.setNo(rs.getInt("no"));
                product.setName(rs.getString("name"));
                product.setPrice(rs.getString("price"));
                product.setDetail(rs.getString("detail"));
                product.setDate(rs.getString("date"));
                product.setStock(rs.getString("stock"));
                product.setImage(rs.getString("image"));
                product.setGender(rs.getString("gender"));
                product.setView(rs.getInt("view"));
                product.setKind(rs.getString("kind"));
                product.setSub1(rs.getString("sub1"));
                product.setSub2(rs.getString("sub2"));
                product.setSub3(rs.getString("sub3"));
                vProduct.add(product);
            }
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, stmt, rs);
        }
        return vProduct;
    }


    public boolean deleteProduct(String no) {
        Connection con = null;
        PreparedStatement pstmt = null;
        boolean result = false;

        try {
            con = pool.getConnection();
            String query = "delete from shop_product where no = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, no);
            int count = pstmt.executeUpdate();
            if (count == 1) result = true;
        } catch (Exception ex) {
            System.out.println("Exception :" + ex);
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return result;
    }


}