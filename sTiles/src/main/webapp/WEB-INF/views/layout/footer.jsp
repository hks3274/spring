<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>footer.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
    body {
      margin: 0px;
      padding: 0px;
    }
  </style>
</head>
<body>
<div class="text-center pt-4" style="background-color:skyblue; height:100px">
  <h3>이곳은 footer.jsp 영역입니다.-${sMid}-</h3>
</div>
</body>
</html>