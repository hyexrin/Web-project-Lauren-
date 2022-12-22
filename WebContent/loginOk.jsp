<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> Login_Check </title>
</head>
<body>
<%
		
		String sid = (String)session.getAttribute("sid");
		if(sid != null) {
		    response.sendRedirect("login.jsp");
		   
		} else {
		String mem_id = request.getParameter("mem_id");
		String mem_password = request.getParameter("mem_password");
		String mem_name = request.getParameter("mem_name");
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		 
		String dbid = null;
		String dbpw = null;
		String dbname = null;

		Class.forName("com.mysql.jdbc.Driver");

		conn = DriverManager.getConnection
		("jdbc:mysql://localhost:3306/jspdb?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false","root","1234");
		pstmt = conn.prepareStatement("SELECT mem_id, mem_password, mem_name FROM member WHERE mem_id=?");
		pstmt.setString(1, mem_id);

		rs = pstmt.executeQuery();

		if(rs.next()){
		    System.out.println("아이디 일치");
		    dbid = rs.getString("mem_id");
		    dbpw = rs.getString("mem_password");
		    dbname = rs.getString("mem_name");
		    
		    if(mem_password.equals(dbpw)){     
		        System.out.println("로그인 성공");
		        session.setAttribute("sid", dbid);
		        session.setAttribute("sname", dbname);%>
		        <script> alert("로그인 성공");
	        		location.href="login.jsp";</script><%	
  
		    } else {
		        
		        System.out.println("비밀번호 불일치");
		       %> <script> alert("비밀번호 불일치");
	        		location.href="login.jsp";</script> <%
		       
		    }
		} else {
		    System.out.println("아이디 불일치");
		    %> <script> alert("아이디 불일치");
    		location.href="login.jsp";</script> <%
		    
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		}
%>
</body>
</html>


