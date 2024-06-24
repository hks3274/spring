<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>pdsList.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script>
    'use strict';
    
    function pdsDelete() {
    	let ans = confirm("삭제하시겠습니까?");
    	if(!ans) return false;
    	location.href = '${ctp}/pds/pdsDelete';
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>자료실 리스트</h2>
  <div><font color="blue">${data}</font></div>
  <hr/>
  <div><img src="${ctp}/resources/images/1.jpg" width="350px" /></div>
  <hr/>
  <p>
    <a href="${ctp}/member/memberMain" class="btn btn-success">돌아가기</a>
  </p>
  <hr/>
    <a href="pdsInput" class="btn btn-primary">자료실글올리기</a>
    <a href="pdsUpdate" class="btn btn-warning">자료실수정하기</a>
    <a href="javascript:pdsDelete()" class="btn btn-danger">자료실삭제하기</a>
    <a href="pdsDownload" class="btn btn-info">자료다운로드하기</a>
  <hr/>
</div>
<p><br/></p>
</body>
</html>