<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols"/>
  <title>Music is MyLife : 회원가입</title>
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
    .main > .box + div{
      display: flex;
      align-items: center;
      box-sizing: border-box;
      padding-bottom: 1rem;
      font-size: 1.2rem;
      color: #ff6600;
      width: 80%;
      height: 3rem; }
    .main > .head {
      color: #ff6600;
      text-align: center;
      font-size: 5rem;
      height: 10rem; }
    input {
      border-radius: 0.5rem;
      outline: none;
      border: 0.15rem solid #a6a6a6;
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
<body onload="init()">
  <form action="/member/insert" method="POST" onsubmit="return doSignUp();">
    <div class="main">
      <div class="head">Music is MyLife</div>
      <div class="box"><input name="member_id" placeholder="아이디" /></div><div></div>
      <div class="box"><input name="member_pw" placeholder="비밀번호" /></div><div></div>
      <div class="box"><input name="member_repwd" placeholder="비밀번호 확인" /></div><div></div>
      <div class="box"><input name="member_nickname" placeholder="닉네임" /></div><div></div>
      <div class="box"><input name="member_email" placeholder="이메일" /></div><div></div>
      <input type="submit" value="회원가입" />
    </div>
  </form>

  <script>
     /** init */
    let init = () => {
      let el, els = document.querySelectorAll('.box');
      
      // 아이디 유효성 체크
      el = els[0].children[0];
      el.onkeyup = e => {
        let el = e.target;
        
        if( el.value.length !== 0 ) {
          let msg = e.target.parentElement.nextElementSibling;

          if( onlyNumberAndEng(el.value) === false ) msg.innerText = '아이디: 영문 또는 숫자만 가능합니다.';
          else if( idLength(el.value) === false ) msg.innerText = '아이디: 5~20자의 글자여야 합니다.';
          else if (( onlyNumberAndEng(el.value) || idLength(el.value) )){
            msg.innerText = '사용가능한 아이디 입니다.';
            //verifyUserId(el.value);
          }
        } 
      }
      
      // 비밀번호 유효성 체크
      el = els[1].children[0]; 
      el.onkeyup = e => {
        let el = e.target;

        if( el.value.length !== 0 ) {
          let msg = e.target.parentElement.nextElementSibling;

          if( checkPassword(el.value) === false ) msg.innerText = '비밀번호: 8글자 이상의 영문, 숫자, 특수문자 조합으로 사용하세요.';
          else msg.innerText = '';
        } 
      }

      el = els[2].children[0]; 
      el.onkeyup = e => {
        let el = e.target;

        if( el.value.length !== 0 ) {
          let msg = e.target.parentElement.nextElementSibling;

          if( isMatch(els[1].children[0].value, el.value) === false ) msg.innerText = '비밀번호 확인: 비밀번호와 일치하지 않습니다.';
          else msg.innerText = '';
        } 
      }
      
      // 이메일 유효성 체크
      el = els[4].children[0]; 
      el.onkeyup = e => {
        let el = e.target;
        
        if( el.value.length !== 0 ) {
          let msg = e.target.parentElement.nextElementSibling;

          if( validateEmail(el.value) === false ) msg.innerText = '유효하지 않은 이메일입니다.';
          else msg.innerText = '';
        } 
      }
    } // End of ## init

    /** 글자수 제한 체크*/
    let idLength = value => value.length >= 5 && value.length <= 20;
    /** 숫자, 영문 제한 체크*/
    let onlyNumberAndEng = str =>  /^[A-Za-z0-9][A-Za-z0-9]*$/.test(str);
    /** 비밀번호 숫자, 영문, 특수문자 체크*/
    let checkPassword = str =>  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
    /** 비밀번호 확인 체크 */
    let isMatch = (password1, password2) => password1 === password2;
    /** 이메일 유효성 체크 */
    let validateEmail = (email) => /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+$/.test(email);

    /** 필수항목 체크 */
    function doSignUp() {
      let el, els = document.querySelectorAll('.box');
      
      el = els[0].children[0]; 
      if( el.value.length == 0 ) {
        let msg = el.parentElement.nextElementSibling;

        //if( validateEmail(el.value) === false ) msg.innerText = '아이디를 입력해주세요.'; return false;
        msg.innerText = '아이디를 입력해주세요.'; return false;
      }
      
      el = els[1].children[0]; 
      if( el.value.length == 0 ) {
        let msg = el.parentElement.nextElementSibling;

        //if( validateEmail(el.value) === false ) msg.innerText = '비밀번호를 입력해주세요.'; return false;
        msg.innerText = '비밀번호를 입력해주세요.'; return false;
      }
      
      el = els[2].children[0]; 
      if( el.value.length == 0 ) {
        let msg = el.parentElement.nextElementSibling;

        //if( validateEmail(el.value) === false ) msg.innerText = '비밀번호 확인을 입력해주세요.'; return false;
        msg.innerText = '비밀번호 확인을 입력해주세요.'; return false;
      }
      
      el = els[3].children[0]; 
      if( el.value.length == 0 ) {
        let msg = el.parentElement.nextElementSibling;

        //if( validateEmail(el.value) === false ) msg.innerText = '비밀번호를 입력해주세요.'; return false;
        msg.innerText = '닉네임을 입력해주세요.'; return false;
      }
      
      el = els[4].children[0]; 
      if( el.value.length == 0 ) {
        let msg = el.parentElement.nextElementSibling;

        //if( validateEmail(el.value) === false ) msg.innerText = '비밀번호를 입력해주세요.'; return false;
        msg.innerText = '이메일을 입력해주세요.'; return false;
      }

      return true;
    } // End of ## 필수항목 체크

    /*let verifyUserId = userId => {
      let url = "https://192.168.200.166/common/login";
      let data = {
        method: "POST",
        //headers: {"Content-Type": "application/json"},
        body: userId        
      }

      fetch(url, data)
        .catch(error => console.log("error:", error)) // 정상적인 통신이 안 되었을 경우 실행되는 콜백
        .then(response => {
          let el = document.getElementsByTagName("input")[0].parentElement.nextElementSibling;
          console.log("response:", response)
          if(response = "success"){ // 사용가능
            el.innerText = "사용가능한 아이디입니다.";
          }else{ // 사용불가능
            el.innerText = "이미 사용중인 아이디입니다.";
          }
        }); // 정상적인 통신이 되었을 때 실행되는 콜백
    } // End of verifyUserId*/
  </script>
  
</body>
</html>