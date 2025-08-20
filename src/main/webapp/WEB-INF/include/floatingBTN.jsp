<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<style>
.floating-btn {
	position: fixed;
	bottom: 30px;
	right: 30px;
	width: 60px;
	height: 60px;
	background: linear-gradient(45deg, #6a11cb, #2575fc);
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-size: 28px;
	cursor: pointer;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
	z-index: 1000;
}

.modal-background {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 998;
}

.modal-window {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: white;
	padding: 25px;
	border-radius: 10px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
	z-index: 999;
	width: 80%;
	max-width: 500px;
}

.modal-close {
	position: absolute;
	top: 10px;
	right: 15px;
	font-size: 24px;
	cursor: pointer;
}
</style>


<div class="floating-btn" id="floatingBtn">+</div>

<div class="modal-background" id="modalBackground"></div>
<div class="modal-window" id="modalWindow">
	<div class="modal-close" id="modalCloseBtn">&times;</div>
	<h2>감정을 고르면 음악을 준다는데?</h2>
	<select id="my_emote" name="my_emote">
		<c:forEach var="emotion" items="${emotionList}">
			<option value="${emotion.EMOTION_CODE}">${emotion.DESCRIPTION}</option>
		</c:forEach>
	</select>
	<div id="musicRecommend"></div>
</div>



<script>
	const floatingBtn = document.getElementById('floatingBtn');
	const modalBackground = document.getElementById('modalBackground');
	const modalWindow = document.getElementById('modalWindow');
	const modalCloseBtn = document.getElementById('modalCloseBtn');

	function toggleModal() {
		modalBackground.style.display = modalBackground.style.display === 'block' ? 'none'
				: 'block';
		modalWindow.style.display = modalWindow.style.display === 'block' ? 'none'
				: 'block';
	}

	floatingBtn.addEventListener('click', toggleModal);
	modalCloseBtn.addEventListener('click', toggleModal);
	modalBackground.addEventListener('click', toggleModal);
</script>