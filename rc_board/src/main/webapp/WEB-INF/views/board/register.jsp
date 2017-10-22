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
ul {
    list-style:none;
    margin:0;
    padding:0;
}

li {
    margin: 0 0 0 0;
    padding: 0 0 0 0;
    border : 0;
    display: inline-block;
}
.delImg{
    padding-left: 0.5em;
    cursor: pointer;
}
.imglist{
	font-size: 1.2em;
}
</style>

<header class="main"> <br>
<h1>게시글 등록</h1>
</header>

<form method='post' id='mainForm'>
<input type='hidden' name='writer' value ="tempName">
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

<h2>파일 : </h2>
<div class='uploadDiv'>
  <form id='uploadForm'>
    <input id='uploadFile' type='file' name='file'>
    <input type='submit' class="button icon fa-upload" value='업로드'>
  </form>
</div>

<div class="mt">
	<div class="box">
		<ul class='imgList'> 
    	</ul>

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
		
		var title = mainForm.find("input[name='title']").val();
		if(title.length === 0){
			alert("제목을 입력하세요!")
		}else{
			$(".imgList li").each(function(idx){
				
				var fileName = $(this).attr("data-file");
				
				var str = "<input type='hidden' name='ufile["+ idx +"]' value='"+fileName+"'>";
				
				$("#mainForm").append(str);
			});
			
			mainForm.submit();
		}
		
	});
	
	$("#uploadForm").on("submit", function(e){
	    e.preventDefault(); // form 태그 기능 막기
	    
	    var formData = new FormData();
	    formData.append("file", $("#uploadFile")[0].files[0]);
	    
	    $.ajax({
	      url: '/upload/',
	      data: formData,
	      dataType:'json',
	      processData: false,
	      contentType: false,
	      type: 'POST',
	      success: function(data){
	          var str = "";
	          str ="<li data-file='" + data.uploadName  +"'><div>";
	          str += "<img src='/upload/thumb/"+data.thumbName+"'></div>";
	          str += "<center><span class='imglist'>" + data.original+"</sapn>";
	          str += "<span class='delImg imglist' aria-hidden='true'>&times;</span></center>";
	          str += "</li>";
	          $(".imgList").append(str);

	      }
	    });

	});
	
});



</script>


<%@include file="/WEB-INF/views/include/bootstrap/footer.jsp"%>