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

<div class="box">이미지 파일 목록</div>
<div class="box">일반 파일 목록</div>

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
</form>

<hr>
<h2>댓글</h2>
<div class="12u$">
	<textarea name="demo-message" id="demo-message"
		placeholder="Enter your contents" rows="3" style="resize:none"></textarea>
</div>
<ul class="actions mt" align="right">
	<li><a href="#" class="button special">댓글 달기</a></li>
</ul>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">


<div class='replyDiv'>
 
               
</div>

<%@include file="/WEB-INF/views/include/bootstrap/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.2.1.js"
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
	crossorigin="anonymous"></script>

<script type="text/javascript">
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
		            		str += " <span class='fr'> <a href='#'>삭제</a> | <a href='#'>수정</a></span>"
		            		str += " <span>"+ arr[i].reply +"</span>";
		            		str += " <div><a data-rno='"+arr[i].rno+"' class='btn-box' href='#'>답글입력</a></div>"
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
		            		str +=" <span class='fr'> <a href='#'>삭제</a> | <a href='#'>수정</a></span>"
		            		str += " <span>"+ arr[i].reply +"</span>";
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
		 
		
	    $(".replyDiv").on("click", ".btn-box", function(e){
	        e.preventDefault();
	        $(this).addClass('hide');
	        var rno = $(this).attr("data-rno");
	        console.log(rno);
	        $(this).addClass('hide');
	        $(".reply-box[data-rno='" + rno + "']").show("slow");
	    });
	    
	    $(".replyDiv").on("click", ".rere-btn", function(e){
	    	
	    	var rno = $(this).attr("data-rno");
	    	console.log("답글달기 버튼 입력 : " + rno);
	    	var rereTa = $(".rere-textarea[data-rno='" + rno + "']");
	    	var temp = rereTa.val();
	    	console.log("textarea 값1 :" + temp);
	    	rereTa.val("");
	    });
		 
</script>