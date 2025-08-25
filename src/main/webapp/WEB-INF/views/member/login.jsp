<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols"/>
  <title>Music is MyLife : 로그인</title>
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
      justify-content: center;
      align-items: center;
      min-width: 100rem;     /* 1rem 은 html태그의 폰트사이즈임 // 10px => 1rem , 0.1rem => 1px */
      min-height: 70rem; }
    .main{ 
      display: flex;
      flex-direction: column; 
      justify-content: center;
      align-items: center;
      flex-wrap: wrap;
      border: 0.1rem solid orange; 
      width: 50rem; 
      height: 70rem; }
    .main > .head {      
      text-align: center;
      font-size: 5rem;
      color: #ff6600;
      height: 10rem; }
    .main > .box + div{
      display: flex;
      align-items: center;
      box-sizing: border-box;
      padding-bottom: 1rem;
      font-size: 1.2rem;
      color: #ff6600; 
      width: 80%;
      height: 3rem; }
    input {
      border-radius: 0.5rem;     
      border: 0.15rem solid #a6a6a6;
      outline: none;
      transition: 3s;
      padding-left: 1rem;
      width: 40rem;
      height: 5rem; }
    .box input:focus { border-color: #ff6600; }
    input[type="submit"] {         
      background-color: #ff6600;
      border: none;
      border-radius: 0.4rem;
      text-align: center;
      text-decoration: none;  
      font-size: 2rem;
      color: white;
      cursor: pointer;
      height: 5rem;
      width: 65%; }
  </style>
</head>
<body onload="doMsg()">
<form action="/member/loginAction" method="POST" onsubmit="return doSignUp();">
  <div class="main">
    <div class="head">Music is MyLife</div>
    <div class="box"><input type="text" name="member_id" placeholder="아이디" /></div><div></div>
    <div class="box"><input type="password" name="member_pw" placeholder="비밀번호" /></div><div></div>
    <div></div>
    <input type="submit" value="로그인" />
  </div>
</form>

<script>
/** init */
let doMsg = () => {
  let el, els = document.querySelectorAll('.box');
  
  // 아이디 입력시 메시지 삭제
  el = els[0].children[0];
  el.onkeyup = e => {
    let el = e.target;
    
    if( el.value.length !== 0 ) {
      let msg = e.target.parentElement.nextElementSibling;
      msg.innerText = '';
    }
  }

  // 패스워드 입력시 메시지 삭제
  el = els[1].children[0];
  el.onkeyup = e => {
    let el = e.target;
    
    if( el.value.length !== 0 ) {
      let msg = e.target.parentElement.nextElementSibling;
      msg.innerText = '';
    }
  }
} // end of ## init

/** 필수항목 체크 */
function doSignUp() {
  let el, els = document.querySelectorAll('.box');
  
  // 아이디 공백 체크
  el = els[0].children[0];  
  
  if( el.value.length == 0) {
    let msg = el.parentElement.nextElementSibling;
    msg.innerText = '아이디를 입력해주세요.'; return false; 
  } 

  // 패스워드 공백 체크
  el = els[1].children[0];  
  if( el.value.length == 0) {
    let msg = el.parentElement.nextElementSibling;
    msg.innerText = '비밀번호를 입력해주세요.'; return false; 
  }
  
  return true;
} // end of ## doSignUp
</script>
</body>
</html>