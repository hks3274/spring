<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>multiFile.jsp</title>
  <jsp:include page="/WEB-INF/views/include/bs4.jsp" />
  <script>
  	'use strict';
  	
		function fCheck() {
			let fName = document.getElementById("fName").value;
    	let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
    	let maxSize = 1024 * 1024 * 20;	// 한번에 업로드 최대용량은 20MByte
    	
    	if(fName.trim() == "") {
    		alert("업로드할 파일을 선택하세요");
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
  <h2>멀티파일 업로드 연습</h2>
  <form name="myform" method="post" enctype="multipart/form-data">
    <p>올린이 :
      <input type="text" name="mid" value="${sMid}"/>
    </p>
    <p>파일명 :
      <input type="file" name="fName" id="fName" class="form-control-file border" accept=".jpg,.gif,.png,.zip,.ppt,.pptx,.hwp"/>
    </p>
    <p>
     <input type="button" value="파일업로드" onclick="fCheck()" class="btn btn-success"/>
      <input type="reset" value="다시선택" class="btn btn-warning"/>
      <input type="button" value="싱글파일업로드로이동" onclick="location.href='${ctp}/study/fileUpload/fileUpload';" class="btn btn-primary"/>
    </p>
  </form>
  <hr/>
  <div id="downLoadFile">
  	<h3>서버에 저장된 파일정보(총 : ${fileCount}건)</h3>
  	<div class="row">
  		<div class="col">저장경로 : ${ctp}/resources/data/fileUpload/*.*</div>
 			<div class="col"> </div>
 			<!-- 파일삭제 -->
 			<input type = "button" value="폴더 내 모든파일 삭제" onclick="fileDeleteAll()" class="btn btn-danger mr-5 mb-3"/> 	
  	</div>
  	<table class="table table-hover text-center">
  		<tr class="table-secondary">
  			<th>번호</th>
  			<th>파일명</th>
  			<th>파일형식</th>
  			<th>비고</th>
			</tr>
			<c:forEach var="file" items="${files}" varStatus="st"> 
				<tr>
					<td>${st.count}</td>
					<td>${file}</td>					
					<td>
						<c:set var="fNameArray" value="${fn:split(file, '.')}" /> 
						<c:set var="extName" value="${fn:toLowerCase(fNameArray[fn:length(fNameArray)-1])}"/>
						<c:if test="${extName == 'zip'}" >압축 파일</c:if>
						<c:if test="${extName == 'ppt' || exeName == 'pptx'}" >파워포인트 파일</c:if>
						<c:if test="${extName == 'hwp'}" >한글 파일</c:if>
						<c:if test="${extName == 'jpg' || extName == 'png' || extName == 'gif'}" >
							<img src="${ctp}/fileUpload/${file}" width="150px">
						</c:if>
					</td>
					<td>
						<input type="button" value="삭제" onclick="fileDelete('${file}')" class="btn btn-danger btn-sm">
						<input type="button" value="수정" onclick="fileUpdate('${file}')" class="btn btn-warning btn-sm">
					</td>
				</tr>
			</c:forEach>
  	</table>  	
  </div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>