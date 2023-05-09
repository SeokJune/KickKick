<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KickKick - 경기 일정</title>
<!-- 부트스트랩 CSS CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- 부트스트랩 JQ , JS CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- 폰트 -->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<!-- awesome font -icon--->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Bootstrap - icon -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- sweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- JQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- gnb css -->
<link href="/commons/css/gnb.css" rel="stylesheet" type="text/css">

<!-- 공통 CSS -->
<style type="text/css">
html, body {
	background-color: #76b852;
	font-family: 'NanumSquareNeo';
}
</style>

<!-- contents CSS -->
<style type="text/css">
main {
<<<<<<< HEAD
   height: max-content;
}

.my_match_container {
   height: max-content;
}

.match_list_container {
   min-width: 478px;
   padding: 6%;
   margin-bottom: 5%;
   position: relative;
   background-color: whitesmoke;
   box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
      rgba(0, 0, 0, 0.19);
}

.nav-link {
   font-family: 'NanumSquareNeoExtraBold';
   font-size: large;
=======
	height: max-content;
}

.my_match_container {
	height: max-content;
}

.match_list_container {
	min-width: 478px;
	padding: 6%;
	margin-bottom: 5%;
	position: relative;
	background-color: whitesmoke;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
}

.nav-link {
	font-family: 'NanumSquareNeoExtraBold';
	font-size: large;
>>>>>>> 63d7cb45ee634af20be662ed863c6feb7b2f4f56
}
/*-------------------------------------------------------------------------*/
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
/*---------------------------------------------------------------------------*/
.my_team, .other_team {
<<<<<<< HEAD
   font-family: 'NanumSquareNeoExtraBold';
}

.match {
   height: max-content;
}

img {
   height: 50px;
   width: 50px;
=======
	font-family: 'NanumSquareNeoExtraBold';
}

.match {
	height: max-content;
}

img {
	height: 50px;
	width: 50px;
>>>>>>> 63d7cb45ee634af20be662ed863c6feb7b2f4f56
}
</style>

</head>
<body>
	<header>
		<c:import url="/commons/gnb.jsp">
		</c:import>
	</header>

	<main style="height: auto !important; margin-top: 75px;">
		<div class="container my_match_container">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<button class="nav-link text-dark" aria-current="page" id="my_team"
						onclick="location.href='/my_team_list.team'">내 팀</button>
				</li>
				<li class="nav-item">
					<button class="nav-link text-dark active" aria-current="page"
						id="my_comp" onclick="location.href='/my_match_list.member'">내
						경기</button>
				</li>
				<li class="nav-item">
					<button class="nav-link text-dark" aria-current="page" id="my_info"
						onclick="location.href='/my_profile.member'">내 정보</button>
				</li>
			</ul>

			<div class="container match_list_container h-100">

				<c:if test="${fn:length(match_list) == 0}">
					<div class="col-12 col-w-100 p-2 mt-3 ">
						<div class="card top-100 start-50 translate-middle">
							<div class="card-body text-center">
								<h3 class="card-title">경기 일정이 없어요!</h3>
							</div>
						</div>
					</div>
				</c:if>


				<c:if test="${fn:length(match_list) != 0}">

					<div
						class="row height d-flex justify-content-center align-items-center">
						<div class="col-md-10">
							<div class="search">
								<i class="fa fa-search"></i> <input type="text"
									class="form-control" placeholder="아직 검색 안됩니다." disabled>
								<button class="btn btn-primary">찾기</button>
							</div>
						</div>
					</div>
					<hr>

					<div class="row match position-relative">

						<c:forEach var="m" items="${match_list}">
							<div class="col-12 col-w-80 col-lg-6 col-md-w-50 p-2 ">
								<div class="card top-50 start-50 translate-middle">
									<div class="card-header">
										<span> 
											<fmt:formatDate pattern="yyyy년 MM월 dd일 a hh:mm" value="${m.competition_date}" />
										</span>
									</div>
									<div class="card-body text-center">
										<h5 class="card-title">
											<span class="my_team fs-4">${m.registration_team_name}</span>
											<span class="vs fs-6"> &ensp; VS &ensp; </span> <span
												class="other_team fs-4">${m.application_team_name}</span>
										</h5>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

				</c:if>

			</div>
		</div>

	</main>

</body>
</html>