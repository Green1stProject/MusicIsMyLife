<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8" />
<style>
  #profileBox {
    display: flex;
    flex-direction: column;
    text-align: center;
    justify-content: center;
    border: 2px solid black;
    width: 230px;
    height: 180px;
    border-radius: 5%;
  }
  .linkBTN a {
    width: 100px;
    height: 30px;
    font-size: 13px;
    line-height: 50%;
  }

  .login {
    display: none;
  }
  .logout {
    display: block;
  }

</style>

<div id="profileBox">
  <c:if test="${ login.member_id != null }">
	  <div>${ login.member_nickname } 님,</div>
	  <div>반갑습니다.</div>
  </c:if>
  <c:if test="${ login.member_id != null }">
	  <div class="linkBTN logout">
	    <a href="/member/mypage?member_id=${ login.member_id }">마이페이지</a>
	  </div>
  </c:if>
  <c:if test="${ login.member_id == null }">
    <div class="linkBTN logout"><a href="/member/login">로그인</a></div>
    <div class="linkBTN logout"><a href="/member/register">회원가입</a></div>
  </c:if>
  <c:if test="${ login.member_id != null }">
    <div class="linkBTN logout"><a href="/member/logout">로그아웃</a></div>
  </c:if>
</div>

<script></script>
