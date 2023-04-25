<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
* {
	border: 1px solid black;
	box-sizing: border-box;
}
</style>
</head>

<body>
	<div class="container-fluid">

		<div class="row search">
			<div class="col-md-4"></div>

			<div class=" col-3 col-md-1"
				style="text-align: center; line-height: 58px;">
				<select>
					<option>팀명</option>
					<option>랭킹</option>
				</select>
			</div>

			<div class="col-9 col-md-3">
				<nav class="navbar navbar-light">
					<form class="d-flex" style="margin: auto;">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</nav>
			</div>

			<div class="col-md-4"></div>

		</div>

		<div class="row hr">
			<div class="col-md-1"></div>
			<div class="col-12 col-md-10">
				<hr style="border: 1px solid black;">
			</div>
			<div class="col-md-1"></div>
		</div>

		<div class="row gate_header" style="text-align: center; font-size: 13px">
				<div class="col-md-1 col-xl-1"></div>
				<div class="col-md-2 col-xl-1">이미지</div>
				<div class="col-xl-1 d-none d-xl-block">no</div>
				<div class="col-md-2 col-xl-1">팀명</div>
				<div class="col-md-4 col-xl-2">간략 소개글</div>
				<div class="col-md-1 col-xl-1">랭킹</div>
				<div class="col-md-1 col-xl-1">작성자</div>
				<div class="col-xl-2 d-none d-xl-block">작성일</div>
				<div class="col-xl-1 d-none d-xl-block">조회수</div>
				<div class="col-md-1 col-xl-1"></div>
		</div>

	</div>
</body>

</html>