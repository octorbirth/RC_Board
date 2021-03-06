<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/WEB-INF/views/include/bootstrap/header.jsp"%>
<style>
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

.switch input {
	display: none;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #00CDFF;
}

input:focus+.slider {
	box-shadow: 0 0 1px #00CDFF;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

tfoot {
	text-align: right;
}

label {
	margin: 0 0 0 0;
}

.tb_1 {
	width: 70%;
}

.tb_2 {
	width: 30%;
}

tbody {
	text-align: center;
}

td {
	vertical-align: middle;
	font-size: 1.3em;
}
</style>
<header class="main"> <br>
<h2>현황</h2>
</header>
<hr class="major" />
<form method='post' id='mainForm'>
	<div class="table-wrapper">
		<table>
			<thead>
				<tr>
					<th>이름</th>
					<th>출석 여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${list}" varStatus="status">
					<tr>
						<td>${item.mname}</td>
						<td><label class='switch'> 
						<c:if test="${item.attend == 'y' }">
							<input name='alist[${status.count-1}]' value='${item.mid}' type='checkbox' checked>		
						</c:if>
						 <c:if test="${item.attend == 'n' }">
							<input name='alist[${status.count-1}]' value='${item.mid}' type='checkbox'>
						</c:if>
						 <span class='slider round'></span></label></td>
						<input type='hidden' name='mlist[${status.count-1}]'
							value='${item.mid}'>
						<input type='hidden' name='namelist[${status.count-1}]'
							value='${item.mname}'>
					</tr>
				</c:forEach>
				<input type='hidden' name='lno' value='${lno}'>
			</tbody>
		</table>
	</div>
</form>
<ul class="actions" align="right">
	<li><a href="#" id="deleteBoard" class="button default">삭제</a></li>
	<li><a href="#" id="modBoard" class="button default">수정</a></li>
	<li><a href="/attend/list" id="createBoard" class="button special">이전으로</a></li>
</ul>

<form id='actionForm' method="post">
	<input type='hidden' name='lno' value='${lno}'>
</form>

<%@include file="/WEB-INF/views/include/bootstrap/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.2.1.js"
	integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
	crossorigin="anonymous"></script>

<script>
	var actionForm = $("#actionForm");
	$("#deleteBoard").click(function(e) {
		e.preventDefault();
		actionForm.attr("action","/attend/remove").submit();
	});

	var mainForm = $("#mainForm");
	$("#modBoard").click(function(e) {
		e.preventDefault();
		mainForm.attr("action", "/attend/modify").submit();
	});
	var msg = '${result}';
	if (msg === 'modsuccess') {
		alert("수정되었습니다.");
	}
</script>

