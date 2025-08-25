<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="icon" type="image/ico" href="/img/favicon.ico" />
    <link rel="stylesheet" href="/css/common.css" />
    <style type="text/css">
      #postContainer {
        width: 100%;
        margin: 0 auto;
      }

      #postInfoContainer {
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        width: 95%;
      }

      .postInfo {
        width: 250px;
        display: flex;
        justify-content: space-between;
      }

      #postContents {
        margin: 0 auto;
        padding: 5px;
        box-shadow: 0px 0px 5px #444;
        width: 95%;
        min-height: 500px;
        border-radius: 15px;
      }

      #contentsContainer {
        margin-top: 10px;
      }

      #titleContainer {
        width: 100%;
        display: flex;
        justify-content: space-between;
      }

      #titleContainer > h2 {
        width: 100%;
        padding-right: 70px;
      }

      #backBTN {
        background-color: #ff6600;
        color: white;
        border: none;
        border-radius: 50%;
        width: 40px;
        height: 40px;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        z-index: 999;
        transition: all 0.2s ease;
      }

      #backBTN:hover {
        background-color: #e65c00;
        transform: translateX(-3px);
      }
    </style>
  </head>
  <body>
    <main>
      <div id="postContainer">
        <div id="titleContainer">
          <button id="backBTN">←</button>
          <h2>${post.TITLE}</h2>
        </div>
        <div id="postInfoContainer">
          <div class="postInfo">
            <div>${post.POST_ID}</div>
            <div>${post.MEMBER_NICKNAME}</div>
          </div>
          <div class="postInfo">
            <div>${post.CREATED_AT}</div>
            <div>${post.VIEW_COUNT}</div>
          </div>
        </div>
        <div id="contentsContainer">
          <div id="postContents">${post.CONTENTS}</div>
          <div id="youtubeLink">
            <a href="${post.YOUTUBE_LINK}" target="_blank"
              >유투브가서 바로봐야징</a
            >
          </div>
        </div>
      </div>
    </main>
    <script>
      document.getElementById("backBTN").addEventListener("click", function () {
        window.history.back();
      });
    </script>
  </body>
</html>
