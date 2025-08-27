	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	  <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>     
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link rel="icon" type="image/ico" href="/img/favicon.ico" />
	<link rel="stylesheet"  href="/css/common.css" />
	
	</head>
	<body>
	  <main>	
	      <div id="write-form" class="write-form-container">
	
	            <h2>새 게시글 작성</h2>
	
	            <form id="post-form">
	
	                <div>
	
	                    <label for="post-title">제목:</label>
	
	                    <input type="text" id="post-title" required>
	
	                </div>
	
	                <div>
	
	                    <label for="post-author">작성자:</label>
	
	                    <input type="text" id="post-author" required>
	
	                </div>
	
	                <div>
	
	                    <label for="post-emotion">감정:</label>
	
	                    <select id="post-emotion" required>
	
	                        <option value="loneliness">외로움</option>
	
	                        <option value="angry">화남</option>
	
	                        <option value="peace">평온</option>
	
	                        <option value="dreams">몽환</option>
	                        
	                        <option value="heart beat">설렘</option>
	                        
	                        <option value="happy">행복</option>
	                        
	                        <option value="magnificent">비장</option>
	                        
	                        <option value="hard">벅참</option>
	                        
	                        <option value="uncomfortable">불안</option>
	                        
	                        <option value="confidence">자신감</option>
	                        
	                        <option value="sad">슬픔</option>
	                        
	                        <option value="calm">평범</option>
	                        
	                        <option value="calm">피곤</option>
	
	                    </select>
	
	                </div>
	
	                <div>
	
	                    <label for="post-link">유튜브 링크:</label>
	
	                    <input type="url" id="post-link" required>
	
	                </div>
	
	                <div>
	
	                    <label for="post-content">내용:</label>
	
	                    <textarea id="post-content" rows="4" required></textarea>
	
	                </div>
	
	                <div class="write-form-buttons">
	
	                    <button type="submit" class="submit-button">작성 완료</button>
	
	                    <button type="button" id="cancel-button" class="cancel-button">취소</button>
	
	                </div>
	
	            </form>
	
	        </div>
	  </main>	
	</body>
	</html>
	
	
	
	
