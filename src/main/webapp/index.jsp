<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>KickKick</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>
<style>
</style>
</head>

<body>
<<<<<<< HEAD
	<button type="button" link="/login/login_view.jsp" onclick="link(this);">1</button>
	<button type="button" link="/aaa.aaa2" onclick="link(this);">2</button>
	<button type="button" link="/aaa.aaa3" onclick="link(this);">3</button>
	<button type="button" link="/aaa.aaa4" onclick="link(this);">4</button>
	<button type="button" link="/aaa.aaa5" onclick="link(this);">5</button>
	<button type="button" link="/aaa.aaa6" onclick="link(this);">6</button>
	<button type="button" link="/aaa.aaa7" onclick="link(this);">7</button>
	<script type="text/javascript">
	function link(evt) {
		location.href = evt.getAttribute('link');
	}
	</script>
=======
	<nav class="navbar bg-body-tertiary fixed-top">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
				aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<a class="navbar-brand" href="#">Login</a>
			<div class="offcanvas offcanvas-start" tabindex="-1"
				id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header">
					<a href="/index.jsp"><h5 class="offcanvas-title"
							id="offcanvasNavbarLabel">KickKick</h5></a>
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
						aria-label="Close"></button>
						
				</div>
				<div class="offcanvas-body">
					<div class="list-group">
						<a href="#"
							class="list-group-item list-group-item-action list-group-item-primary">마이페이지</a>
						<a href="#" class="list-group-item list-group-item-action">내
							정보 보기</a> <a href="#" class="list-group-item list-group-item-action">내
							팀 보기</a> <a href="#" class="list-group-item list-group-item-action">내
							활동 관리</a> <a href="#"
							class="list-group-item list-group-item-action list-group-item-primary">전체
							게시판</a> <a href="/list.board?cpage=1"
							class="list-group-item list-group-item-action">공지사항</a> <a
							href="#" class="list-group-item list-group-item-action">자유게시판</a>
						<a href="#" class="list-group-item list-group-item-action">홍보게시판</a>
						<a href="#"
							class="list-group-item list-group-item-action list-group-item-primary">팀
							카테고리</a> <a href="#" class="list-group-item list-group-item-action">팀
							랭킹보기</a> <a href="#" class="list-group-item list-group-item-action">팀
							생성하기</a> <a href="#" class="list-group-item list-group-item-action">팀
							목록보기</a> <a href="#" class="list-group-item list-group-item-action">내
							팀 게시판으로</a> <a href="#"
							class="list-group-item list-group-item-action list-group-item-primary">매치메이킹</a>
						<a href="#" class="list-group-item list-group-item-action">시설
							검색</a> <a href="#" class="list-group-item list-group-item-action">용병
							등록하기</a> <a href="#" class="list-group-item list-group-item-action">용병
							목록보기</a> <a href="#" class="list-group-item list-group-item-action">매칭
							등록하기</a> <a href="#" class="list-group-item list-group-item-action">매칭
							목록보기</a> <a href="#"
							class="list-group-item list-group-item-action list-group-item-primary">운영진에게</a>
						<a href="#" class="list-group-item list-group-item-action">문의하기</a>
					</div>
				</div>
			</div>
		</div>
	</nav>
>>>>>>> bed7230c5eb9257d0591c98721abf32088e41b9f
</body>

</html>