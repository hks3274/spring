<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>pdsInput.jsp</title>
  <%@ include file = "/WEB-INF/views/include/bs4.jsp" %>
  <script>
    'use strict';
    
    function fCheck() {
			let fName = document.getElementById("fName").value;
			let title = document.getElementById("title").value;
			let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
			let maxSize = 1024 * 1024 * 20;	// 한번에 업로드 최대용량은 20MByte
			
			if(fName.trim() == "") {
				alert("업로드할 파일을 선택하세요");
				return false;
			}
			if(title.trim() == "") {
				alert("제목을 입력하세요");
				return false;
			}
			
			let fileSize = document.getElementById("fName").files[0].size;
			if(fileSize > maxSize) {
				alert("업로드할 파일의 최대용량은 20MByte입니다.");
			}
			else if(ext != "jpg" && ext != "gif" && ext != "png" && ext != "zip" && ext != "ppt" && ext != "pptx" && ext != "hwp") {
				alert("업로드 가능한 파일은 'jpg/gif/png/zip/ppt/pptx/hwp'파일 입니다.");
			}
			else {
				myform.submit();
			}
				
		}
    
    
  </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
  <form name="myform" method="post" class="was-validated" enctype="multipart/form-data">
    <h2 class="text-center">자 료 올 리 기</h2>
    <br/>
		<div>
    	<input type="file" name="file" id=fName class="form-control-file border mb-2" multiple/>
    </div>
    <div id="fileBox"></div>
    <div class="mb-2">
      올린이 : ${sNickName}
    </div>
    <div class="mb-2">
      제목 : <input type="text" name="title" id="title" placeholder="자료의 제목을 입력하세요" class="form-control" required />
    </div>
    <div class="mb-2">
      내용 : <textarea rows="4" name="content" id="content" placeholder="자료의 상세내역을 입력하세요" class="form-control"></textarea>
    </div>
    <div class="mb-2">
      분류 :
			<select name="part" id="part" class="form-control">
        <option ${part=="학습" ? "selected" : ""}>학습</option>
        <option ${part=="여행" ? "selected" : ""}>여행</option>
        <option ${part=="음식" ? "selected" : ""}>음식</option>
        <option ${part=="기타" ? "selected" : ""}>기타</option>
      </select>
    </div>
    <div class="mb-2">
      공개여부 :
      <input type="radio" name="openSw" value="공개" onclick="pwdCheck1()" checked/>공개 &nbsp; &nbsp;
      <input type="radio" name="openSw" value="비공개" onclick="pwdCheck2()"/>비공개
      <div id="pwdDemo" style="display:none"><input type="password" name="pwd" id="pwd" value="1234" /></div>
    </div>
    <div>
      <input type="button" value="자료올리기" onclick="fCheck()" class="btn btn-success"/>
      <input type="reset" value="다시쓰기" class="btn btn-warning"/>
      <input type="button" value="돌아가기" onclick="location.href='PdsList.pds?part=${part}';" class="btn btn-info"/>
    </div>
    <input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}" />
    <input type="hidden" name="mid" value="${sMid}" />
    <input type="hidden" name="nickName" value="${sNickName}" />
    <input type="hidden" name="fSize" value="0"/>
  </form>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>