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
    <link rel="stylesheet" type="text/css" media="screen" href="../css/proMgr.css" />
    <script language="JavaScript" src="script.js"></script>
</head>
<body>
    <div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>

		

       <div id="pro_list" align="center">
       
        <table id ="list" align="center">
			<tr>
			<td colspan="7" align="right">
			<a id="upBtn" href="ProductInsert.jsp" >&nbsp;상품 업데이트&nbsp;</a><br><br></td>
			</tr>        
		<tr> 
		<td align="center">
 
			<table align="center">
			<tr>
			<td align="center"><b>상품</b></td>
			<td align="center"><b>이름</b></td>
			<td align="center"><b>가격</b></td>
			<td align="center"><b>날짜</b></td>
			<td align="center"><b>재고</b></td>
			<td align="center"><b>카테고리</b></td>
			<td align="center"><b>분류</b></td>
			<td align="center">&nbsp;</font></td>
			</tr>
			<%
			Vector vResult= proMgr.getProductList();
			if(vResult.size() ==0){
			%>
			<tr> 
			<td align="center" colspan="7">등록된 상품이 없습니다.</td>
			</tr>
			<%}else{
				for(int i=0; i<vResult.size(); i++){
				ProductBean product = (ProductBean)vResult.get(i);
			%>
			<tr> 
			<td align="center"><img src="../data/<%=product.getImage()%>" height="150" width="150"></td>
			<td align="center"><%=product.getName()%></td>
			<td align="center"><%=product.getPrice()%></td>
			<td align="center"><%=product.getDate()%></td>
			<td align="center"><%=product.getStock()%></td>
			<td align="center"><%=product.getGender()%></td>
			<td align="center"><%=product.getKind()%></td>
			<td align="center"><a href="javascript:productDetail('<%=product.getNo()%>')">상세보기</a></td>
			</tr>
			<%}
			}%>

			</table>
		
	</td>
	</tr>
	</table>
	
	<form name="detail" method="post" action="ProductDetail.jsp" >
	<input type="hidden" name="no">
	</form>

       </div>   
    
	
	
        <footer>
          <jsp:include page="bottom.jsp" flush="false" />
        </footer>
    </div>
</body>
</html>
