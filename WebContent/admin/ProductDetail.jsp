<%@page import="product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, product.*"%>
<!DOCTYPE html>

<jsp:useBean id="proMgr" class="product.ProductMgr" />

<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Lauren Admin Main</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="../css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="../css/etc.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="../css/adminProduct.css" />
    <script language="JavaScript" src="script.js"></script>
</head>
<body>
    <div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>

       <div id="pro_list" align="center">
<%ProductBean product= proMgr.getProduct(request.getParameter("no"));%>

<table>
<tr>
  <td ><img src="<%=request.getContextPath()%>/data/<%=product.getImage()%> "  width="400" height="600"> </td> 

<td> <b><%=product.getName()%></b><br><br>
 
￦<%=product.getPrice()%><br><br>

<%=product.getStock()%><br><br>

<%=product.getDate()%><br><br>

<%=product.getGender()%>/<%=product.getKind() %><br><br>

<%=product.getView() %>회 주문<br><br>

<pre><%=product.getDetail()%></pre></td><br>
</tr>
<tr>
  <td>
  	<img src="<%=request.getContextPath()%>/data/<%=product.getSub1()%> "  width="200" height="300">
  	<img src="<%=request.getContextPath()%>/data/<%=product.getSub2()%> "  width="200" height="300">
  	<img src="<%=request.getContextPath()%>/data/<%=product.getSub3()%> "  width="200" height="300">
  	
  </td> 
</tr>
</table>

<a href="javascript:productUpdate('<%=product.getNo()%>')">수정하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="javascript:productDelete('<%=product.getNo()%>')">삭제하기</a>
       </div>   
    
	
        <footer>
          <jsp:include page="bottom.jsp" flush="false" />
        </footer>
        
        	<form name="update" method="post" action="ProductUpdate.jsp">
			<input type=hidden name=no>
			</form>
			
			<form name="del" method="post" action="ProductProc.jsp?flag=delete">
			<input type=hidden name=no>
			</form>

        
    </div>
</body>
</html>
