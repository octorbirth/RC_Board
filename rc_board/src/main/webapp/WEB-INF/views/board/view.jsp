<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="/WEB-INF/views/include/bootstrap/header.jsp"%>


<style>
.mr {
	margin-right: 0.5em;
}

textarea {
	resize: none;
}

.mt {
	margin-top: 0.5em;
}
img{
 width: 64px;
 height: 64px;
}
</style>


<header class="main"> <br>
<h2>게시글 제목</h2>
<hr>
<div align="right">
	<span class="mr">작성자 </span> <span>2017.10.19</span>
</div>
<div align="right">
	<span class="mr">조회수 : 777</span> <span>댓글수 : 11</span>
</div>
</header>

<div class="box">이미지 파일 목록</div>
<div class="box">일반 파일 목록</div>


<div class="12u$">
	<div class="box">
		<p>Aenean ornare velit lacus, ac varius enim ullamcorper eu. Proin
			aliquam facilisis ante interdum congue. Integer mollis, nisl amet
			convallis, porttitor magna ullamcorper, amet egestas mauris. Ut magna
			finibus nisi nec lacinia. Nam maximus erat id euismod egestas.
			Pellentesque sapien ac quam. Lorem ipsum dolor sit nullam.</p>
	</div>
</div>

<br>

<ul class="actions" align="right">
	<li><a href="#" class="button special">수정 / 삭제</a></li>
	<li><a href="#" class="button special">돌아가기</a></li>
</ul>

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