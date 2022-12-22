<%@page import="product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, product.*"%>
<!DOCTYPE html>

<jsp:useBean id="proMgr" class="product.ProductMgr" />
<jsp:useBean id="orderMgr" class="product.OrderMgr" />

<%
OrderBean order = orderMgr.getOrderDetail(request.getParameter("no"));
ProductBean product = proMgr.getProduct(order.getProduct_no());
%>

<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Lauren Admin Main</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="../css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="../css/etc.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="../css/proMgr.css" />
    <script language="JavaScript" src="script.js"></script>
</head>
<body>
    <div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>

       <div id="pro_list" align="center">
<table width="75%" align="center">
	<tr> 
	<td align="center">

		<form method=post name="order" action="OrderProc.jsp">
		<table width="95%" align="center">
		<tr bgcolor="black"> 
		<td colspan="2" align="center"><font color="#FFFFFF">주문 상세내역</font></td>
		</tr>
		<tr> 
		<td align="center">고객아이디</td>
		<td align="center"><%=order.getId()%></td>
		</tr>
		<tr> 
		<td align="center">주문번호</td>
		<td align="center"><%=order.getNo()%></td>
		</tr>
		<tr> 
		<td align="center">제품번호</td>
		<td align="center"><%=product.getNo()%></td>
		</tr>				
		<tr> 
		<td align="center">제품이름</td>
		<td align="center"><%=product.getName()%></td>
		</tr>
		<tr> 
		<td align="center">제품가격</td>
		<td align="center"><%=product.getPrice()%>원</td>
		</tr>
		<tr> 
		<td align="center">주문수량</td>
		<td align="center"><%=order.getQuantity()+""%>개</td>
		</tr>
		<tr> 
		<td align="center">재고수량</td>
		<td align="center"><%=product.getStock()%>개</td>
		</tr>		
		<tr> 
		<td align="center">주문날짜</td>
		<td align="center"><%=order.getDate()%></td>
		</tr>
		<tr> 
		<td align="center">금액</td>
		<td align="center"><%=order.getQuantity()*Integer.parseInt(product.getPrice())%>원</td>
		</tr>
		<tr> 
		<td align="center">주문상태</td>
		<td align="center">
		<select name="state">
		<option value="1">접수중</option>
		<option value="2">접수</option>
		<option value="3">입금확인</option>
		<option value="4">배송준비</option>
		<option value="5">배송중</option>
		<option value="6">완료</option>
		</select>
		<script>document.order.state.value=<%=order.getState()%></script>
		</td>
		</tr>
		<tr> 
		<td colspan="2" align="center">
		<input class="btn" type="botton" style="text-align: center" value="수정" onclick="javascript:orderUpdate(this.form)"> &nbsp;  
		<input class="btn" type="botton" style="text-align: center" value="삭제" onclick="javascript:orderDelete(this.form)">
		</td>
		</tr>
		</table>
		<input type="hidden" name="no" value="<%=order.getNo()%>">
		<input type="hidden" name="flag">
		</form>		
			
	</td>
	</tr>
	</table>
       </div>   
    
	
        <footer>
          <jsp:include page="bottom.jsp" flush="false" />
        </footer>        
        
    </div>
</body>
</html>
