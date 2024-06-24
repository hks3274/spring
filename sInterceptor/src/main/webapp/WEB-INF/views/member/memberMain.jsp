<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberMain.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>회원 메인 Main</h2>
  <div><font color="blue">${data} /</font> <font color="red"> ${strLevel}</font></div>
  <hr/>
  <div><img src="${ctp}/resources/images/2.jpg" width="350px" /></div>
  <hr/>
  <p>
    <a href="${ctp}/member/logout" class="btn btn-success">로그아웃</a>
  </p>
  <hr/>
		<a href="${ctp}/board/boardList" class="btn btn-success">게시판</a>  
		<a href="${ctp}/pds/pdsList" class="btn btn-primary">자료실</a>  
		<a href="${ctp}/guest/guestList" class="btn btn-info">방명록</a>  
  <hr/>
</div>
<p><br/></p>
</body>
</html>