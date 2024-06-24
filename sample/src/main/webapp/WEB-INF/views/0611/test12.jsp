<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test12.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>PathVariable 방식으로의 값 전달</h2>
  <p>
    아이디 : ${mid}<br/>
    비밀번호 : ${pwd}<br/>
  </p>
  <hr/>
  <a href="${ctp}/0611/index" class="btn btn-success">돌아가기</a>
</div>
<p><br/></p>
</body>
</html>