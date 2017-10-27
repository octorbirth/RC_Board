<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
					<li><a href="/board/list">Home</a></li>
					<li><a href="/profile/management">프로필</a></li>
					<c:if test="${memberVO.admin == 'y'}">
					<li><a href="/attend/list">출결관리</a></li>
					<li><span class="opener">수강생 명단</span>
						<ul class="menteeUL">
						</ul></li>	
					</c:if>
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

	<script src="/resources/assets/js/jquery.min.js"></script>
	<script src="/resources/assets/js/skel.min.js"></script>
	<script src="/resources/assets/js/util.js"></script>
	<script src="/resources/assets/js/main.js"></script>

	<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>
	
	<script>
	var str = "";	
	$.getJSON("/board/listMentee/", function(arr){
        for(var i=0; i< arr.length; i++){	
        	str += "<li><a href='/profile/view?mid="+arr[i].mid+"'>"+arr[i].mname +"</a></li>"
        }
        $(".menteeUL").html(str);
  	});
	</script>
	
</body>

</html>