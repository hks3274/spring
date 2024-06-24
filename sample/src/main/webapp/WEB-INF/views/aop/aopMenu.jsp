<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>aopMenu.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>AOP 연습</h2>
  <hr/>
    <a href="${ctp}/aop/aopTest1" class="btn btn-success">연습1</a>
    <a href="${ctp}/aop/aopTest2" class="btn btn-primary">연습2</a>
    <a href="${ctp}/aop/aopTest3" class="btn btn-secondary">연습3</a>
    <a href="${ctp}/aop/aopTest4" class="btn btn-secondary">연습4</a>
    <a href="${ctp}/aop/aopTest5" class="btn btn-secondary">연습5</a>
  <hr/>
  <p>
    <a href="${ctp}/" class="btn btn-success">돌아가기</a>
  </p>
</div>
<p><br/></p>
</body>
</html>