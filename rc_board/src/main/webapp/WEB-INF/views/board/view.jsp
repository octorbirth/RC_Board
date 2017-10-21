<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>​
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="/WEB-INF/views/include/bootstrap/header.jsp"%>


<style>
textarea {
	resize: none;
}

.mt {
	margin-top: 0.5em;
}

img {
	width: 64px;
	height: 64px;
}

.fr {
	float: right;
}

.ib {
	display: inline-block;
}

.pt {
	padding-top: 1em;
}

.custom-hr {
	margin-top: 0.2em;
	margin-bottom: 0.5em;
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
		placeholder="Enter your contents" rows="3"></textarea>
</div>
<ul class="actions mt" align="right">
	<li><a href="#" class="button special">댓글 달기</a></li>
</ul>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">



<div class="media">
  <img class="d-flex mr-3" src="https://wiki.teamfortress.com/w/images/archive/f/f3/20110511230117%21User_Melibar_Awesome_face.png?t=20110511221626" alt="Generic placeholder image">
  <div class="media-body">
    <h5 class="mt-0">Media heading</h5>
    Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

    <div class="media mt-3">
      <a class="d-flex pr-3" href="#">
        <img src="https://wiki.teamfortress.com/w/images/archive/f/f3/20110511230117%21User_Melibar_Awesome_face.png?t=20110511221626" alt="Generic placeholder image">
      </a>
      <div class="media-body">
        <h5 class="mt-0">Media heading</h5>
        Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
      </div>
    </div>
  </div>
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
</script>