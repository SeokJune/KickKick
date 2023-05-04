<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KickKick - 경기 일정</title>
	<!-- 부트스트랩 CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- 부트스트랩 JQ , JS CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<!-- 폰트 -->	
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
	<!-- awesome font -icon--->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<!-- Bootstrap - icon -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
	<!-- sweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- JQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- gbn css -->
<link href="/css/gbn.css" rel="stylesheet" type="text/css">
<style>
body {
	font-family: 'NanumSquareNeo';
}
.my_match_container {
	min-width: 478px;
	width:80%;
	height: max-content;
	padding: 32px;
	margin-top: 5%;
	margin-bottom: 5%;
	position: relative;
	background-color: whitesmoke;
	border-radius: 1rem;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
}
.nav-link{
font-family: 'NanumSquareNeoExtraBold';
font-size:large;
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
.my_team,.other_team{
font-family: 'NanumSquareNeoExtraBold';
}
.match{
height:150px;
}
img{
height:50px;
width:50px;
}
</style>

</head>
<body>
	<header>
		<c:import url="/commons/gbn.jsp">
		</c:import>
	</header>
	
	<main style="height: auto !important; margin-top: 75px;">
		<div class="container">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link text-dark"
					aria-current="page" href="#">내 팀</a></li>
				<li class="nav-item"><a class="nav-link active" 
					aria-current="page" href="#">내 경기</a></li>
				<li class="nav-item"><a class="nav-link text-dark"
					aria-current="page" href="/my_profile.member">내 정보</a></li>
			</ul>
				
				<!-- 내 경기 일정 -->
				
			<div class="container my_match_container">
			
				<div class="row height d-flex justify-content-center align-items-center">
					<div class="col-md-8">
						<div class="search">
							<i class="fa fa-search"></i> <input type="text"
								class="form-control" placeholder="찾을 팀을 검색해보세요">
							<button class="btn btn-primary">찾기</button>
						</div>
					</div>
				</div>
				<hr>
				
				<div class="row match position-relative">
					<div class="col-12 ">
						<div class="card position-absolute top-50 start-50 translate-middle" style="width: 35rem;">
							<div class="card-header">
					    		<span>2023년 5월 03일 18:00</span>
					    		 <a href="#" class="btn btn-sm btn-outline-secondary">자세히</a>
					    	</div>
					  		<div class="card-body text-center">
					    		<h5 class="card-title">
					    			<span class="my_team">내팀명</span>   
					    			<span class="vs"> VS </span>   
					    			<span class="other_team">상대팀명</span>
					    		</h5>
					  		</div>
						</div>
					</div>
				</div>
				
				<div class="row match position-relative">
					<div class="col-12 ">
						<div class="card position-absolute top-50 start-50 translate-middle" style="width: 35rem;">
							<div class="card-header">
					    		2023년 5월 03일 18:00
					    	</div>
					  		<div class="card-body text-center">
					    		<h5 class="card-title">
					    			<span class="my_team">내팀명</span>   
					    			<span class="vs"> VS </span>   
					    			<span class="other_team">상대팀명</span>
					    		</h5>
					  		</div>
						</div>
					</div>
				</div>
			</div>	
	
	
			
			
			
			
		</div>	
	</main>
	<script>
		
		
	
	
	</script>
</body>
</html>