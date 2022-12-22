<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Lauren Main</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/etc.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/content.css" />
    <script src="main.js"></script>
</head>
<body>
    <div id="wrap">
        <header>
          <jsp:include page="top.jsp" flush="false" />
        </header>

       <div id ="main">
        <jsp:include page="main.jsp" flush="false" />
       </div>

        <footer>
          <jsp:include page="bottom.jsp" flush="false" />
        </footer>
    </div>
</body>
</html>
