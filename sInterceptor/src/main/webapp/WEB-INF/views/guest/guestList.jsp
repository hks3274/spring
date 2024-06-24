<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>guestList.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script>
    'use strict';
    
    function guestDelete() {
    	let ans = confirm("삭제하시겠습니까?");
    	if(!ans) return false;
    	location.href = '${ctp}/guest/guestDelete';
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>방명록 리스트</h2>
  <div><font color="blue">${data}</font></div>
  <hr/>
  <div><img src="${ctp}/resources/images/1.jpg" width="350px" /></div>
  <hr/>
  <p>
    <a href="${ctp}/member/memberMain" class="btn btn-success">돌아가기</a>
  </p>
  <hr/>
    <a href="${ctp}/guest/guestInput" class="btn btn-primary">방명록글올리기</a>
    <a href="${ctp}/guest/guestUpdate" class="btn btn-warning">방명록수정하기</a>
    <a href="javascript:guestDelete()" class="btn btn-danger">방명록삭제하기</a>
  <hr/>
</div>
<p><br/></p>
</body>
</html>