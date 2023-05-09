<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>KickKick</title>
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
<!-- gnb css -->
<link href="/commons/css/gnb.css" rel="stylesheet" type="text/css">

<!-- calender style -->
<link rel="stylesheet" href="/commons/calender/style.css">
<!-- calender js -->
<script src="/commons/calender/main.js"></script>

<style>
* {
	font-family: 'NanumSquareNeoBold';
}

.timeline {
	border-left: 1px solid hsl(0, 0%, 90%);
	position: relative;
	list-style: none;
}

.timeline .timeline-item {
	position: relative;
}

.timeline .timeline-item:after {
	position: absolute;
	display: block;
	top: 0;
}

.timeline .timeline-item:after {
	background-color: hsl(0, 0%, 90%);
	left: -38px;
	border-radius: 50%;
	height: 11px;
	width: 11px;
	content: "";
}
</style>
</head>

<body>
	<header>
		<!-- Global Navi Bar -->
		<c:import url="/commons/gnb.jsp">
		</c:import>
	</header>
	<main style="height: auto !important; margin-top: 100px;">
		<div class="container-fluid">
			<div class="container">
				<!-- 광고 -->
				<div class="row">
					<div class="col-lg-8">
						<!-- Details -->
						<div class="card mb-4">
							<div class="card-body">
								<div id="carouselExampleAutoplaying" class="carousel slide"
									data-bs-ride="carousel">
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img src="/image/index_img/soccer-ball-1.jpg"
												class="d-block card-img" alt="...">
										</div>
										<div class="carousel-item">
											<img src="/image/index_img/soccer-ball-2.jpg"
												class="d-block card-img" alt="...">
										</div>
										<div class="carousel-item">
											<img src="/image/index_img/soccer-ball-3.jpg"
												class="d-block card-img" alt="...">
										</div>
									</div>
									<button class="carousel-control-prev" type="button"
										data-bs-target="#carouselExampleAutoplaying"
										data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button"
										data-bs-target="#carouselExampleAutoplaying"
										data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>
								</div>
							</div>
						</div>
						<!--팀 랭킹 큰화면일때 사라짐-->
						<div class="card mb-4 d-block d-lg-none">
							<div class="card-body">
								<h3 class="h6">✨금주의 RANKER✨</h3>
								<p>팀 랭킹이 나타날 예정입니다</p>
								<p>기능 구현 X</p>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<!--팀 랭킹 작은화면일때 사라짐-->
						<div class="card mb-4 d-none d-lg-block">
							<div class="card-body">
								<h3 class="h6">✨금주의 RANKER✨</h3>
								<p>팀 랭킹이 나타날 예정입니다</p>
								<p>기능 구현 X</p>
							</div>
						</div>
						<div class="card mb-4">
							<!-- 스케쥴 - 미정 -->
							<!--내 일정 캘린더 나왔으면 좋겠음-->
							<!-- Section: Calender -->
							<section class="ftco-section">
								<div class="container">
									<div class="row">
										<div class="col-md-12">
											<div class="content w-100">
												<div class="calendar-container">
													<div class="calendar">
														<div class="year-header">
															<span class="left-button fa fa-chevron-left" id="prev">
															</span> <span class="year" id="label"></span> <span
																class="right-button fa fa-chevron-right" id="next">
															</span>
														</div>
														<table class="months-table w-100">
															<tbody>
																<tr class="months-row">
																	<td class="month">1월</td>
																	<td class="month">2월</td>
																	<td class="month">3월</td>
																	<td class="month">4월</td>
																	<td class="month">5월</td>
																	<td class="month">6월</td>
																	<td class="month">7월</td>
																	<td class="month">8월</td>
																	<td class="month">9월</td>
																	<td class="month">10월</td>
																	<td class="month">11월</td>
																	<td class="month">12월</td>
																</tr>
															</tbody>
														</table>

														<table class="days-table w-100">
															<td class="day">월</td>
															<td class="day">화</td>
															<td class="day">수</td>
															<td class="day">목</td>
															<td class="day">금</td>
															<td class="day">토</td>
															<td class="day">일</td>
														</table>
														<div class="frame">
															<table class="dates-table w-100">
																<tbody class="tbody">
																</tbody>
															</table>
														</div>
														<button class="button" id="add-button">일정보기</button>
													</div>
												</div>
												<div class="events-container"></div>
												<div class="dialog" id="dialog">
													<h2 class="dialog-header">일정 나올 예정</h2>
													<form class="form" id="form">
														<div class="form-container" align="center">
															<input class="input" type="text" id="name" maxlength="36">
															<label class="form-label" id="valueFromMyButton"
																for="count">Number of people to invite</label> 
															<input class="input" type="number" id="count" min="0" max="1000000" maxlength="7"> 
															<input type="button" value="닫기" class="button" id="cancel-button"> 
															<input type="button" value="OK" class="button button-white" id="ok-button">
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</section>
							<!-- Section: Calender -->
						</div>
					</div>
				</div>
				<div class="row">
					<!-- 공지사항 게시판 -->
					<div class="card mb-4">
						<div class="card-body text-center">
							<p>공지사항 게시판이 나올 예정입니다</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

</body>

</html>