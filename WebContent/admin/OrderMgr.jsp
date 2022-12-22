<%@page import="product.ProductBean"%>
<%@page import="product.OrderBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, product.*"%>
<jsp:useBean id="proMgr" class="product.ProductMgr" />
<jsp:useBean id="orderMgr" class="product.OrderMgr" />

<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Order List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="../css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="../css/etc.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="../css/orderMgr.css" />
    <script language="JavaScript" src="script.js"></script>
</head>
<body>
    <div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>

      

       <div id="pro_list" align="center">
          <table>
   <tr> 
   <td>

      <table>
      <tr bgcolor="#000000"> 
      <td align="center"><font color="#FFFFFF">주문번호</font></td>
      <td align="center"><font color="#FFFFFF">주문자</font></td>
      <td align="center"><font color="#FFFFFF">주문상품</font></td>
      <td align="center"><font color="#FFFFFF">주문수량</font></td>
      <td align="center"><font color="#FFFFFF">주문날짜</font></td>
      <td align="center"><font color="#FFFFFF">주문상태</font></td>
      <td>&nbsp;</td>
      </tr>
      <%
      Vector vResult = orderMgr.getOrderList();
      if(vResult.size() ==0){
      %>
      <tr> 
      <td align="center" colspan="7">주문 내역이 없습니다</td>
      </tr>
      <%}else{
         for(int i=0; i< vResult.size(); i++){
         OrderBean order = (OrderBean)vResult.get(i);
         ProductBean product = proMgr.getProduct(order.getProduct_no());
         
      %>
      <tr> 
      <td align="center"><%=order.getNo()%></td>
      <td align="center"><%=order.getId()%></td>
      <td align="center"><%=order.getProduct_no() %></td>
      <td align="center"><%=order.getQuantity()%></td>
      <td align="center"><%=order.getDate()%></td>
      <td align="center">
      <%
      switch(Integer.parseInt(order.getState())){
      case 1 : out.println("접수중");
      break;
      case 2 : out.println("접수");
      break;
      case 3 : out.println("입금확인");
      break;
      case 4 : out.println("배송준비");
      break;
      case 5 : out.println("배송중");
      break;
      default : out.println("완료");
      }%>
      </td>
      <td align="center"><a href="javascript:orderDetail('<%=order.getNo()%>')">상세보기</a></td>
      </tr>
      <%}
      }%>
      </table>
   
   </td>
   </tr>
   </table>
       </div>   
   
        <footer>
          <jsp:include page="bottom.jsp" flush="false" />
        </footer>
   <form name="detail" method="post" action="OrderDetail.jsp" >
   <input type="hidden" name="no">
   </form>        
    </div>
</body>
</html>