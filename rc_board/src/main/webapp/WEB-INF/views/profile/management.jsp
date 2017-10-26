<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/WEB-INF/views/include/bootstrap/header.jsp"%>
<style>
.fit{
	padding-left: 20%;
}
</style>

<header class="main"> <br>
<h2>프로필 정보</h2>
</header>

<div class="row">

	<div class="6u 12u$(small)">
		<span class="image fit"><img
			src="/resources/img/logo.png" alt="" /></span>
		<center><div class='uploadDiv'>
			<form id='uploadForm'>
				<input id='uploadFile' type='file' name='file'> <input
					type='submit' class="button icon fa-upload" value='업로드'>
			</form>
		</div>
		</center>
	</div>
	<div class="6u$ 12u$(small)">
		<h2 id="content">${memberVO.mid}님의 정보</h2>
		<blockquote>
		<form id='mainForm' method='post'>
			<input type='hidden' name='mid' value='${memberVO.mid}'>
			이름 : <input type="text" name="mname" value="${memberVO.mname }"/><br>
    		학번 : <input type="text" name="stuid" value="${memberVO.stuid }"/><br>
    		학과 : <input type="text" name="dept"  value="${memberVO.dept }"/><br>
    		연락처 : <input type="text" name="phone" value="${memberVO.phone }"/><br>
    		이메일 : <input type="text" name="email" value="${memberVO.email }"/><br>
  			비밀번호 : <input type='text' name='mpw' value='${memberVO.mpw}'><hr>
  			<strong><h3>출석현황 : 6 / 7</h3></strong>
  		</form>
		</blockquote>
	</div>
</div>
<ul class="actions" align="right">
	<li data-oper='mod'><a href="#" class="button special">수정</a></li>
	<li data-oper='li'><a href="/board/list" class="button special">돌아가기</a></li>
</ul>
<%@include file="/WEB-INF/views/include/bootstrap/footer.jsp"%>

<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>

<script>

$("li[data-oper='mod']").click(function(e) {
	e.preventDefault();
	var mainForm = $("#mainForm");	
	
	mainForm.submit();
});


</script>