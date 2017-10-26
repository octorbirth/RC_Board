<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/include/bootstrap/header.jsp"%>
<link rel="stylesheet" href="/resources/assets/css/graph.css" />
<style>
ul.actions li {
	padding: 0 0 0 0;
}

.innerDiv {
	padding: 0.2em 0 0 0;
}

.hide {
	display: none;
}

.fr {
	float: right;
}
td{
		text-align: center;
	}
</style>
<header class="main"> <br>
<h2>출석 현황</h2>
</header>
<hr class="major" />
<div>
	<ul class="actions">
		<div class='showhide'>
			<li><a href="" class="button default showBtn">한눈에 보기</a></li>
			<li class='fr'><a href="/attend/register" class="button special">출석하기</a></li>
		</div>
	</ul>
</div>
<div>

	<div class="row hide popup">

		<div class="2u 12u$(small)">
			<p>
				남경지
				<code> 6 / 7</code>
			</p>

		</div>
		<div class="10u$ 12u$(small) innerDiv">
			<div class="progress">
				<div class="progress-bar progress-bar-primary progress-bar-striped"
					role="progressbar" aria-valuenow="40" aria-valuemin="0"
					aria-valuemax="100" style="width: 40%">
					<span class="sr-only">90% Complete (success)</span>
				</div>
			</div>
		</div>
	</div>




</div>
<div class="table-wrapper">
	<table class="alt">
		<thead>
			<tr>
				<th>번호</th>
				<th>수업날짜</th>
				<th>출석형황</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>Item1</td>
				<td>Ante turpis integer aliquet porttitor.</td>
				<td>29.99</td>
			</tr>
			<tr>
				<td>Item2</td>
				<td>Vis ac commodo adipiscing arcu aliquet.</td>
				<td>19.99</td>
			</tr>
		</tbody>

	</table>
</div>



<%@include file="/WEB-INF/views/include/bootstrap/footer.jsp"%>
<script src="https://code.jquery.com/jquery-3.2.1.js"
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
	crossorigin="anonymous"></script>

<script>
	$(".showhide").on("click", ".showBtn", function(e) {
		e.preventDefault();
		$(".showBtn").html("접기");
		$(".showBtn").addClass('hideBtn');
		$(".showBtn").removeClass('showBtn');
		$(".popup").show("slow");

	});

	$(".showhide").on("click", ".hideBtn", function(e) {
		e.preventDefault();
		$(".hideBtn").html("한눈에 보기");
		$(".hideBtn").addClass('showBtn');
		$(".hideBtn").removeClass('hideBtn');
		$(".popup").hide("slow");

	});
</script>
