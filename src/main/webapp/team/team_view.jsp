<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
* {
	box-sizing: border-box;
}

div {
	font-family: 'NanumSquareNeoBold';
}

.container-fluid {
	padding: 0px;
	background-color: whitesmoke;
}

#team_name {
	font-size: 30px;
}
#team_info {
	background-color: #FFFFFF;
	border: 5px solid #E6E6E6;
}
#team_introduce {
	text-align: center;
}

</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row team_info1">
			<div class="col-md-1 col-xl-2"></div>
			
			<div id="pic" class="col-xs-12 col-md-2 col-xl-1" style="display: flex; justify-content :center; align-items: center;">
				<img src="${team_info.logo_path}${team_info.logo}"
					style="width: 80px; height: 80px; border-radius: 40px;">
			</div>
			
			<div id="info" class="col-xs-12 col-md-9 col-xl-8" style="text-align: center;">
				<div class="row">
					<div class="col-12 col-md-3 col-xl-3" id="team_name">${team_info.name}</div>
				</div>
				<div class="row">
					<div class="col-12 col-md-3 col-xl-3">${team_info.member_name} | ${team_info.hometown_name}</div>
				</div>
				<div class="row">
					<div class="col-12 col-md-3 col-xl-3">승무패</div>
				</div>
			</div>
			
			<div class="col-xl-1"></div>
		</div>

		<div class="row empty_place d-none d-md-flex">
			<div class="col-12" style="height: 50px;"></div>
		</div>


		<div class="row team_info2">
			<div class="col-md-2 col-xl-2"></div>
				<div class="col-md-8 col-xl-8">
				
					<div class="row">
							<ul class="nav nav-tabs" style="text-align: center; padding-left: 6px; padding-right: 6px;">
								<li class="col-3 nav-item"><a class="nav-link active"
									data-toggle="tab" href="#team_introduce">팀소개</a></li>
								<li class="col-3 nav-item "><a class="nav-link" data-toggle="tab"
									href="#recode">전적</a></li>
								<li class="col-3 nav-item "><a class="nav-link" data-toggle="tab"
									href="#game_schedule">경기일정</a></li>
								<li class="col-3 nav-item "><a class="nav-link" data-toggle="tab"
									href="#community">커뮤니티</a></li>
							</ul>
					</div>
					
					<div class="row">
						<div class="col-12 tab-content" id="team_info">
							<div class="row tab-pane fade show active" id="team_introduce">
								<div class="col-12">${team_info.outline} << 간략소개글</div>
								<div class="col-12">${team_info.content} << 소개글</div>
							</div>
							<div class="row tab-pane fade" id="recode">
								<p>전적</p>
							</div>
							<div class="row tab-pane fade" id="game_schedule">
								<p>게임 스케줄</p>
							</div>
							<div class="row tab-pane fade" id="community">
								<p>커뮤니티</p>
							</div>
						</div>
					</div>
				</div>
			<div class="col-md-2 col-xl-2"></div>
		</div>
	</div>
	
	<script>
		 $(window).on("load", function() {
			 const bodySize = parseInt($(".container-fluid").css("width"));
			 if(bodySize<768) {
				 $("#pic").css({"justify-content":"center",
					 "align-items":"center"
				 }); 
				 $("#info").css("text-align","center"); 
				 
			}else if(bodySize>=768){
				$("#pic").css({"justify-content":"flex-end",
					"align-items":"flex-end"
				});
				$("#info").css("text-align","left"); 
			}
		})
		addEventListener("resize", function (event) {
			 const bodySize = parseInt($(".container-fluid").css("width"));
			 if(bodySize<768) {
				 $("#pic").css({"justify-content":"center",
					 "align-items":"center"
				 }); 
				 $("#info").css("text-align","center"); 
				 
			}else if(bodySize>=768){
				$("#pic").css({"justify-content":"flex-end",
					"align-items":"flex-end"
				});
				$("#info").css("text-align","left"); 
			}
		}) 
		
	</script>
</body>
</html>