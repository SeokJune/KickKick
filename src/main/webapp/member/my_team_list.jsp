<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- JQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap - CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- Bootstrap - JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- Bootstrap - icon -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- Font 기본 : {font-family: 'NanumSquareNeoBold'}-->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<!-- awesome font -icon--->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!--Popper Development version -->
<script src="https://unpkg.com/@popperjs/core@2"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>

<!-- sweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- gbn css -->
<link href="/css/gbn.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<style>
* {
	font-family: 'NanumSquareNeoBold';
}

.search {
	position: relative;
	box-shadow: 0 0 40px rgba(51, 51, 51, .1);
}

.search input {
	height: 60px;
	text-indent: 25px;
	border: 2px solid #d6d4d4;
}

.search input:focus {
	box-shadow: none;
	border: 2px solid blue;
}

.search .fa-search {
	position: absolute;
	top: 20px;
	left: 16px;
}

.search button {
	position: absolute;
	top: 5px;
	right: 5px;
	height: 50px;
	width: 110px;
}

.card {
	margin-bottom: 1rem;
}
<!-- 990px 이상 -->
@media (min-width: 990px){
	.card{
	}
}
</style>
</head>
<body>
	<header>
		<c:import url="/commons/gbn.jsp">
		</c:import>
	</header>
	<main style="height: auto !important; margin-top: 100px;">
		<div class="container">
			<div class="header">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-title text-center">
							<div class="title-text">
								<h2>내 팀 리스트</h2>
							</div>
						</div>
					</div>
					<!--col end-->
				</div>
				<!-- row end-->
				<div
					class="row height d-flex justify-content-center align-items-center">
					<div class="col-md-8">
						<div class="search">
							<i class="fa fa-search"></i> <input type="text"
								class="form-control" placeholder="찾을 팀을 검색해보세요">
							<button class="btn btn-primary">찾기</button>
						</div>
					</div>
				</div>
				<div class="row">
					<ul class="nav custom-tab" id="myTab" role="tablist">
						<li class="nav-item"><a class="nav-link active show"
							id="home-taThursday" data-toggle="tab" href="#home" role="tab"
							aria-controls="home" aria-selected="true">Day 1</a></li>
						<li class="nav-item"><a class="nav-link" id="profile-tab"
							data-toggle="tab" href="#profile" role="tab"
							aria-controls="profile" aria-selected="false">Day 2</a></li>
						<li class="nav-item"><a class="nav-link" id="contact-tab"
							data-toggle="tab" href="#contact" role="tab"
							aria-controls="contact" aria-selected="false">Day 3</a></li>
						<li class="nav-item d-none d-lg-block"><a class="nav-link"
							id="sunday-tab" data-toggle="tab" href="#sunday" role="tab"
							aria-controls="sunday" aria-selected="false">Day 4</a></li>
						<li class="nav-item mr-0 d-none d-lg-block"><a
							class="nav-link" id="monday-tab" data-toggle="tab" href="#monday"
							role="tab" aria-controls="monday" aria-selected="false">Day 5</a>
						</li>
					</ul>

				</div>
			</div>
			<!-- header -->
			<div class="body">
				<div class="row row-cols-1 row-cols-lg-2 row-cols-xl-4">
					<c:forEach var="team" items="${team_list}">
						<form action="#">
						<!-- 서블릿 : /goto_my_team.member -->
							<div class="col">
								<div class="card radius-15" style="width: 43.375rem;">
									<div class="p-4 border radius-15">
										<img src="/image/login_img/ball_icon.png" width="110"
											height="110" class="rounded-circle shadow" alt="">
										<h5 class="team-name mb-0 mt-5">${team.name}</h5>
										<p class="team-hometown mb-3">${team.hometown_code}</p>
										<p class="team-reader">팀장 : ${team.member_code}</p>
										<input type="text" class="d-none" name="team_code"
											value="${team.code}">
										<div class="go-to-team d-grid">
											<a href="#" class="btn btn-outline-primary radius-15">팀
												페이지로</a>
										</div>
									</div>
								</div>
							</div>
						</form>
					</c:forEach>
					<div class="col">
						<div class="card radius-15" style="width: 43.375rem;">
							<div class="card-body text-center">
								<div class="p-4 border radius-15">
									<img src="/image/login_img/ball_icon.png" width="110"
										height="110" class="rounded-circle shadow" alt="">
									<h5 class="team-name mb-0 mt-5">Team Name1</h5>
									<p class="team-hometown mb-3">서울특별시</p>
									<p class="team-reader">팀장 : 김리더</p>
									<input type="text" class="d-none" name="team_code"
										value="${team.code}">
									<div class="d-grid">
										<a href="#" class="btn btn-outline-primary radius-15">팀
											게시판으로</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card radius-15" style="width: 43.375rem;">
							<div class="card-body text-center">
								<div class="p-4 border radius-15">
									<img src="/image/login_img/ball_icon.png" width="110"
										height="110" class="rounded-circle shadow" alt="">
									<h5 class="team-name mb-0 mt-5">Team Name2</h5>
									<p class="team-hometown mb-3">부산광역시</p>
									<p class="team-reader">팀장 : 이리더</p>
									<div class="d-grid">
										<a href="#" class="btn btn-outline-primary radius-15">팀
											게시판으로</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card radius-15" style="width: 43.375rem;">
							<div class="card-body text-center">
								<div class="p-4 border radius-15">
									<img src="/image/login_img/ball_icon.png" width="110"
										height="110" class="rounded-circle shadow" alt="">
									<h5 class="team-name mb-0 mt-5">Team Name3</h5>
									<p class="team-hometown mb-3">대구광역시</p>
									<p class="team-reader">팀장 : 대리더</p>
									<div class="d-grid">
										<a href="#" class="btn btn-outline-primary radius-15">팀
											게시판으로</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card radius-15" style="width: 43.375rem;">
							<div class="card-body text-center">
								<div class="p-4 border radius-15">
									<img src="/image/login_img/ball_icon.png" width="110"
										height="110" class="rounded-circle shadow" alt="">
									<h5 class="team-name mb-0 mt-5">Team Name4</h5>
									<p class="team-hometown mb-3">인천광역시</p>
									<p class="team-reader">팀장 : 인리더</p>
									<div class="d-grid">
										<a href="#" class="btn btn-outline-primary radius-15">팀
											게시판으로</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- body -->
			</div>
			<!-- body -->
			<div class="footer mt-3">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a>
						</li>
					</ul>
				</nav>
			</div>
			<!-- footer -->
		</div>
	</main>

</body>
</html>