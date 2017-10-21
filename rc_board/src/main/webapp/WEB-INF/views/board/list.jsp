<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>RC 창의교육하우스</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/resources/assets/css/main.css" />


</head>
<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header"> <a href="index.html" class="logo"><strong>Editorial</strong>
					by HTML5 UP</a> </header>

				<!-- Banner -->
				<section id="banner">
				<div class="content">
					<header>
					<h1>
						RC 하우스<br /> by HTML5 UP
					</h1>
					<p>A free and fully responsive site template</p>
					</header>
					<p>--- 소 개 글 ---</p>
					<ul class="actions">
						<li><a href="rc.korea.ac.kr" class="button big">Learn
								More</a></li>
					</ul>
				</div>
				<span class="image object"> <img
					src="/resources/images/pic10.jpg" alt="" />
				</span> </section>

				<hr class="major" />
				<h2>게시판</h2>
				<ul class="actions" align="right">
					<li><a href="/board/register" class="button special">글 등록</a></li>
				</ul>
				<div class="table-wrapper">
					<table class="alt">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list}">
								<tr>
									<td>${item.bno}</td>
									<td><a href='view?bno=${item.bno}&page=${cri.page}'>${item.title}</td>
									<td>${item.writer}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
				<center>
					<ul class="pagination">
						
						
					</ul>
				</center>


			</div>
		</div>




		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Menu -->
				<nav id="menu"> <header class="major">
				<h2>Menu</h2>
				</header>
				<ul>
					<li><a href="index.html">Homepage</a></li>
					<li><a href="#">출결관리</a></li>
					<li><span class="opener">수강생 명단</span>

						<ul>
							<li><a href="#">친절한 진복씨</a></li>
							<li><a href="#">이준학 짱짱맨</a></li>
							<li><a href="#">Red 빈님</a></li>
						</ul></li>
					<li><a href="#">질문</a></li>
				</ul>
				</nav>


				<section> <header class="major">
				<h2>재학생 멘토</h2>
				</header>
				<p>현승우:</p>
				<p>여러분들의 무궁한 발전을 바라며,</p>
				<p>필요하다면 아래의 정보를 이용해주세요~</p>
				<ul class="contact">
					<li class="fa-envelope-o">hsu9643@naver.com</li>
					<li class="fa-phone">(010) 9544-9643</li>
					<li class="fa-home">창의 교육 하우스 4분반</li>
				</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
				<p class="copyright">&copy; OctorBirth.</p>
				</footer>

			</div>
		</div>

	</div>


	<!-- Scripts -->
	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/skel.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>

	<script src="/resources/js/pagefunc.js"></script>
	<script>
		var msg = '${result}';
		if (msg === 'success') {
			alert("작업처리 완료");
		}else if(msg === 'delsuccess'){
			alert("삭제 되었습니다.");
		}

		$(".pagination").on("click", "li", function(e){
			e.preventDefault();
			var pageNum = $(this).attr('data-page');
			if($(this).attr('data-page') !== 'none') {
				self.location="/board/list?page="+pageNum;
			}
		});
		
		var pageStr = makePage({
			total:${cri.total},
	        current:${cri.page},
	        pageSize:10
	    });
		
		$(".pagination").html(pageStr);
		
	</script>

</body>
</html>