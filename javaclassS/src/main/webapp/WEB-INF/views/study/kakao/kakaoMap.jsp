<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>kakaoMap.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
	<div id="map" style="width:100%;height:500px;"></div>
	
	<!--카카오맵 Javascript API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c91a3e0bd9ff7e7021b35c38ed8c2290"></script>
	<script>
		//1. 지도를 띄어주는 기본 코드(지도생성)
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(36.63511532570117, 127.4595128623183),
			level: 5 //지도의 확대 축소 레벨
		};

		var map = new kakao.maps.Map(container, options);
	</script>
	
	<hr/>
	<jsp:include page="kakaoMenu.jsp" />
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>