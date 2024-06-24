<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<div class="w3-top">
  <div class="w3-bar w3-black w3-card">
    <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
    <%-- <a href="${ctp}/" class="w3-bar-item w3-button w3-padding-large">HOME</a> --%>
    <a href="http://192.168.50.51:9090/javaclassS/" class="w3-bar-item w3-button w3-padding-large">HOME</a>
    <a href="${ctp}/guest/guestList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Guest</a>
    <a href="${ctp}/board/boardtList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Board</a>
    <a href="${ctp}/pds/pdsList" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Pds</a>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">Study1 <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="${ctp}/user/userList" class="w3-bar-item w3-button">UserList</a>
        <a href="${ctp}/dbtest/dbtestList" class="w3-bar-item w3-button">DB Test</a>
        <a href="${ctp}/study/ajax/ajaxForm" class="w3-bar-item w3-button">Ajax Test</a>
        <a href="${ctp}/study/restapi/restapi" class="w3-bar-item w3-button">REST API</a>
        <a href="${ctp}/password/password" class="w3-bar-item w3-button">암호화</a>
        <a href="${ctp}/study/mail/mailForm" class="w3-bar-item w3-button">메일연습</a>
        <a href="${ctp}/study/fileUpload/fileUpload" class="w3-bar-item w3-button">파일업로드</a>
      </div>
    </div>
    <div class="w3-dropdown-hover w3-hide-small">
      <button class="w3-padding-large w3-button" title="More">Mypage <i class="fa fa-caret-down"></i></button>     
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <a href="${ctp}/" class="w3-bar-item w3-button">일정관리</a>
        <a href="${ctp}/" class="w3-bar-item w3-button">Photo Gallery</a>
        <a href="${ctp}/member/memberList" class="w3-bar-item w3-button">회원리스트</a>
        <a href="${ctp}/member/memberPwdCheck/p" class="w3-bar-item w3-button">비밀번호 변경</a>
        <a href="${ctp}/member/memberPwdCheck/i" class="w3-bar-item w3-button">회원정보수정</a>
        <a href="${ctp}/" class="w3-bar-item w3-button">회원탈퇴</a>
        <c:if test="${sLevel == 0}"><a href="${ctp}/" class="w3-bar-item w3-button">관리자메뉴</a></c:if>
      </div>
    </div>
    <c:if test="${empty sLevel}">
    <a href="${ctp}/member/memberLogin" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Login</a>
    <a href="${ctp}/member/memberJoin" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Join</a>
    </c:if>
    <c:if test="${!empty sLevel}">
    <a href="${ctp}/member/memberLogout" class="w3-bar-item w3-button w3-padding-large w3-hide-small">Logout</a>
    <a href="javascript:void(0)" class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i class="fa fa-search"></i></a>
  	</c:if>
  </div>
</div>

<!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
<div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
  <a href="${ctp}/guest/guestList" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">Guest</a>
  <a href="${ctp}/board/boardList" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">Board</a>
  <a href="${ctp}/pds/pdsList" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">Pds</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">Study1</a>
</div>