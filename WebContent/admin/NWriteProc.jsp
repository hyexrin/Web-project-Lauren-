<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="posting.NMgr"%>
<%@ page import="java.io.PrintWriter"%>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="nbean" class="posting.NBean" scope="page"/>
<jsp:setProperty name="nbean" property="n_title" />
<jsp:setProperty name="nbean" property="n_content" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NWriteProc</title>
</head>
<body>

	<%
		String mem_id = (String)session.getAttribute("sid");
	if(session.getAttribute("mem_id") != null) {
		mem_id = (String)session.getAttribute("mem_id");
		
	}
	
	if(mem_id == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요. ')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}else{
		if(nbean.getN_title() == null || nbean.getN_content() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력되지 않은 사항이 있습니다. ')");
			script.println("history.back()");
			script.println("</script>");
		}else{
		NMgr nmgr = new NMgr();
		int result = nmgr.write(nbean.getN_title(),nbean.getN_content());
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다. ')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기 완료 ')");
			script.println("location.href = 'adminNotice.jsp'");
			script.println("</script>");
		}
		
	}
	}
	
	%>

</body>
</html>