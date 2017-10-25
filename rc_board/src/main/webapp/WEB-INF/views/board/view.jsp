<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>​
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="/WEB-INF/views/include/bootstrap/header.jsp"%>


<style>

.mt {
	margin-top: 0.5em;
}

img {
	width: 50px;
	height: 50px;
}

.fr {
	float: right;
}

.ib {
	display: inline-block;
}
.bb {
	display: block;
}
.pt {
	padding-top: 1em;
}

.custom-hr {
	margin-top: 0.2em;
	margin-bottom: 0.5em;
}

.hide{
        display: none;
}
.rere-btn{
	margin-top: 0.2em;
	font-size: 0.8em;
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
.listFont{
	font-size: 1.2em;
}
</style>


<header class="main"> <br>
<div>
	<h2 class='ib'>${board.title}</h2>
	<span class='fr pt'><fmt:formatDate value="${board.regdate}"
			pattern="yyyy-MM-dd HH:mm" /></span>
</div>
<hr class='custom-hr'>
<div>
	<span> ${board.writer} </span> <span class='fr'> 조회수:
		${board.viewcnt} 댓글수: ${board.replycnt}</span>
</div>
</header>

<div class="fileBox">
	<div class="box">
		<ul class='imgList fileul'> 
    	</ul>

	</div>
	<div class="box">
		<ul class='fileList fileul'> 
    	</ul>
	</div>
</div>
<h2>내용</h2>
<div class="12u$">
	<div class="box">${board.contents}</div>
</div>

<br>

<ul class="actions" align="right">
	<li data-oper='mod'><a href="#" class="button special">수정 / 삭제</a></li>
	<li data-oper='li'><a href="#" class="button special">돌아가기</a></li>
</ul>

<form id='actionForm' method="get">
	<input type='hidden' name='page' value='${cri.page}'>
	<input type='hidden' name='searchType' value='${cri.searchType}'>
	<input type='hidden' name='keyword' value='${cri.keyword}'>
</form>

<hr>
<h2>댓글</h2>
<div class="12u$">
	<textarea id ='replyBox' name="reply" id="demo-message"
		placeholder="Enter your contents" rows="3" style="resize:none"></textarea>
	<input id ='replyer' type='hidden' name='replyer' value='tester'>
	<input id ='replyBno' type='hidden' name='bno' value='${board.bno} '>
</div>
<ul class="actions mt" align="right">
	
	<li><a href="#" class="replyBtn button special">댓글 달기</a></li>
</ul>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">


<div class='replyDiv'>
 
               
</div>

<%@include file="/WEB-INF/views/include/bootstrap/footer.jsp"%>



<script src="/resources/js/upload.js"></script>
<script type="text/javascript">

function checkImageType(fileName){
	var pattern = /jpg|gif|png|jpeg/i;	
	return fileName.match(pattern);
}

$.getJSON("/upload/list/" + ${board.bno}, function(arr){
    for(var i=0; i< arr.length; i++){
    	var str = "";
    	
    	if(checkImageType(arr[i])){  // 이미지 파일 이라면
    		var file = getImgInfo(arr[i]);
    		console.log(file.fullName);
    		console.log(file.fileName);
    		console.log(file.thumbName);
    		
    		str += "<li class='fileli'><div>";
	        str += "<a target='_blank' href='/upload/thumb/"+file.fullName+"'><center><img src='/upload/thumb/"+file.thumbName+"'></div></center>";
	        str += "<center><span class='listFont'>" + file.fileName+"</sapn></center></a>";
	        str += "</li>";
	        $(".imgList").append(str);  
    		
    	}else{ // 일반 파일이라면
    		var file = getFileInfo(arr[i]);
    		console.log(file.fullName);
    		console.log(file.fileName);
    		
    		str += "<li class='fileli'><div>";
         	str += "<a href='/upload/download/"+file.fullName+"'><span class='listFont'>" + file.fileName+"</sapn></a>";
  	        str += "</li>";
  	        $(".fileList").append(str);
    	}
    	
    	
    }
});
		
		var msg = '${result}';
		if (msg === 'modsuccess') {
			alert("수정되었습니다.");
		}

		var actionForm = $("#actionForm");

		$("li[data-oper='li']").click(function(e) {
			e.preventDefault();
			actionForm.attr("action", "/board/list").submit();
		});
		
		$("li[data-oper='mod']").click( function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='${board.bno}'>");
			actionForm.attr("action", "/board/modify").submit();
		});
		
		function getReplies(){
		      var str = "";
		      $.getJSON("/reply/list/" + ${board.bno}, function(arr){
		            for(var i=0; i< arr.length; i++){
		            	
		            	if(arr[i].rno === arr[i].gno){ // 댓글인 경우
		            		str += " <hr>"
		            		str += " <div class='media'> ";
		            		str += " <img class='d-flex mr-3' src='#' alt='" + arr[i].replyer +" '> ";
		            		str += " <div class='media-body'> "
		            		str += " <h5 class='mt-0'>" + arr[i].replyer + "</h5> ";
		            		if(arr[i].garbage === 'n'){
		            			str += " <span class='fr'> <a href='#' id='delRe' data-rno='"+arr[i].rno+"'>삭제</a> | <a href='#' id='modRe' data-rno='"+arr[i].rno+"'>수정</a></span>"	
		            		}
		            		str += " <span data-rno='"+arr[i].rno+"' data-target='modTarget' >"+ arr[i].reply +"</span>";
		            		if(arr[i].garbage === 'n'){
		            			str += " <div><a data-rno='"+arr[i].rno+"' class='btn-box' href='#'>답글입력</a></div>"
		            		}
		            		str += "<div class='hide reply-box' data-rno='"+arr[i].rno+"'>";
		            		str += "<div class='row' >";
		            		str += "<div class='9u$ 12u$(small)'>";
		            		str += "<textarea name='reply' id='demo-message' data-rno='"+arr[i].rno+"' class='rere-textarea' placeholder='Enter your reply' rows='1' style='resize:none'></textarea>";
		            		str += "</div>";
		            		str += "<div class='bb 1u$ 12u$(small)'>";
		            		str += "<a href='#' class='button rere-btn' data-rno='"+arr[i].rno+"'>완료</a> "
		            		str += "</div></div></div>";
		            		// 답글이 하나도 없는 댓글을 위한 조취
		            		if( (i+1) === arr.length){ // 마지막 댓글이자 답글이 없는 상태
		            			str += " </div></div> ";
		            			
		            		}else{ // 아직 보여줄 댓글or답글이 남아 있다면 
		            			if(arr[i+1].rno === arr[i+1].gno){ // 새로운 댓글인지 답글인지 판단(새로운 댓글이라면)
		            				str += " </div></div>";
		            			}
		            			
		            		}
		            	}else{ // 답글인 경우
		            		str +=" <div class='media mt-3'> ";
		            		str +=" <a class='d-flex pr-3' href='#'> ";
		            		str +=" <img src='#' alt='"  +arr[i].replyer +"'> ";
		            		str +=" </a> ";
		            		str +=" <div class='media-body'> ";
		            		str +=" <h5 class='mt-0'>"+ arr[i].replyer +"</h5> ";
		            		if(arr[i].garbage === 'n'){
		            			str +=" <span class='fr'> <a href='#' id='delRe' data-rno='"+arr[i].rno+"'>삭제</a> | <a href='#' id='modRe' data-rno='"+arr[i].rno+"'>수정</a></span>"
		            		}
		            		str += " <span data-rno='"+arr[i].rno+"' data-target='modTarget'>"+ arr[i].reply +"</span>";
		            		str +=" </div></div> ";
		            		
		            		if( (i+1) === arr.length ){ // 마지막 댓글에서 마지막 답글인 경우
		            			str +=" </div></div>"; // 댓글을 끝낸다.
		            		}else{ // 아직 보여줄 댓글or답글이 남아 있다면 
		            			if(arr[i+1].rno === arr[i+1].gno){ // 다음 글이 댓글인경우
		            				str += " </div></div>";
		            			}
		            			// 다음에 가져올 글이 답글이면 상위의 for문을 진행
		            		}
		            	} 
		            }
		            $(".replyDiv").html(str);
		      });
		 }
		 getReplies();
		 
		 $(".replyBtn").on("click", function(e){
		    var str = $("#replyBox").val();	
			 if(str.length === 0 ){
				 alert("댓글 내용을 입력하세요!");
				 return;
			 }
			 	e.preventDefault(); 
		    	var data = {reply:$("#replyBox").val(), replyer:$("#replyer").val(), bno:$("#replyBno").val()} // json으로 처리
		        $("#replyBox").val(""); 
		          $.ajax({ 
		        	  url:'/reply/new',
		              type:'POST',
		              contentType: "application/json; charset=utf-8",
		              data:JSON.stringify(data), 
		              success: function(result){		             
		                  getReplies();
		              }
		          })
		});
		 
	    $(".replyDiv").on("click", ".btn-box", function(e){
	        e.preventDefault();
	        $(this).addClass('hide');
	        var rno = $(this).attr("data-rno");
	        console.log(rno);
	        $(this).addClass('hide');
	        $(".reply-box[data-rno='" + rno + "']").show("slow");
	    });
	    
	    $(".replyDiv").on("click", ".rere-btn", function(e){
	    	var rno = $(this).attr("data-rno"); // gno 값이 된다.
	    	var rereTa = $(".rere-textarea[data-rno='" + rno + "']"); 
	    	var temp = rereTa.val(); // reply
	    	rereTa.val(""); // 댓글에서 하지 않았던 리셋(답글에서는 적용)
	    	var data = {reply : temp, replyer:$("#replyer").val(), bno:$("#replyBno").val(), gno: rno} // json으로 처리
	    	
	    	$.ajax({ 
	        	  url:'/reply/renew',
	              type:'POST',
	              contentType: "application/json; charset=utf-8",
	              data:JSON.stringify(data), 
	              success: function(result){
	                  getReplies();
	              }
	          })
	    });
	    
	    
	    $(".replyDiv").on("click", "#delRe", function(e){
	    	e.preventDefault(); 
	    	var rno = $(this).attr("data-rno");
	        var data = {bno:$("#replyBno").val()}; 
		         
	       	$.ajax({
	           url:'/reply/' + rno,
	           type: 'DELETE',
	           contentType: "application/json; charset=utf-8",
	           data:JSON.stringify(data), 
	           success: function(result){
	               getReplies(); // 바로 적용되도록
	           }
	      	});
	     });
	    
	    $(".replyDiv").on("click", "#modRe", function(e){
	    	e.preventDefault();
	    	
	    	var rno = $(this).attr("data-rno");
	    	$(this).replaceWith("<a href='#' id='clearMod' data-rno='"+rno+"'>수정완료</a>");
	    	var target = $("span[data-target='modTarget'][data-rno='"+rno+"']");
	    	var reply = target.text();
	    	target.replaceWith("<textarea data-target='modTarget' data-rno='"+ rno +"'>"+ reply +" </textarea>");
	    });
	    
	    $(".replyDiv").on("click", "#clearMod", function(e){
	    	e.preventDefault();
	    	var rno = $(this).attr("data-rno");
	    	$(this).replaceWith("<a href='#' id='modRe' data-rno='"+rno+"'>수정</a>");
	    	var target = $("textarea[data-target='modTarget'][data-rno='"+rno+"']");
	    	var reply = target.val();
	    	target.replaceWith("<span data-rno='"+rno+"' data-target='modTarget'>"+ reply +"</span>");
	    	// DB에 값을 변경하고 다시 불러 오지는 않겠다. 새로 고침하기 이전에 보이는 값을 이미 수정된 값으로 front 단에서 처리했기 때문이다.
	    	
	    	var data = {reply : reply}
	    	
	    	$.ajax({
	            url:'/reply/' + rno,
	            type: 'PUT',
	            contentType: "application/json; charset=utf-8",
	            data:JSON.stringify(data),
	            success: function(result){
	            }
	        });
	    });
	    
</script>