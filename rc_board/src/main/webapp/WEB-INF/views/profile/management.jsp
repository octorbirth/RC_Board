<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/WEB-INF/views/include/bootstrap/header.jsp"%>
<style>
.fit{
	padding-left: 20%;
}

#fileBtn, .fileBtn{
	padding: 0 0.4em;
}
.fr{
	float:right;
	position: absolute;
}
</style>

<header class="main"> <br>
<h2>프로필 정보</h2>
</header>

<div class="row">

	<div class="6u 12u$(small)">
		<span class="image fit">
		<c:if test="${ empty memberVO.image }">
			<img id="profileImg" src="/resources/img/profile.jpg" alt="" />
		</c:if>
		<c:if test="${ !empty memberVO.image }">
			<img id="profileImg" src='/upload/showprofile/${memberVO.image }' alt="" />
		</c:if>	
		</span>
		<center><div class='uploadDiv'>
			<form id='uploadForm'>
				<input id='uploadFile' type='file' name='file'> 
				<input id= 'fileBtn' type='submit' class=" button icon fa-upload" value='등록'>
				<span id="delProfile" class='button fileBtn'>삭제</span>	
			</form>
			<input type='hidden' name='image' value='${memberVO.image}'>
		</div>
		</center>
	</div>
	<div class="6u$ 12u$(small)">
		<h2 id="content">${memberVO.mid}님의 정보</h2>
		<blockquote>
		<form id='mainForm' method='post'>
			<input type='hidden' name='mid' value='${memberVO.mid}'>
			<input type='hidden' name='admin' value='${memberVO.admin}'>
			이름 : <input type="text" name="mname" value="${memberVO.mname }"/><br>
    		학번 : <input type="text" name="stuid" value="${memberVO.stuid }"/><br>
    		학과 : <input type="text" name="dept"  value="${memberVO.dept }"/><br>
    		연락처 : <input type="text" name="phone" value="${memberVO.phone }"/><br>
    		이메일 : <input type="text" name="email" value="${memberVO.email }"/><br>
  			비밀번호 : <input type='text' name='mpw' value='${memberVO.mpw}'><hr>
  			<div class='attendDiv' ></div>
  		</form>
  		<input type='hidden' name='total' value='${total}'>
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
var imageName = $("input[name='image']").val();
var admin = $("input[name='admin']").val();
$("li[data-oper='mod']").click(function(e) {
	e.preventDefault();
	var mainForm = $("#mainForm");
	if(imageName != null){
		mainForm.append("<input type='hidden' name='image' value='"+imageName+"'>");	
	}
	mainForm.submit();
});


$("#delProfile").click(function(e) {
	var targetName = $("#profileImg").attr("src");
	if(targetName !== null){
		$.ajax({
	  	      url: '/profile/delete',
	  	      data: {fileName:targetName},
	  	      dataType:'json',
	  	      type: 'POST',
	  	      success: function(result){        
	  	      }
	  	});
	}
	$("#profileImg").attr("src", "/resources/img/profile.jpg");
	imageName = null;
});



$("#uploadForm").on("submit", function(e){
    e.preventDefault(); // form 태그 기능 막기
    var formData = new FormData();
    formData.append("file", $("#uploadFile")[0].files[0]);
    $.ajax({
      url: '/upload/profile/',
      data: formData,
      dataType:'json',
      processData: false,
      contentType: false,
      type: 'POST',
      success: function(data){
          var str = "";
          if(data.type === 'imgFile'){
	          $("#profileImg").attr("src", "/upload/showprofile/"+data.uploadName)
	          imageName = data.uploadName;
          }else{
        	  alert("이미지 파일을 올리주세요!");
          }
          
      }
    });
});


function getAttendInfo(){
	var total = $("input[name='total']").val();;
	var attend = 0;
	
	// 비동기화 처리를 하면 결과값을 기다리지 않고 화면에 표시해버린다.
	$.ajax({ 
		url:"/attend/count/" + '${memberVO.mid}', // 동기화 하기 위해 getJson -> ajax
		async: false, 
	    success: function(result){
	        attend = result;
	    }
	});
	
    
    var str = "<strong><h3>출석현황 :  " + attend + " / "+ total +"</h3></strong>";	
	$(".attendDiv").html(str);
         
}

if(admin === 'n'){
	getAttendInfo();
}

</script>