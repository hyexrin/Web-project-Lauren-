<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, product.*"%>
<jsp:useBean id="proMgr" class="product.ProductMgr" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Lauren Main</title>
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

	   
       <div id ="main" align="center">
        	<%ProductBean product= proMgr.getProduct(request.getParameter("no"));%>

		<table width="75%" align="center">
		<tr> 
		<td align="center">

			<form method="post" action="ProductProc.jsp?flag=update" enctype="multipart/form-data">
			<table width="95%" align="center">
			<tr> 
			<td colspan="2" align="center"><h2>상품등록</h2><br></td>
			</tr>
			<tr> 
			<td width="31%" align="center">상품이름</td>
			<td width="69%" align="left"> 
			<input type="text" name="name" value="<%=product.getName()%>">
			</td>
			</tr>
			<tr> 
			<td height="21" align="center">상품가격</td>
			<td align="left"> 
			<input type="text" name="price" size="20" value="<%=product.getPrice()%>">원</td>
			</tr>
			<tr> 
			<td align="center">상품내용</td>
			<td><textarea rows="10" cols="60" name="detail"><%=product.getDetail()%></textarea>
			</td>
			</tr>
			<tr> 
			<td align="center">상품입고수량</td>
			<td align="left"> 
			<input type="text" name="stock" size="10" value="<%=product.getStock()%>">개</td>
			</tr>
			<tr> 
			<td align="center">카테고리</td>
			<td align="left"> 
			<select name='gender'>
			  <option value='null' selected>-- 선택 --</option>
			  <option value='men'>남자</option>
			  <option value='women'>여자</option>
			  <option value='acc'>악세사리</option>
			</select></td>
			</tr>
			<tr> 
			<td align="center">분류</td>
			<td align="left"> 
			<select name='kind'>
			  <option value='null' selected>-- 선택 --</option>
			  <option value='top'>상의</option>
			  <option value='bottom'>하의</option>
			  <option value='etc'>기타</option>
			</select></td>
			</tr>			
			<tr> 
			<td align="center">상품이미지</td>
			<td align="left"><img src="../data/<%=product.getImage()%>" width="200px" height="300px">
			<input type="file" name="image"></td>
			</tr>
			<tr> 
			<td align="center">상세이미지1</td>
			<td align="left"><img src="../data/<%=product.getSub1()%>" width="200px" height="300px">
			<input type="file" name="sub1"></td>
			</tr>
			<tr> 
			<td align="center">상세이미지2</td>
			<td align="left"><img src="../data/<%=product.getSub2()%>" width="200px" height="300px">
			<input type="file" name="sub2"></td>
			</tr>
			<tr> 
			<td align="center">상세이미지3</td>
			<td align="left"><img src="../data/<%=product.getSub3()%>" width="200px" height="300px">
			<input type="file" name="sub3"></td>
			</tr>
			<tr> 
			<td colspan="2" align="center"> 
			<input type="submit" value="제품수정">&nbsp;&nbsp;&nbsp;
			<input type="reset" value="다시쓰기">
			</td>
			</tr>
			</table>
			
			<input type=hidden name="no" value="<%=product.getNo()%>">
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
