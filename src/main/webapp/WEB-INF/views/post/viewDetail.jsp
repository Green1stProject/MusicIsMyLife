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
/* 전체 게시글 컨테이너 */
#postContainer {
	width: 90%;
	max-width: 900px;
	margin: 40px auto;
	font-family: "Noto Sans KR", "맑은 고딕", Arial, sans-serif;
	color: #333;
}

/* 헤더: 뒤로가기 버튼, 제목, 유튜브링크 한 줄에 딱 정렬 */
#titleContainer {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

/* 뒤로가기 버튼 */
#backBTN {
	background-color: #e52e71;
	color: white;
	border: none;
	border-radius: 50%;
	width: 42px;
	height: 42px;
	font-weight: bold;
	cursor: pointer;
	box-shadow: 0 4px 8px rgba(229, 46, 113, 0.4);
	transition: background-color 0.3s, transform 0.2s;
}

#backBTN:hover {
	background-color: #c33060;
	transform: translateX(-4px);
}

/* 제목 */
#titleContainer h2 {
	flex-grow: 1;
	text-align: center;
	font-weight: 800;
	font-size: 2.4rem;
	color: #e52e71;
	margin: 0 20px;
	user-select: none;
}

/* 유튜브 링크 스타일 */
#youtubeLink {
	text-align: center;
}

#youtubeLink>a {
	color: #ffffff;
	font-weight: 700;
	text-decoration: none;
	transition: color 0.3s ease;
	white-space: nowrap;
}

#youtubeLink>a:hover {
	color: #000000;
	text-decoration: underline;
}

/* 전체 작성자·날짜·조회수 컨테이너 */
#postInfoContainer {
	display: flex;
	justify-content: space-between;
	margin: 0 auto 30px;
	font-size: 1rem;
	color: #666;
	user-select: none;
	border-bottom: 1px solid #eee; /* 경계선 넣어 깔끔 */
	padding-bottom: 12px;
}

/* 작성자, 날짜, 조회수 각각 그룹 */
.postInfo {
	display: flex;
	gap: 30px;
	font-weight: 600;
	color: #555;
}

/* 작성자 및 기타 텍스트 요소에 마진 작은 간격 */
.postInfo>div {
	padding: 2px 8px;
	background: #fafafa;
	border-radius: 20px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
	white-space: nowrap;
	transition: background-color 0.3s ease;
}

/* 호버시 약간 배경색 변하게 해줘서 인터랙티브 느낌 */
.postInfo>div:hover {
	background-color: #f0d0d6;
	color: #e52e71;
	box-shadow: 0 2px 6px rgba(229, 46, 113, 0.25);
	cursor: default;
}

/* 게시글 본문 */
#contentsContainer {
	max-width: 900px;
	margin: 0 auto;
}

/* 본문 내용 스타일 */
#postContents {
	padding: 20px 25px;
	background: white;
	border-radius: 15px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.12);
	min-height: 500px;
	font-size: 1.15rem;
	line-height: 1.7;
	color: #444;
	white-space: pre-wrap;
	word-break: break-word;
}
</style>
</head>
<body>
	<main>
		<div id="postContainer">
			<div id="titleContainer">
				<button id="backBTN">←</button>
				<c:if test="${ login.member_id == post.MEMBER_ID }">
						<span class="DUBtn"><a
							href="/post/edit?post_id=${ post.POST_ID}">[수정]</a></span>
						<span class="DUBtn"><a
							href="/post/postDelete?post_id=${ post.POST_ID }">[삭제]</a></span>
				</c:if>
				<h2>${post.TITLE}</h2>
				<div id="youtubeLink">
					<a href="${post.YOUTUBE_LINK}" target="_blank">유투브가서 바로봐야징</a>
				</div>
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
			</div>
		</div>
		<%@include file="/WEB-INF/views/comment/commentList.jsp"%>
	</main>
	<script>
		document.getElementById("backBTN").addEventListener("click",
				function() {
					location.href = "/post/view"; 
				});
	</script>
</body>

</html>
