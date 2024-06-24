<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memberMain.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<script>
		'use strict'
		
		function fCheck() {
			let pwd = checkForm.pwd.value;
			if(pwd.trim() == "") {
				alert("비밀번호를 입력하세요");
				return false;
			}
			else checkForm.submit();
		}
	
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>memberMain.jsp</h2>
	<h4>회원 전용 방입니다.</h4>
	<hr/>
	
	<h4>비밀번호 암호화</h4>
	<div>
		<a href="${ctp}/pwdCheck?pwd=1234"> 비밀번호 암호화(1234)</a><br/>
		기존 비밀번호 : ${pwd}<br/>
		변경된 비밀번호 : ${encPwd}<br/>
	</div>
	<hr/>
	<c:if test="${!empty encPwd}">
		<form name="checkForm" method="post" action="${ctp}/pwdCheckOk">
			비밀번호를 입력하세요 <input type="text" name="pwd" class="form-control" />
			<input type="button" value="비밀번호 확인" onclick="fCheck()" class="btn btn-primary">
			<input type="hidden" name="encPwd" value="${encPwd}">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form>
	</c:if>
		<p>결과: <font color="red"><b>${pwdFlag}</b></font></p>
	<hr/>
	<form:form method="post" action="${ctp}/logout">
		<input type="submit" value="로그아웃" class="btn btn-success">
	</form:form>
	
	
	
	
</div>
<p><br/></p>
</body>
</html>