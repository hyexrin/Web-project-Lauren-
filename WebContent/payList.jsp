<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="member.Info.*"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="member" class="member.Info.DButill" />
<% 
   String login = (String)session.getAttribute("sid");
   DBBean ab= member.getMember(login);
   
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="screen" href="css/PayList.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/etc.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/content.css" />


<title>주문하기</title>
</head>
<body>
<div id="wrap">
<header>
<jsp:include page="top.jsp" flush="false" />
</header>
<div id ="main" align = "center">

<div align="center">

<H3>주문정보 </H3>
<HR>
<table border="1">
  <tr>
    <th><font>이름</font></th>
    <td><%=ab.getMem_name() %></td>
  </tr>
  <tr>
    <th><font>email</font></th>
    <td><input type="text" style="border: 0px" size="30" value="<%=ab.getMem_email() %>"></td>
  </tr>
    <tr>
    <th><font>연락처</font></th>
    <td><input type="text" style="border: 0px" value="<%=ab.getMem_tel() %>"></td>
  <tr>
    <th><font>배송지</font></th>
    <td><input type="text" style="border: 0px" value=""></td>
  </tr>
  
    <th><font>결제방식</font></th>
    <td><input type="radio" id="r2" name="rr" />
    	<label for="r2"><span></span>신용 카드</label>
    	<input type="radio" id="r2" name="rr" />
    	<label for="r2"><span>무통장 입금</span></label>
    </td>
  </tr>
  <tr>
    <td colspan=2 align=center><a href="OrderProc.jsp"><button class="button"><span>주문하기</span></button></a></td>
</tr>
</table>
<!-- </form> -->
<footer>
          <jsp:include page="bottom.jsp" flush="false" />
</footer>

</div>
</body>
</html>