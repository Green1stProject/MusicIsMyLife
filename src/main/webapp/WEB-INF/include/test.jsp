<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>

    <link rel="icon" type="image/ico" href="/img/favicon.ico" />
    <link rel="stylesheet" href="/css/common.css" />

    <style>
      #container {
        width: 100%;
        display: flex;
        justify-content: space-between;
      }

      .content {
        width: 100%;
        margin-left: 10px;
      }
      /* 테이블 기본 스타일 */
      .post-list {
        width: 100%;
        border-collapse: collapse;
        font-family: "Noto Sans KR", "맑은 고딕", Arial, sans-serif;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
      }

      .post-list thead tr {
        background-color: #ff6600;
        color: white;
        font-weight: 700;
        font-size: 1rem;
        text-align: left;
        user-select: none;
      }

      .post-list thead th {
        text-align: center;
        padding: 12px 15px;
        border-bottom: 2px solid #e25a00;
      }

      /* 바디 셀 */
      .post-list tbody td {
        padding: 12px 15px;
        border-bottom: 1px solid #eee;
        vertical-align: middle;
        color: #333;
      }

      /* 링크 스타일 */

      .post-list tbody td a {
        margin: 0px;
        color: #000000;
        font-weight: 600;
        text-decoration: none;
        transition: all 0.3s ease;
        border-radius: 0px;
        background-color: #eee;
      }

      .post-list tbody td a:hover {
        color: #ff6d0b;
        text-decoration: underline;
      }

      /* 감정 태그 스타일 */
      .emotion-tag {
        padding: 4px 10px;
        border-radius: 15px;
        color: rgb(0, 0, 0);
        font-size: 0.85rem;
        text-transform: capitalize;
        font-weight: 600;
        display: inline-block;
      }

      /* 홀짝 행 배경색 */
      .post-list tbody tr:nth-child(even) {
        background-color: #f9f9f9;
      }

      /* 마우스 오버 시 효과 */
      .post-list tbody tr:hover {
        background-color: #fff3e0;
        cursor: pointer;
        transition: background-color 0.3s ease;
      }

      /* 조회수 등 수치 정렬용 */
      .post-list tbody td:nth-child(1),
      .post-list tbody td:nth-child(6) {
        text-align: center;
        font-variant-numeric: tabular-nums;
      }

      /* 작성일 중앙 정렬 */
      .post-list tbody td:nth-child(5) {
        text-align: center;
      }
    </style>
  </head>
  <body>
    <%@include file="/WEB-INF/include/floatingBTN.jsp"%>
    <main>
      <h1>테스트요</h1>
      <div id="container">
        <div>
          <%@include file="/WEB-INF/include/profile.jsp"%> <%@include
          file="/WEB-INF/include/sidebar.jsp"%>
        </div>
        <div class="content">
          <table class="post-list">
            <thead>
              <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>감정</th>
                <th>작성일</th>
                <th>조회수</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="post" items="${testList}">
                <tr>
                  <td>${post.POST_ID}</td>
                  <td>
                    <a href="/post/detail/${post.POST_ID}">${post.TITLE}</a>
                  </td>
                  <td>${post.MEMBER_NICKNAME}</td>
                  <td>
                    <span class="emotion-tag ${post.EMOTION_CODE}"
                      >${post.EMOTION_CODE}</span
                    >
                  </td>
                  <fmt:parseDate
                    var="parsedDate"
                    value="${post.CREATED_AT}"
                    pattern="yyyy-MM-dd HH:mm:ss"
                  />
                  <td>
                    <fmt:formatDate
                      value="${parsedDate}"
                      pattern="yyyy-MM-dd"
                    />
                  </td>
                  <td>${post.VIEW_COUNT}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </main>
  </body>
</html>
