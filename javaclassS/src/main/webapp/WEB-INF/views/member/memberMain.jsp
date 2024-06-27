<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- <%@ include file = "/include/certification.jsp" %> --%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>memberMain.jsp</title>
  <!-- fullcalendar CDN -->
	<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
	<!-- fullcalendar 언어 CDN -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
  
  <%@ include file = "/WEB-INF/views/include/bs4.jsp" %>
  <script>
    'use strict';
    
    // 채팅내용을 DB에 저장하기
    function chatInput() {
    	let chat = $("#chat").val();
    	if(chat.trim() != "") {
    		$.ajax({
    			url  : "MemberChatInput.mem",
    			type : "post",
    			data : {chat : chat},
    			error: function() {
    				alert("전송오류!!");
    			}
    		});
    	}
    }
    
		// 채팅 대화입력후 엔터키를 누르면 자동으로 메세지 DB에 저장시키기....chatInput()함수 호출하기
		$(function(){
			$("#chat").on("keydown",function(e){
				if(e.keyCode == 13) chatInput();
			});
		});
		
		
		/* full calender */
 	
    (function(){
       $(function(){
         // calendar element 취득
         var calendarEl = $('#calendar')[0];
         // full-calendar 생성하기
         var calendar = new FullCalendar.Calendar(calendarEl, {
           height: '700px', // calendar 높이 설정
           expandRows: true, // 화면에 맞게 높이 재설정
           slotMinTime: '05:00', // Day 캘린더에서 시작 시간
           slotMaxTime: '24:00', // Day 캘린더에서 종료 시간
           // 해더에 표시할 툴바
           headerToolbar: {
             left: 'prev,next today',
             center: 'title',
             right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
           },
           initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
            // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
           navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
           editable: true, // 수정 가능?
           selectable: true, // 달력 일자 드래그 설정가능
           nowIndicator: true, // 현재 시간 마크
           dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
           locale: 'ko', // 한국어 설정
           eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트  
          	 console.log(obj);
           },
           eventChange: function(info) { // 이벤트가 수정되면 발생하는 이벤트
          		 var idx = info.event.extendedProps.idx; 
          	 		var title = info.event.title;
          	    var start = info.event.start;
          	    var end = info.event.end;
          	    var allDay = info.event.allDay;
          	    // 서버로 수정된 일정 정보를 전송
          	    $.ajax({
          	        type: "POST",
          	        url: "${ctp}/calendar/calendarUpdate", // 서버 측 스크립트의 URL
          	        data: {
          	        		idx : idx,
          	        		title: title,
          	            start: start,
          	            end: end,
          	            allDay: allDay
          	        },
          	        success: function(res) {
          	            if (res != "0") {
          	                alert("일정이 수정되었습니다.");
          	                location.reload();
          	            } else {
          	                alert("일정 수정 실패");
          	            }
          	        },
          	        error: function() {
          	            alert("연결오류~");
          	        }
          	    });
             console.log("수정");
           },
           eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
             console.log(obj);
           },
           select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
             var title = prompt('일정을 입력하세요:');
             if (title) {
               calendar.addEvent({
                 title: title,
                 start: arg.start,
                 end: arg.end,
                 allDay: arg.allDay
               });
               
               $.ajax({
                   type: "POST",
                   url: "${ctp}/calendar/calendarInput", // 서버 측 스크립트의 URL
                   data: {
                	   	title: title,
                	   	start: arg.start.toISOString(),  
                       end: arg.end.toISOString(),      
                       allDay: arg.allDay
                	   
                   },
                   success: function(res) {
                       if (res != "0" ){
                    	   alert("일정이 저장되었습니다");
                    	   location.reload();
                      } else  {
                    	  alert("일정 저장 실패");
                      }
                   },
                   error: function() {
                       alert("연결오류~");
                   }
               });
             }
             calendar.unselect();
           },
           // 이벤트 
           events: function(fetchInfo, successCallback, failureCallback) {
        	    $.ajax({
        	        url: "${ctp}/calendar/calendarListAll",
        	        type: "POST",
        	        dataType: "json",
        	        success: function(data) {
        	            data.forEach(function(vo) {
        	                calendar.addEvent({
        	                    idx: vo.idx, // 이벤트의 고유 ID
        	                    title: vo.title,
        	                    start: vo.startTime,
        	                    end: vo.endTime,
        	                    allDay: vo.allDay
        	                });
        	            });
        	            successCallback([]);
        	        },
        	        error: function() {
        	            failureCallback("연결 오류~");
        	        }
        	    });
        	},
           eventClick: function(info) {
             if (confirm('정말로 이 일정을 삭제하시겠습니까?')) {
               info.event.remove(); // 이벤트 삭제
               
            // 이벤트 속성 값 가져오기
               var title = info.event.title;
               // 한국 표준시(KST)로 변환
               var options = { timeZone: 'Asia/Seoul', year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit' };
               var start = new Date(info.event.start).toLocaleString('ko-KR', options).replace(/\. /g, '-').replace('.', '');
               var end = info.event.end ? new Date(info.event.end).toLocaleString('ko-KR', options).replace(/\. /g, '-').replace('.', '') : null;
               var allDay = info.event.allDay;
               
               $.ajax({
                   type: "POST",
                   url: "${ctp}/calendar/calendarDelete", // 서버 측 스크립트의 URL
                   data: {
                	   	title: title,
                       start: start,
                       end: end,
                       allDay: allDay
                   },
                   success: function(res) {
                       if (res != "0" ){
                    	   alert("일정이 삭제되었습니다.");
                    	 	location.reload();
                      } else  {
                    	  alert("일정 삭제 실패");
                      }
                   },
                   error: function() {
                       alert("연결오류~");
                   }
               });
               
             }
           }
         });
         // 캘린더 랜더링
         calendar.render();
        
       });
     })();	
</script>
		
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
  <h2>회원 전용방</h2>
  <!-- <hr/> -->
  <!-- 실시간 채팅방(DB) -->
  <div class="row">
    <div class="col" style="width:420px">
      <%-- 
	    <form name="chatForm">
	      <label for="chat"><b>실시간 대화방</b></label>
	      <iframe src="${ctp}/include/memberMessage.jsp" width="100%" height="200px" class="border"></iframe>
	      <div class="input-group mt-1">
	        <input type="text" name="chat" id="chat" class="form-control" placeholder="대화내용을 입력하세요" autofocus />
	        <div class="input-group-append">
	          <input type="button" value="글등록" onclick="chatInput()" class="btn btn-success"/>
	        </div>
	      </div>
	    </form>
	    --%>
	    <c:if test="${!empty sLogin}">
	    	현재 임시 비밀번호를 발급하여 메일로 전송처리 되어 있습니다.<br/>
	    	개인정보를 확인하시고, 비밀번호를 새로 변경해 주세요<br/>
	    </c:if>
	  </div>
	  <div class="col text-center">
	    <b>신규 메세지(<font color='red'><b>${wmCnt}</b></font>건)</b>
	    <span style="font-size:11px">...<a href="WebMessage.wm">more</a></span>
      <c:if test="${wmCnt != 0}">
		    <table class="table table-bordered table-hover text-center">
		      <tr class="table-dark text-dark">
		        <th>번호</th>
		        <th>아이디</th>
		        <th>보낸날짜</th>
		      </tr>
			    <c:forEach var="vo" items="${wmVos}" varStatus="st">
			      <c:if test="${st.count <= 3}">
				      <tr>
				        <td>${st.count}</td>
				        <td>${vo.sendId}</td>
				        <td>${fn:substring(vo.sendDate,0,16)}</td>
				      </tr>
			      </c:if>
			    </c:forEach>
			    <tr><td colspan="3" class="m-0 p-0"></td></tr>
		    </table>
      </c:if>
      <hr/>
      <div>
        오늘의 일정이 <font color='blue'><b><a href="ScheduleMenu.sc?ymd=${ymd}">${scheduleCnt}</a></b></font>건 있습니다.
      </div>
	  </div>
	</div>
  <hr/>
  <div class="row" id="visitCount">
    <div class="col">
	  	<p>현재 <b><font color="blue">${sNickName}</font>(<font color="red">${strLevel}</font>)</b> 님이 로그인 중이십니다.</p>
	  	<p>총 방문횟수 : <b>${mVo.visitCnt}</b> 회</p>
	  	<p>오늘 방문횟수 : <b>${mVo.todayCnt}</b> 회</p>
	  	<p>총 보유 포인트 : <b>${mVo.point}</b> 점</p>
  	</div>
    <div class="col">
      <p><img src="${ctp}/member/${mVo.photo}" width="200px"/></p>
  	</div>
  </div>
  <hr/>
  <div>
    <h5>활동내역</h5>
    <p>방명록에 올린글수 : <b>${guestCnt}</b> 건</p>  <!-- 방명록에 올린이가 '성명/아이디/닉네임'과 같은면 모두 같은 사람이 올린글로 간주한다. -->
    <p>게사판에 올린글수 : <b>${boardCnt}</b>건</p>
    <p>자료실에 올린글수 : <b>${pdsCnt}</b>건</p>
  </div>
  <div>
  	<div id='calendar-container'>
			<div id='calendar'>
			</div>
		</div>
  </div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>