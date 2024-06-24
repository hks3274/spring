<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>atom.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>이곳은 atom.jsp입니다.</h2>
	<p>전송 값 : ${data}</p>
	<img src="<%=request.getContextPath()%>/resources/6.jpg"/>
	<hr/>
	<a href="<%=request.getContextPath()%>/index">index.jsp로 이동</a>
</div>
<p><br/></p>
</body>
</html>