<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 넘어가기</title>

<link rel="icon" type="image/ico" href="/img/favicon.ico" />
<link rel="stylesheet"  href="/css/common.css" /> 

</head>
<body>
  <main>
   <form method="POST">
	   <input type="hidden" name="member_id" value="${ login.member_id }">
	   <input type="hidden" name="member_pw" value="${ login.member_pw }">
	   <input type="button" value="내 정보 보기" onclick="go()">
   </form>
   <hr>
   내 아이디: ${ login.member_id }
   내 비번: ${ login.member_pw }
  </main>
   <script>
   function go(){
	   location.href="/member/mypage";
   }
   </script>
</body>
</html>