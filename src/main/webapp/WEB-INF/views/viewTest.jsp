<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	border: 1px solid black;
	margin-left: 10px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/include/floatingBTN.jsp"%>
	<main>
		<h1>테스트요</h1>
		<div id="container">
			<div>
				<%@include file="/WEB-INF/include/profile.jsp"%>
				<%@include file="/WEB-INF/include/sidebar.jsp"%>
			</div>
			<div class="content">asdasdasdasd</div>
		</div>
	</main>
</body>
</html>
