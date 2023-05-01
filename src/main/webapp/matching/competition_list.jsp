<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
	
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
	
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css"
	integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
* {
	box-sizing: border-box;
	text-align: center;
}

h4 {
	border: 1px solid rgb(66, 66, 159);
}

p {
	border: 1px solid rgb(66, 66, 159);
}
</style>
</head>
<body>
	<div class="container-fluid">

		<div class="row header">
			<div class="col-4 " style="height: 60px;">
				<select size="1" class="w-100 h-75">
					<option selected>지역선택</option>
					<option>노원구</option>
					<option>도봉구</option>
				</select>
			</div>


			<div class="col-1"></div>

			<div class="col-7" style="height: 60px;">

				<div class="row w-100 h-75">
					<input class="col-9" type="text" placeholder="팀명 검색">
					<button class="col-3">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>

			</div>



		</div>

		<div class="row body">

			<div class=" col-12 card mb-4 w-100">
				<div class="row g-0">
					<div class="col-md-4">

						<div class="w-25" style="border: 1px solid black;">경기종류</div>
						<img src="/image/competition_img/team_logo.png" class="img-fluid rounded-start">
					</div>
					<div class="col-md-8">
						<div class="card-body h-100">
							<h4 class="card-title">팀 명</h4>
							<p class="card-text">팀장 연락처</p>
							<p class="card-text">상태정보글(status)</p>
							<p class="card-text">장소 및 일시</p>
						</div>
					</div>
				</div>
			</div>


			<div class=" col-12 card mb-4 w-100">
				<div class="row g-0">
					<div class="col-md-4">

						<div class="w-25" style="border: 1px solid black;">경기종류</div>
						<img src="/image/competition_img/team_logo.png" class="img-fluid rounded-start">
					</div>
					<div class="col-md-8">
						<div class="card-body h-100">
							<h4 class="card-title">팀 명</h4>
							<p class="card-text">팀장 연락처</p>
							<p class="card-text">상태정보글(status)</p>
							<p class="card-text">장소 및 일시</p>
						</div>
					</div>
				</div>
			</div>


			<div class=" col-12 card mb-4 w-100">
				<div class="row g-0">
					<div class="col-md-4">

						<div class="w-25" style="border: 1px solid black;">경기종류</div>
						<img src="/image/competition_img/team_logo.png" class="img-fluid rounded-start">
					</div>
					<div class="col-md-8">
						<div class="card-body h-100">
							<h4 class="card-title">팀 명</h4>
							<p class="card-text">팀장 연락처</p>
							<p class="card-text">상태정보글(status)</p>
							<p class="card-text">장소 및 일시</p>
						</div>
					</div>
				</div>
			</div>


			<div class=" col-12 card mb-4 w-100">
				<div class="row g-0">
					<div class="col-md-4">

						<div class="w-25" style="border: 1px solid black;">경기종류</div>
						<img src="/image/competition_img/team_logo.png" class="img-fluid rounded-start">
					</div>
					<div class="col-md-8">
						<div class="card-body h-100">
							<h4 class="card-title">팀 명</h4>
							<p class="card-text">팀장 연락처</p>
							<p class="card-text">상태정보글(status)</p>
							<p class="card-text">장소 및 일시</p>
						</div>
					</div>
				</div>
			</div>


			<div class=" col-12 card mb-4 w-100">
				<div class="row g-0">
					<div class="col-md-4">

						<div class="w-25" style="border: 1px solid black;">경기종류</div>
						<img src="/image/competition_img/team_logo.png" class="img-fluid rounded-start">
					</div>
					<div class="col-md-8">
						<div class="card-body h-100">
							<h4 class="card-title">팀 명</h4>
							<p class="card-text">팀장 연락처</p>
							<p class="card-text">상태정보글(status)</p>
							<p class="card-text">장소 및 일시</p>
						</div>
					</div>
				</div>
			</div>




		</div>



		<div class="row footer">

			<div style="font-size: 25px;" class="col-12" colspan="5"
				align="center">1 2 3 4 5 6 7 8 9 10</div>

		</div>

	</div>
</body>
</html>