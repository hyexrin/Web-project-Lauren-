<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="posting.PMgr"%>
<%@ page import="posting.PBean"%>
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
 
	if(sid == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요. ')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	
	int QA_number = 0;	
	if(request.getParameter("QA_number")!=null){
	String QA_number2 = request.getParameter("QA_number");
	QA_number = Integer.parseInt(QA_number2.trim());
		//int QA_number = Integer.parseInt(request.getParameter("QA_number"));
	}
	
	if(QA_number == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않을 글입니다.')");
		script.println("location.href = 'QnA.jsp'");
		script.println("</script>");
	}
	
	  PBean pbean = new PMgr().getPBean(QA_number);
	  if(!sid.equals(pbean.getMem_id()) && !sid.equals("root")   ){
		  PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다')");
			script.println("location.href = 'QnA.jsp'");
			script.println("</script>");
	  }else{
		if(request.getParameter("QA_title") == null || request.getParameter("QA_content") == null || request.getParameter("mem_email") == null
				|| request.getParameter("QA_title").equals("") || request.getParameter("QA_content").equals("") || request.getParameter("mem_email").equals("")
				){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력되지 않은 사항이 있습니다. ')");
			script.println("history.back()");
			script.println("</script>");
		}else{
		PMgr pmgr = new PMgr();
		int result = pmgr.update(QA_number, request.getParameter("QA_title"),request.getParameter("QA_content"), request.getParameter("mem_email") );
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글수정에 실패했습니다. ')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글수정 완료 ')");
			script.println("location.href = 'QnA.jsp'");
			script.println("</script>");
		}
		//update(QA_number, request.getParameter("QA_title"), request.getParameter("QA_content"));
	}
	}
	
	%>

</body>
</html>