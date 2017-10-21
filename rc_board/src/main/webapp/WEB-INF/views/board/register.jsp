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
textarea {
    resize: none;
}
</style>

<header class="main"> <br>
<h1>게시글 등록</h1>
</header>

<form method='post' id='mainForm'>
<input type='hidden' name='writer' value = "tempName">
<h2>제목 : </h2>
<div class="12u$(xsmall)">
	<input type="text" name="title" id="demo-name" value=""
		placeholder="Title"/>
</div>
<br>


<h2>내용 : </h2>
<div class="12u$">
	<textarea name="contents" id="demo-message"
		placeholder="Enter your contents" rows="6"></textarea>
</div>

</form>


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
		<li><a id="createBoard"class="button special">등록하기</a></li>
	</ul>

<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>
<script>
$(document).ready(function () {

	var mainForm = $("#mainForm");
	
	$("#createBoard").on("click",function(e){
		e.preventDefault();
		mainForm.submit();
	});
	
});
</script>


	<%@include file="/WEB-INF/views/include/bootstrap/footer.jsp"%>