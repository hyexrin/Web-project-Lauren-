<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="posting.NMgr"%>
<%@ page import="posting.NBean"%>
<%request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String sid = null;
	if(session.getAttribute("sid") != null) {
		sid = (String)session.getAttribute("sid");
	}
 
	
	int n_number = 0;	
	if(request.getParameter("n_number")!=null){
	String n_number2 = request.getParameter("n_number");
	n_number = Integer.parseInt(n_number2.trim());
		//int QA_number = Integer.parseInt(request.getParameter("QA_number"));
	}
	
	if(n_number == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않을 글입니다.')");
		script.println("location.href = 'notice.jsp'");
		script.println("</script>");
	}
	
	  NBean nbean = new NMgr().getNBean(n_number);
	  if(!sid.equals("root")   ){
		  PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href = 'notice.jsp'");
			script.println("</script>");
	  }else{	
		NMgr nmgr = new NMgr();
		int result = nmgr.delete(n_number);
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글삭제에 실패했습니다. ')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글삭제 완료 ')");
			script.println("location.href = 'adminNotice.jsp'");
			script.println("</script>");
		}
		
	}
	
	
	%>

</body>
</html>