<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<span class="image fit">
		
		<c:if test="${ empty members.image }">
			<img src="/resources/img/profile.jpg" alt="" />
		</c:if>
		<c:if test="${ !empty members.image }">
			<img src='/upload/showprofile/${members.image }' alt="" />
		</c:if>
		
		
		
		</span>
	</div>
	<div class="6u$ 12u$(small)">
		<h2 id="content">상세 정보</h2>
		<blockquote>
		<p>이름 : ${members.mname }</p>
		<p>학번 : ${members.stuid }</p>
		<p>학과 : ${members.dept }</p>
		<p>연락처 : ${members.phone }</p>
		<p>이메일 : ${members.email }</p>
		<div class='attendDiv' ></div>
		</blockquote>
	</div>
	<input type='hidden' name='total' value='${total}'>
</div>
<ul class="actions" align="right">
	<li data-oper='li'><a href="/board/list" class="button special">돌아가기</a></li>
</ul>
<%@include file="/WEB-INF/views/include/bootstrap/footer.jsp"%>

<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>

<script>

function getAttendInfo(){
	var total = $("input[name='total']").val();;
	var attend = 0;
	
	// 비동기화 처리를 하면 결과값을 기다리지 않고 화면에 표시해버린다.
	$.ajax({ 
		url:"/attend/count/" + '${members.mid }', // 동기화 하기 위해 getJson -> ajax
		async: false, 
	    success: function(result){
	        attend = result;
	    }
	});
	
    var str = "<p>출석 :  " + attend + " / "+ total +"</p>";	
	$(".attendDiv").html(str);
         
}
getAttendInfo();
</script>  