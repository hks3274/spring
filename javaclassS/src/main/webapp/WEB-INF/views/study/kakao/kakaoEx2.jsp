<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>kakaoEx2.jsp(MyDB에 저장된 지명검색)</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script>
  
	  function addressSearch() {
	  	let address = myform.address.value;
	  	
	  	if(address == "") {
	  		alert("검색할 지점을 선택하세요");
	  		return false;
	  	}
	  	
	  	myform.submit();
	  }
	  
	  function addressDelete() {
			let address = myform.address.value;
			
			if(address == "") {
		  		alert("삭제할 지점을 선택하세요");
		  		return false;
		  	}
			let ans = confirm("검색할 지점명은 myDB에서 삭제하시겠습니까?");
			
			if(ans){
				$.ajax({
		    		url  : "${ctp}/study/kakao/kakaoAddressDelete",
		    		type : "post",
		    		data : { address : address },
		    		success:function(res) {
		    			if(res != "0") alert("선택한 지점이 MyDB에서 삭제되었습니다.");
		    			else alert("삭제 실패");
		    			location.href="${ctp}/study/kakao/kakaoEx2";
		    		},
		    		error : function() {
		    			alert("전송오류!");
		    		}
		    	});
				
			}
			
		}
	  
  </script>
  
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
	<h2>카카오DB에 저장된 키워드검색후 MyDB에 저장하기</h2>
	<form name="myform" >
	  <input type="text" name="address" id="address" autofocus required />
	  <input type="submit" value="키워드검색"/>
	  <input type="button" value="" onclick="addressDelete()" />
	</form>
	<hr/>
	<div id="map" style="width:100%;height:500px;"></div>
	
	<!-- 카카오맵 Javascript API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c91a3e0bd9ff7e7021b35c38ed8c2290"></script>
	<script>
		//var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		var container = document.getElementById('map');
		
    mapOption = {
        center: new kakao.maps.LatLng(36.63511532570117, 127.4595128623183), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(container, mapOption); 
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(); 

		// 키워드로 장소를 검색합니다
		ps.keywordSearch('이태원 맛집', placesSearchCB); 

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
		    
		    // 마커를 생성하고 지도에 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: new kakao.maps.LatLng(place.y, place.x) 
		    });

		    // 마커에 클릭이벤트를 등록합니다
		    kakao.maps.event.addListener(marker, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		        infowindow.open(map, marker);
		    });
		}
	</script>
	<hr/>
	<jsp:include page="kakaoMenu.jsp" />
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>