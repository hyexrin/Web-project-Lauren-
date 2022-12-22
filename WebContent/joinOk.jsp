<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  import="member.Info.*, java.util.*"%>
    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="db" class="member.Info.DButill"/> 
<jsp:useBean id="dbBean" class="member.Info.DBBean"/> 
<jsp:setProperty name="dbBean" property="*"/> 
<% 
	
	String action = request.getParameter("action");

	if(action.equals("list")) {
		ArrayList<DBBean> datas = db.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("index.jsp");
	}
	//등록 요청인 경우
	else if(action.equals("insert")) {		
		if(db.insertDB(dbBean)) {
			response.sendRedirect("joinOk.jsp?action=list");
		}
		else
			throw new Exception("DB 입력오류");
	}
	
%>