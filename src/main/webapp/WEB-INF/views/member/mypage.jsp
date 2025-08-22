<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols"/>
  <title>Music is MyLife : 마이페이지</title>
  <style>
    * { margin : 0; padding:0;
     box-sizing : border-box; }
    html,body{
      width: 100%; height: 100%;
      margin: 0;
      padding: 0;
      overflow: hidden;
      font-size: 10px; /* 삭제하면 안됨 */
      font-family: 'Nanum Gothic', '맑은 고딕', Arial, sans-serif;
      color: #333;
      background-color: #f9f9f9; }
    body{
      display: flex;
      flex-direction: column; 
      justify-content: center;
      align-items: center;
      min-width: 100rem;     /* 1rem 은 html태그의 폰트사이즈임 // 10px => 1rem , 0.1rem => 1px */  
      min-height: 70rem; }
    /** === wrapper === **/  
    .wrap{ 
      width: 45rem; 
      height: 70rem; }
    /** === 항목 box === **/  
    .main{       
      display: flex;
      flex-direction: column; 
      justify-content: start;
      flex-wrap: wrap;
      overflow: hidden;
      border: 0.1rem solid #ff6600; 
      border-radius: 1rem; 
      box-shadow: 0.7rem 0.7rem 1rem #b3b3b3; 
      width: 45rem; 
      margin-bottom: 1rem; }
    .wrap > .main:nth-child(1){ 
      border: none;
      box-shadow: none;
      text-align: center; 
      font-size: 5rem;
      color: #ff6600; 
      height: 8rem; 
      margin-bottom: 1rem; } 
    .wrap > .main:nth-child(2) { height: 45rem; }
    .wrap > .main:nth-child(3) { height: 20rem; }    
    /** === main > title === **/
    .title{    
      background-color: #ff6600;
      font-size: 1.5rem; 
      color: white;      
      width: 100%; /* 중요: width 는 calc() 함수 사용: 부모요소 100%를 기준으로 padding left&right 만큼 뺀다 */
      height: 5rem;
      padding: 2rem 2rem 0; /* padding 을 줄때 반드시 좌우 균형을 잡을것 */
      margin-bottom: 3rem;
    }
    /** === main > box === **/  
    .box{
      font-size: 1rem;
      padding: 0 2rem;
      width: 100%;
      height: 6.8rem; }
    /** === inputStyle :: 폰트아이콘 + input 처리 === **/
    .inputWrap{
      display: flex;
      align-items: center; }
    .inputStyle{
      border: 0.1rem;
      background: transparent;
      outline: none;
      border-bottom: 0.1rem solid #a6a6a6;
      height: 3rem;
      width: 100%; 
      margin: 1rem; }
    .material-symbols { color: #a6a6a6; }
    /** === btn수정 === **/
    input[type="submit"], [type="button"]{
      background-color: #ff6600;
      border: none;
      border-radius: 0.4rem;
      text-align: center;
      text-decoration: none;  
      font-size: 1.5rem;
      color: white;
      cursor: pointer;
      margin: 0 5rem;
      width: 20%;
      height: 3rem; }
  </style>
</head>
<body>
  <div class="wrap">
    <div class="main">Music is MyLife</div>
    <!-- ///// 개인 정보 box ///// -->
    <div class="main">
      <div class="title">기본정보</div>
      <form action="/member/UpdateForm" method="post">
	      <div class="box inputWrap">
	        <span class="material-symbols">artist</span>
	        <input class="inputStyle" type=“text” name="member_id" value="${ member.member_id }" />
	      </div>
	      <div class="box inputWrap">
	        <span class="material-symbols">lock</span>
	        <input class="inputStyle" type=“text” name="member_pw" value="${ member.member_pw }"/>
	      </div>
	      <div class="box inputWrap">
	        <span class="material-symbols">account_circle</span>
	        <input class="inputStyle" type=“text” name="member_nickname" value="${ member.member_nickname }" />
	      </div>
	      <div class="box inputWrap">
	        <span class="material-symbols">mail</span>
	        <input class="inputStyle" type=“text” name="member_email" value="${ member.member_email }" />
	      </div>
      </form>
      <div class="box">
        <input type="submit" value="수정">
        <input type="button" value="취소" onclick="goHome()">
      </div> 
    </div>
    <!-- ///// 개인 컨텐트 box ///// -->
    <div class="main">
      <div class="title">내 컨텐츠</div> 
      <div class="box">임시</div>
    </div>  
  </div>
<script>
let goHome = () => location.href="/";
</script>
</body>
</html>