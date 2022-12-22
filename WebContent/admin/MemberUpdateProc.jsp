<%@ page contentType="text/html;charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="memMgr" class="product.MemberMgr" />
<jsp:useBean id="regBean" class="member.Info.DBBean" />
<jsp:setProperty name="regBean" property="*" />
<%
    boolean flag = memMgr.memberUpdate(regBean);
%>

<%
if(flag){
%>
		<script>
		alert("성공적으로 수정하였습니다");
		location.href="MemberMgr.jsp";
		</script>
<%
	}else{
%>
		<script>
		alert("수정도중 에러가 발생하였습니다.");
		history.back();
		</script>

<%
	  }
%>
