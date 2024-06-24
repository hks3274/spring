<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%-- <%@ page session="false" %> --%>
<html>
<head>
	<title>Home</title>
	<script>
	  'use strict';
	  
	  if('${msg}' != null && '${msg}' != '') alert("${msg}");
	</script>
</head>
<body>
	<h1>
		Hello world!  
	</h1>
	
	<P>  The time on the server is ${serverTime}. </P>
	<hr/>
	<p>
	  <a href="${ctp}/0611/index">index.jsp</a> |
	  <a href="${ctp}/logTest">로그연습</a> |
	  <a href="${ctp}/aop/aopMenu">AOP연습</a> |
	</p>
</body>
</html>
