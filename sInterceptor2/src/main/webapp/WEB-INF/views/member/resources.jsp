<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>resources.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>resources 연습</h2>
		<div>1.<img src="/resources/data/member/1.jpg" width="150px;"></div>
		<div>2.<img src="1.jpg" width="150px;"></div>
		<div>3.<img src="${ctp}/resources/data/member/1.jpg" width="150px;"></div>
		<div>4.<img src="${ctp}/resources/data/pds/2.jpg" width="150px;"></div>
		<div>5.<img src="${ctp}/resources/data/photo/3.jpg" width="150px;"></div>
		<div>6.<img src="${ctp}/resources/data/shop/basic/4.jpg" width="150px;"></div>
		<div>7.<img src="${ctp}/resources/data/shop/transaction/5.jpg" width="150px;"></div>
	<hr/>
		<div>8.<img src="${ctp}/member/1.jpg" width="150px;"></div>
		<div>9.<img src="${ctp}/pds/2.jpg" width="150px;"></div>
		<div>10.<img src="${ctp}/photo/3.jpg" width="150px;"></div>
		<div>11.<img src="${ctp}/basic/4.jpg" width="150px;"></div>
		<div>12.<img src="${ctp}/transaction/5.jpg" width="150px;"></div>
</div>
<p><br/></p>
</body>
</html>