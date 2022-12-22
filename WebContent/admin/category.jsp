<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("AdminLogin.jsp");
	}
%>
<style>
input[type=button]{
	background-color: #dfdfdf; 
	border-style: solid; 
	border-width: 0px; 
	color: white; 
	width: 150px; 
	height: 50px;
    font-size: 1.1em; 
    margin: 5px 10px;
    border-radius: 5px;
}
#form{
	margin: 50px 0px 300px 0px;
}
</style>
<article id="form">
관리자님, 어서오세요<br><br>
<input type="button" value="MEMBER" onclick="location.href='MemberMgr.jsp'">
<input type="button" value="PRODUCT" onclick="location.href='ProductMgr.jsp'">
<input type="button" value="ORDER" onclick="location.href='OrderMgr.jsp'">
<input type="button" value="NOTICE" onclick="location.href='adminNotice.jsp'"> 
</article>