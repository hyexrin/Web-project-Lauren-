<%@ page contentType="text/html;charset=UTF-8" %>
    <link rel="stylesheet" type="text/css" media="screen" href="../css/admin.css" />
<%
    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("AdminLogin.jsp");
	}
%>

<article id="form">
admin 첫 페이지에 바로 멤버 보이게 하는거에 대해서 어떻게 생각하시나요? ㅎㅂㅎ
</article>