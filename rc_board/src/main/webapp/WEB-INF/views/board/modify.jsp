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

.fileul {
    list-style:none;
    margin:0;
    padding:0;
}

.fileli {
    margin: 0 1em 0 0;
    padding: 0 0 0 0;
    border : 0;
    display: inline-block;
}
.delFile{
    padding-left: 0.5em;
    cursor: pointer;
}
.listFont{
	font-size: 1.2em;
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
	<input type='hidden' name='searchType' value='${cri.searchType}'>
	<input type='hidden' name='keyword' value='${cri.keyword}'>
</form>

<form id='actionForm' method="get">
	<input type='hidden' name='page' value='${cri.page}'>
	<input type='hidden' name='searchType' value='${cri.searchType}'>
	<input type='hidden' name='keyword' value='${cri.keyword}'>
</form>

<h2>파일 : </h2>
<div class='uploadDiv'>
  <form id='uploadForm'>
    <input id='uploadFile' type='file' name='file'>
    <input type='submit' class="button icon fa-upload" value='업로드'>
  </form>
</div>

<div class="mt fileBox">
	<div class="box">
		<ul class='imgList fileul'> 
    	</ul>

	</div>
	<div class="box">
		<ul class='fileList fileul'> 
    	</ul>
	</div>
</div>
<br>

<ul class="actions" align="right">
	<li><a href="#" data-oper='del' class="button btn Default">삭제</a></li>
	<li><a href="#" data-oper='mod' class="button btn special">완료</a></li>
	<li><a href="#" data-oper='li' class="button btn special">리스트</a></li>
</ul>

<%@include file="/WEB-INF/views/include/bootstrap/footer.jsp"%>


<script src="/resources/js/upload.js"></script>
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
		var modForm = $("#modForm");
		e.preventDefault();
		var plus = 0;
		var isimg = 'n';
		var isfile = 'n';
		var title = modForm.find("input[name='title']").val();
		if(title.length === 0){
			alert("제목을 입력하세요!")
		}else{
			
			$(".imgList li").each(function(idx){
				
				var fileName = $(this).attr("data-file");
				var str = "<input type='hidden' name='ufile["+ idx +"]' value='"+fileName+"'>";
				modForm.append(str);
				plus = idx + 1;
				isimg = 'y';
			});
			
			$(".fileList li").each(function(idx){
				var fileName = $(this).attr("data-file");
				var str = "<input type='hidden' name='ufile["+ (plus+idx) +"]' value='"+fileName+"'>";
				modForm.append(str);
				isfile = 'y';
			});
			var str = "<input type='hidden' name='isimg' value='"+isimg+"'>";
			modForm.append(str);
			
			str = "<input type='hidden' name='isfile' value='"+isfile+"'>";
			modForm.append(str);
			
			modForm.submit();
		}
	});
	
	function checkImageType(fileName){
		var pattern = /jpg|gif|png|jpeg/i;	
		return fileName.match(pattern);
	}
	
	
	$("#uploadForm").on("submit", function(e){ // 새로 추가한 파일 업로드 처리
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
	          if(data.type === 'imgFile'){
	        	  str += "<li class='fileli' data-file='" + data.uploadName  +"'><div>";
		          str += "<img src='/upload/thumb/"+data.thumbName+"'></div>";
		          str += "<center><span class='listFont'>" + data.original+"</sapn>";
		          str += "<span data-file='"+ data.uploadName +"' class='delFile listFont' aria-hidden='true'>&times;</span></center>";
		          str += "</li>";
		          $(".imgList").append(str);  
	          }else{
	        	  str += "<li class='fileli' data-file='" + data.uploadName  +"'><div>";
	        	  str += "<center><span class='listFont'>" + data.original+"</sapn>";
		          str += "<span data-file='"+ data.uploadName +"' class='delFile listFont' aria-hidden='true'>&times;</span></center>";
		          str += "</li>";
		          $(".fileList").append(str);
	          }
	          
	      }
	    });
	});
	
	
	$.getJSON("/upload/list/" + ${board.bno}, function(arr){ // 조회 화면에서 봤었던  파일리스트를 다시 들고오기
	    for(var i=0; i< arr.length; i++){
	    	var str = "";
	    	
	    	if(checkImageType(arr[i])){  // 이미지 파일 이라면
	    		var file = getImgInfo(arr[i]);
	    		str += "<li class='fileli' data-file='" + file.fullName  +"'><div>";
		        str += "<center><img src='/upload/thumb/"+file.thumbName+"'></div></center>";
		        str += "<span class='listFont'>" + file.fileName+"</sapn>";
		        str += "<span data-file='"+ file.fullName +"' class='delFile listFont' aria-hidden='true'>&times;</span></center>";
		        str += "</li>";
		        $(".imgList").append(str);  
	    		
	    	}else{ // 일반 파일이라면
	    		var file = getFileInfo(arr[i]);
	    		console.log(file.fullName);
	    		console.log(file.fileName);
	    		
	    		str += "<li class='fileli' data-file='" + file.fullName  +"'><div>";
	         	str += "<span class='listFont'>" + file.fileName+"</sapn>";
	         	str += "<span data-file='"+ file.fullName +"' class='delFile listFont' aria-hidden='true'>&times;</span></center>";
	  	        str += "</li>";
	  	        $(".fileList").append(str);
	    	}
	    	
	    	
	    }
	});
	
	$(".fileBox").on("click", ".delFile", function(e){ // 화면 삭제 제어
		e.preventDefault();
		var targetAttr = $(this).attr("data-file");
    	var target = $("li[data-file='" + targetAttr + "']"); 
    	target.remove();
		
	});
</script>
