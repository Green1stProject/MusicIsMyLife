<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/ico" href="/img/favicon.ico" />
<link rel="stylesheet"  href="/css/common.css" />
</head>
<body>
  <main>
  <!-- ///// 총 댓글 수 /////-->
  <div>댓글 ${ count.cnt }</div>
  <!--  ///// 댓글쓰기란 ///// -->
  <div>
    <form action="commentWrite" method="post">
      <input type="hidden" name="post_id" value="${ comment.post_id }" /> <!--  게시글 번호가져오기 -->
      <input type="hidden" name="member_id" value="${ login.member_id }" />
	    <textarea name="content" placeholder="댓글을 입력해주세요"></textarea>
	    <input type="submit" value="등록" />
    </form>
  </div>
  <!--  ///// 댓글 리스트 ///// -->
  <div>
    <c:forEach var="comment" items="${ comment }">
    <div>
      <span>${ comment.member_id }</span>
      <!--  로그인 아이디와 댓글작성자 아이디가 일치하면 수정/삭제 버튼을 보여준다 -->
      <c:if test="${ login.member_id == comment.member_id }">  
	      <span><a href="/comment/commentUpdateForm?comment_id=${ comment.comment_id}&post_id=${ comment.post_id }">수정</a></span>
	      <span><a href="/comment/commentDel?comment_id${ comment.comment_id}&post_id=${ comment.post_id }">삭제</a></span>
	    </c:if>
    </div>
    <div>${ comment.content }</div>
    </c:forEach>
  </div>
  </main>	
</body>
</html>
