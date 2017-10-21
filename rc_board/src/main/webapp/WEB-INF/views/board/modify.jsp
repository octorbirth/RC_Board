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

<form id='modForm' action="/board/modify" method='post'>
	<h2>제목 :</h2>
	<div class="12u$(xsmall)">
		<input type="text" name="title" id="demo-name"
			value="${board.title}" />
	</div>
	<br>


	<h2>내용 :</h2>
	<div class="12u$">
		<textarea name="contents" id="demo-message"
			placeholder="Enter your contents" rows="5">${board.contents}</textarea>
	</div>

	<input type='hidden' name='page' value='${cri.page}'>
	<input type='hidden' name='bno'  value="${board.bno}">
</form>

<form id='actionForm' method="get">
	<input type='hidden' name='page' value='${cri.page}'>
</form>


<div class="mt">
	<ul class="actions">
		<li><a href="#" class="button icon fa-upload">파일첨부</a></li>
	</ul>
	<div class="box">이미지 파일 목록</div>
	<div class="box">일반 파일 목록</div>
</div>
<br>

<ul class="actions" align="right">
	<li><a href="#" data-oper='del' class="button btn Default">삭제</a></li>
	<li><a href="#" data-oper='mod' class="button btn special">완료</a></li>
	<li><a href="#" data-oper='li' class="button btn special">리스트</a></li>
</ul>

<%@include file="/WEB-INF/views/include/bootstrap/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>

<script>
	var actionForm = $("#actionForm");

	$(".btn").click(function(e) {
		e.preventDefault();
	});

	$(".btn[data-oper='li']").click(function(e) {
		actionForm.attr("action", "/board/list").submit();
	});

	$(".btn[data-oper='del']").click(function(e) {
		actionForm.append("<input type='hidden' name='bno' value='${board.bno}'>");
		actionForm.attr("method", "post").attr("action","/board/remove").submit();
	});

	$(".btn[data-oper='mod']").click(function(e) {
		$("#modForm").submit();
	});
</script>
