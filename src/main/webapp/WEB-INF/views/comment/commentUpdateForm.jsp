<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <form action="/comment/commentUpdate" action="post">
      <input type="hidden" name="post_id" value="${ comment.post_id }" /> <!--  게시글 번호가져오기 -->
      <input type="hidden" name="member_id" value="${ login.member_id }" />
	    <div>
	      <textarea name="content">${ comment.content }</textarea>
	    </div>
	    <div>
	       <input type="submit" value="확인">
	       <input type="button" value="취소">
	    </div>
    </form>
  </main>	
</body>
</html>