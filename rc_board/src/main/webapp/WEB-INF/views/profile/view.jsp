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
<h1>프로필 정보</h1>
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
		<h2 id="content">상세 정보</h2>
		<blockquote>
		<p>이름 : 현승우</p>
		<p>학번 : 2012270404</p>
		<p>학과 : 2012270404</p>
		<p>연락처 : 010-0000-0000</p>
		<p>이메일 : xxxxxx@xxxxxx.xxx</p>
		<p>출석 : 6 / 7</p>
		</blockquote>
	</div>
</div>

<%@include file="/WEB-INF/views/include/bootstrap/footer.jsp"%>