<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>KickKick</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- JQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
	<nav class="navbar bg-body-tertiary fixed-top">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<a class="navbar-brand" href="/member/login_view.jsp">Login</a>
			<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header">
					<a href="/index.jsp">
						<h5 class="offcanvas-title" id="offcanvasNavbarLabel">KickKick</h5>
					</a>
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>
				<div class="offcanvas-body">
					<div class="list-group">
						<a href="#" class="list-group-item list-group-item-action list-group-item-primary">마이페이지</a>
						<a href="#" class="list-group-item list-group-item-action">내 정보 보기</a>
						<a href="#" class="list-group-item list-group-item-action">내 팀 보기</a>
						<a href="#" class="list-group-item list-group-item-action">내 활동 관리</a>
						<a href="#" class="list-group-item list-group-item-action list-group-item-primary">전체 게시판</a>
						<a href="/list.board?cpage=1" class="list-group-item list-group-item-action">공지사항</a>
						<a href="#" class="list-group-item list-group-item-action">자유게시판</a>
						<a href="#" class="list-group-item list-group-item-action">홍보게시판</a>
						<a href="#" class="list-group-item list-group-item-action list-group-item-primary">팀 카테고리</a>
						<a href="#" class="list-group-item list-group-item-action">팀 랭킹보기</a>
						<a href="#" class="list-group-item list-group-item-action">팀 생성하기</a>
						<a href="#" class="list-group-item list-group-item-action">팀 목록보기</a>
						<a href="#" class="list-group-item list-group-item-action">내 팀 게시판으로</a>
						<a href="#" class="list-group-item list-group-item-action list-group-item-primary">매치메이킹</a>
						<a href="#" class="list-group-item list-group-item-action">시설 검색</a>
						<a href="#" class="list-group-item list-group-item-action">용병 등록하기</a>
						<a href="#" class="list-group-item list-group-item-action">용병 목록보기</a>
						<a href="#" class="list-group-item list-group-item-action">매칭 등록하기</a>
						<a href="#" class="list-group-item list-group-item-action">매칭 목록보기</a>
						<a href="#" class="list-group-item list-group-item-action list-group-item-primary">운영진에게</a>
						<a href="#" class="list-group-item list-group-item-action">문의하기</a>
					</div>
				</div>
			</div>
		</div>
	</nav>
</body>

</html>