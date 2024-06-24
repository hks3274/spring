<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>baseLayout.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <style>
    .bodyLeft {
      float: left;
      width: 15%;
    }
    .bodyCenter {
      float: left;
      width: 70%;
    }
    .bodyRight {
      float: left;
      width: 15%;
    }
    .footer {
      clear: both;
    }
  </style>
</head>
<body>
<tiles:insertAttribute name="header" />
<tiles:insertAttribute name="nav" />
<div class="container text-center" style="height:500px">
  <div class="bodyLeft">
    <tiles:insertAttribute name="aside" />
  </div>
  <div class="bodyCenter">
	  <tiles:insertAttribute name="body" />
	</div>
  <div class="bodyRight">
    <tiles:insertAttribute name="asideRight" />
  </div>
</div>
<div class="footer">
  <tiles:insertAttribute name="footer" />
</div>
</body>
</html>