<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/WEB-INF/views/include/bootstrap/header.jsp"%>

<style>
.mt {
	margin-top: 3em;
}
header.main>:last-child {
    margin: 0 0 0.5em 0;
}
</style>

<header class="main"> <br>
<h1>게시글 수정</h1>
</header>

<h2>제목 : </h2>
<div class="12u$(xsmall)">
	<input type="text" name="demo-name" id="demo-name" value=""/>
</div>
<br>


<h2>내용 : </h2>
<div class="12u$">
	<textarea name="demo-message" id="demo-message"
		placeholder="Enter your contents" rows="6"></textarea>
</div>
<div class="mt">
	<ul class="actions">
		<li><a href="#" class="button icon fa-upload">파일첨부</a></li>
	</ul>
	<div class="box">
		이미지 파일 목록
	</div>
	<div class="box">
		일반 파일 목록
	</div>
</div>
	<br>

	<ul class="actions" align="right">
		<li><a href="#" class="button Default">삭제</a></li>
		<li><a href="#" class="button special">취소</a></li>
		<li><a href="#" class="button special">완료</a></li>
	</ul>

<%@include file="/WEB-INF/views/include/bootstrap/footer.jsp"%>