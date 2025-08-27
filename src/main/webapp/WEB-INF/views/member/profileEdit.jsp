<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols"/>
  <link rel="icon" type="image/ico" href="/img/favicon.ico" />
  <title>Music is MyLife : 회원정보 수정</title>
  <style>
    * {
    margin: 0; 
    padding: 0;
    box-sizing: border-box;
    font-family: 'Noto Sans KR', '맑은 고딕', Arial, sans-serif; }
  
  html, body {
    width: 100%; 
    height: 100%;
    margin: 0;
    padding: 0;
    overflow: hidden;
    font-size: 10px; /* 삭제하면 안됨 */
    background: radial-gradient(circle at top left, #ff8a00, #e52e71 70%); }
  
  body {
    display: flex;
    flex-direction: column; 
    justify-content: center;
    align-items: center;
    min-width: 100rem; /* 1rem 은 html태그의 폰트사이즈임 // 10px => 1rem , 0.1rem => 1px */  
    min-height: 70rem; }
  
  /** === wrapper === **/  
  .wrap { 
    width: 45rem; 
    height: 70rem;
    animation: fadeScaleUp 0.8s ease forwards; }
  
  @keyframes fadeScaleUp {
      0% {opacity: 0; transform: scale(0.85);}
    100% {opacity: 1; transform: scale(1);}
  }
    /** === 항목 box === **/  
    .main{       
      display: flex;
      flex-direction: column; 
      justify-content: start;
      flex-wrap: wrap;
      overflow: hidden; 
      border: 0.1rem solid #ff6600; 
      border-radius: 1rem; 
      background-color: white;
	    box-shadow: 0 1.6rem 4rem rgba(229, 46, 113, 0.35);
	    width: 45rem; 
	    margin-bottom: 2rem; }
    /** === main > 텍스트로고 (Music is MyLife) === **/  
    .wrap > .main:nth-child(1) { 
	    border: none;
	    box-shadow: none;
	    background-color: transparent;
	    text-align: center; 
	    font-size: 5rem;
	    font-weight: 900;
	    color: white; 
	    height: 8rem; 
	    margin-bottom: 1rem;
	    animation: titleJump 1.2s ease infinite; }
  
	  @keyframes titleJump {
	    0%, 100% {transform: translateY(0);}
	    50% {transform: translateY(-0.5rem);}
	  }
    /** === main > 개인정보 테두리  === **/  
    .wrap > .main:nth-child(2) { height: 55rem; }
    /** === main > title (기본정보 수정)  === **/
    .title {    
	    background: linear-gradient(45deg, #e52e71, #ff8a00);
	    font-size: 1.8rem;
	    font-weight: 700; 
	    color: white;      
	    width: 100%;
	    height: 5rem;
	    padding: 2rem 2rem 0;
	    margin-bottom: 3rem; }
    /** === main > box : 개인정보 항목별 box === **/  
    .box{
      font-size: 1rem;
      padding: 0 2rem;
      width: 100%;
      height: 6.5rem; 
      display: flex;
      align-items: center; }
    /** === 항목체크 msg 표시칸 ===**/  
    .box + div {
     display: flex;
     align-items: center;
     box-sizing: border-box;
     font-size: 1.2rem;
     color: #ff6600;
     width: 100%;
     height: 1.2rem; 
     padding: 0 2rem; 
     }
    /** === inputStyle :: 폰트아이콘 + input 처리 === **/
    .inputStyle {
	    border: none;
	    background: transparent;
	    outline: none;
	    border-bottom: 0.2rem solid rgba(229, 46, 113, 0.3);
	    height: 3.5rem;
	    width: 100%; 
	    margin: 1rem;
	    font-size: 1.6rem;
	    color: #444;
	    transition: border-color 0.3s ease; }
  
	  .inputStyle:focus {
	    border-color: #e52e71; }
	  
	  .material-symbols {
	    color: #e52e71;
	    font-size: 2rem; }
    /** === btn확인 === **/
    input[type="submit"]{
	    background: linear-gradient(45deg, #e52e71, #ff3e8d);
	    border: none;
	    border-radius: 2.5rem;
	    text-align: center;
	    text-decoration: none;  
	    font-size: 1.5rem;
	    font-weight: 700;
	    color: white;
	    cursor: pointer;
	    margin: 2rem 15rem;
	    width: 35%;
	    height: 3rem;
	    box-shadow: 0 0.5rem 1.5rem rgba(229, 46, 113, 0.4);
	    transition: all 0.3s ease; }
    /**=== btn회원가입 비활성화 ==**/  
    input[type="submit"]:disabled{
      background-color: #cccccc;
    } 
    input[type="submit"]:hover {
    transform: translateY(-0.3rem);
    box-shadow: 0 0.8rem 2rem rgba(229, 46, 113, 0.6); } 
  </style>
</head>
<body onload="init()">
  <div class="wrap">
    <div class="main">Music is MyLife</div>
    <!-- ///// 개인 정보 box ///// -->
    <div class="main">
      <div class="title">기본정보 수정</div>
      <form action="/member/UpdateAction" method="post" onsubmit="return doSignUp();"> 
	      <div class="box">
		      <span class="material-symbols">artist</span>
		      <input class="inputStyle" type="text" name="member_id" value="${ member.member_id }" readonly/>
	      </div><div></div>
	      <div class="box">
		      <span class="material-symbols">lock</span>
		      <input class="inputStyle" type="password" name="member_pw" value="${ member.member_pw }"/>
	      </div><div></div>
	      <div class="box">
          <span class="material-symbols">lock</span>
          <input class="inputStyle" type="password" name="member_repwd" value="${ member.member_pw }"/>
	      </div><div></div>
	      <div class="box">
	        <span class="material-symbols">account_circle</span>
	        <input class="inputStyle" type="text" name="member_nickname" value="${ member.member_nickname }" />
	      </div><div></div>
	      <div class="box">
          <span class="material-symbols">mail</span>
          <input class="inputStyle" type="text" name="member_email" value="${ member.member_email }" />
	      </div><div></div>
	      <input id="btnsend" type="submit" value="확인" />
      </form>
    </div>
  </div>

  <script>
     /** init */
    let init = () => {
      let el, els = document.querySelectorAll('.box');
      let btnsendEl = document.getElementById('btnsend'); //가입버튼 활성 or 비활성화
      
      // 비밀번호 유효성 체크
      el = els[1].children[1]; 
      el.onkeyup = e => {
        let el = e.target;

        if( el.value.length !== 0 ) {
          let msg = e.target.parentElement.nextElementSibling;

          if( checkPassword(el.value) === false ) {
            msg.innerText = '비밀번호: 8글자 이상의 영문, 숫자, 특수문자 조합으로 사용하세요.';
            btnsendEl.disabled = true;
          } else {
            msg.innerText = '';
            btnsendEl.disabled = false; }
        } 
      }

      // 비밀번호 재입력란 일치 체크
      el = els[2].children[1]; 
      el.onkeyup = e => {
        let el = e.target;

        if( el.value.length !== 0 ) {
          let msg = e.target.parentElement.nextElementSibling;

          if( isMatch(els[1].children[1].value, el.value) === false ) {
            msg.innerText = '비밀번호 확인: 비밀번호와 일치하지 않습니다.';
            btnsendEl.disabled = true;
          } else {
            msg.innerText = '';
            btnsendEl.disabled = false; }
        } 
      }
      
      // 닉네임 중복 체크
      el = els[3].children[1];
      let nickname1 = el.value; // 기존 닉네임
      el.onblur = e => {
        let el = e.target;

        if(nickname1 !== el.value){ // 기존 닉네임과 입력 닉네임이 다를 경우만 중복 체크
        	verifyNickName(el.value);
        } else {
        	let msg = e.target.parentElement.nextElementSibling; //체크메세지 초기화 시켜줌
        	msg.innerText = '';
        }
      }
      
      // 이메일 유효성 체크
      el = els[4].children[1]; 
      el.onkeyup = e => {
        let el = e.target;
        
        if( el.value.length !== 0 ) {
          let msg = e.target.parentElement.nextElementSibling;

          if( validateEmail(el.value) === false ) {
            msg.innerText = '유효하지 않은 이메일입니다.';
            btnsendEl.disabled = true;
          } else {
            msg.innerText = '';
            btnsendEl.disabled = false; }
        } 
      }
    } // End of ## init
   
    /** 비밀번호: 숫자, 영문, 특수문자 체크*/
    let checkPassword = str =>  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
    /** 비밀번호: 재입력 체크 */
    let isMatch = (password1, password2) => password1 === password2;
    /** 이메일: 유효성 체크 */
    let validateEmail = (email) => /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+$/.test(email);

    /** 필수항목 입력체크 */
    function doSignUp() {
      let el, els = document.querySelectorAll('.box');
      
      el = els[1].children[1]; 
      if( el.value.length == 0 ) {
        let msg = el.parentElement.nextElementSibling;

        msg.innerText = '비밀번호를 입력해주세요.'; return false;
      }
      
      el = els[2].children[1]; 
      if( el.value.length == 0 ) {
        let msg = el.parentElement.nextElementSibling;

        msg.innerText = '비밀번호 확인을 입력해주세요.'; return false;
      }
      
      el = els[3].children[1]; 
      if( el.value.length == 0 ) {
        let msg = el.parentElement.nextElementSibling;

        msg.innerText = '닉네임을 입력해주세요.'; return false;
      }
      
      el = els[4].children[1]; 
      if( el.value.length == 0 ) {
        let msg = el.parentElement.nextElementSibling;

        msg.innerText = '이메일을 입력해주세요.'; return false;
      }

      return true;
    } // End of ## 필수항목 체크

    /** 닉네임 중복 체크 */
    let verifyNickName = userNickName => {
      let btnsendEl = document.getElementById('btnsend'); //가입버튼 활성 or 비활성화
      let url = "/member/ajaxNickNameChk";
      let json = { CheckNickName: userNickName };
      let data = {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify(json) };

      fetch(url, data)
        .then(response => response.json())
        .then(data => { // 정상적인 통신이 되었을 때 실행되는 콜백
          let el = document.getElementsByTagName("input")[3].parentElement.nextElementSibling;
          
          if(data.result == "success"){ // 사용 가능
            el.innerText = "사용가능한 닉네임입니다.";
            btnsendEl.disabled = false;
          } else{ // 사용 불가능
            el.innerText = "이미 사용중인 닉네임입니다.";
            btnsendEl.disabled = true; }         
        })
        .catch(error => console.log("error:", error)) // 정상적인 통신이 안 되었을 경우 실행되는 콜백
    } // End of verifyNickName*/
  </script>
</body>
</html>