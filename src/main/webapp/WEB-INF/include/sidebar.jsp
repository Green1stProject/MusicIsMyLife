<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<meta charset="UTF-8" />
<style>
#category {
	list-style: none;
}

#category>li {
	line-height: 100%;
	align-items: center;
}

#category>li>a {
	margin: 1px;
	width: 100%;
	border-radius: 5px;
	border: 2px solid black;
	background-color: #f5c7a8;
	color: black;
}

#category>li>a:hover {
	background-color: #e28140;
}
</style>

<div id="sidebar">
	<ul id="category">
		<li><a href="/viewTest">전체 보기</a></li>
		<c:forEach var="emotion" items="${emotionList}">
			<li><c:set var="description" value="${emotion.DESCRIPTION}" />
				<c:set var="cutDescription"
					value="${fn:substringBefore(description, '(')}" /> <a
				href="/viewTest/${emotion.EMOTION_CODE}">${cutDescription}</a></li>
		</c:forEach>
	</ul>
</div>

<script></script>
