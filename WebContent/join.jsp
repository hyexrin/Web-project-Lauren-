<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Us</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/join.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/etc.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/content.css" />
     <script language="JavaScript" src="script.js"></script>
</head>
<body>
<div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>

        <article class="emp"></article>

        <article id="side1"></article>

		<article id="form">
		
		<div id="join" align="center">
		<H2 id="title"> JOIN US</H2>
		<br>
		<form name=form1 method=post action=joinOk.jsp>
		<input type=hidden name="action" value="insert">
		<table>
		  <tr>
		    <th>이 름</th>	
		    <td><input type="text" name="mem_name" maxlength="15"></td>
		  </tr>
		  <tr>
		    <th>email</th>
		    <td><input type="email" name="mem_email" maxlength="50"></td>
		  </tr>
		  <tr>
		    <th>전화번호</th>
		    <td><input type="text" name="mem_tel" maxlength="20"></td>
		  </tr>
		  <tr>
		    <th>생 일</th>
		    <td><input type="date" name="mem_birth"></td>
		  </tr>  
		  <tr>
		    <th>회 사</th>
		    <td><input type="text" name="mem_comdept" maxlength="20"></td>
		  </tr>
		  <tr>
		    <th>메 모</th>
		    <td><input type="text" name="mem_memo"></td>
		  </tr>
		  <tr>
		    <th>아이디</th>
		    <td><input type="text" name="mem_id"><br>
		    &nbsp;
		    <input id="check" type="button" value="ID중복확인" onClick="idCheck(this.form.mem_id.value)">
		    </td>
		    
		  </tr>
		  <tr>
		    <th>비밀번호</th>
		    <td><input type="text" name="mem_password"></td>
		  </tr>
		  <tr>
		    <td colspan=2 align=center><input type=submit value="JOIN"><input type=reset value="CANCLE"></td>
		</tr>
		</table>
		</form>
		
		</div>
		</article>
        <article id="side2"></article>


        <footer>
          <jsp:include page="bottom.jsp" flush="false" />
        </footer>
    </div>
</body>
</html>