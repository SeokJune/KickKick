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
	<link href="/commons/css/gnb.css" rel="stylesheet" type="text/css">
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

.cf {
	background-color: whitesmoke;
	padding-top: 80px;
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
#ap {
	background-color: #D8D8D8; 	
	text-align: center;
}

#ap_input {
	width: 70%;
	height: 150px;
	
} 
#p4 {
	text-align: center;
}
</style>
</head>
<body>
<c:import url="/commons/gnb.jsp">
</c:import>

	<div class="container-fluid cf">
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
			
			
		<c:set var="doneLoop" value="false"/>
			<c:forEach var="i" items="${member_team_code}">
				<c:if test="${not doneLoop}">
					<c:choose>
					
						<c:when test="${team_info.member_code == member_code}">
							<c:set var="breakLoop" value="true"/>
							<div class="col-md-8 col-xl-8">
								<div class="row">
										<ul class="nav nav-tabs" style="text-align: center; padding-left: 6px; padding-right: 6px;">
											<li class="col-4 col-md-3 col-xl-2 nav-item"><a class="nav-link active"
												data-toggle="tab" href="#team_introduce">소개</a></li>
											<li class="col-2 d-none d-xl-block nav-item "><a class="nav-link" data-toggle="tab"
												href="#recode">전적</a></li>
											<li class="col-3 col-md-3 col-xl-2 d-none d-md-block nav-item "><a class="nav-link" data-toggle="tab"
												href="#game_schedule">경기일정</a></li>
											<li class="col-4 col-md-3 col-xl-3 nav-item"><a class="nav-link" data-toggle="tab"
												href="#community">커뮤니티</a></li>
											<li class="col-4 col-md-3 col-xl-3 nav-item "><a class="nav-link" data-toggle="tab"
												href="#application">받은신청</a></li>
										</ul>
								</div>
								
								<div class="row">
									<div class="col-12 tab-content" id="team_info">
										<div class="row tab-pane fade show active" id="team_introduce">
											<div class="col-12" style="font-size: 25px;">${team_info.outline}</div>
											<div class="col-12">${team_info.content}</div>
										</div>
										<div class="row tab-pane fade" id="recode">
											<p>미완성</p>
										</div>
										<div class="row tab-pane fade" id="game_schedule">
											<p>미완성</p>
										</div>
										<div class="row tab-pane fade" id="community">
											<p>미완성</p>
										</div>
										<div class="row tab-pane fade" id="application">
											<div id="p4" class="col-12">
											<c:choose>
													<c:when test="${team_ap.size() == 0 }">
														<hr>
															<div class="row">
																<div class="col-12">당신의 팀에 가입하고 싶은 유저가 없네요..ㅠㅠ</div>
															</div>
														<hr>
													</c:when>
													<c:otherwise>
														<div class="row">
														<div class="col-4 col-xl-2">신청자</div>
														<div class="col-xl-5 d-none d-xl-block">소개글</div>
														<div class="col-4 col-xl-3">연락처</div>
														<div class="col-4 col-xl-2">수락/거절</div>
													</div>
														<c:forEach var="ap" items="${team_ap}">
														<hr>
															<div class="row">
																<div class="col-4 col-xl-2">${ap.nickname}</div>
																<div class="col-xl-5  d-none d-xl-block">${ap.content}</div>
																<div class="col-4 col-xl-3">${ap.phone}</div>
																<div class="col-2 col-xl-1" style="text-align: right;"><button id="btn1">수락</button></div>
																<div class="col-2 col-xl-1" style="text-align: left;"><button id="btn2">거절</button></div>
															</div>
														<hr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</div>
							</div>
							<c:set var="doneLoop" value="true"/>
						</c:when>
						
						
						<c:when test="${i == team_info.code}">
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
												href="#community">팀원</a></li>
										</ul>
								</div>
								
								<div class="row">
									<div class="col-12 tab-content" id="team_info">
										<div class="row tab-pane fade show active" id="team_introduce">
											<div class="col-12">${team_info.outline}</div>
											<div class="col-12">${team_info.content}</div>
										</div>
										<div class="row tab-pane fade" id="recode">
											<p>미완성</p>
										</div>
										<div class="row tab-pane fade" id="game_schedule">
											<p>미완성</p>
										</div>
										<div class="row tab-pane fade" id="community">
											<p>미완성</p>
										</div>
									</div>
								</div>
							</div>
							<c:set var="doneLoop" value="true"/>
							</c:when>
							
							
							<c:otherwise>
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
												href="#community">가입신청</a></li>
										</ul>
								</div>
								
								<div class="row">
									<div class="col-12 tab-content" id="team_info">
										<div class="row tab-pane fade show active" id="team_introduce">
											<div class="col-12">${team_info.outline}</div>
											<div class="col-12">${team_info.content}</div>
										</div>
										<div class="row tab-pane fade" id="recode">
											<p>미완성</p>
										</div>
										<div class="row tab-pane fade" id="game_schedule">
											<p>미완성</p>
										</div>
										<div class="row tab-pane fade" id="community">
										
										<c:choose>
											<c:when test="${member_status==1001}">
												<div class="col-12" style="text-align: center;">신청 대기중 입니다.</div>
											</c:when>
											<c:otherwise>
												<div id="ap" class="col-12">
													<div class="row" id="question">
														<div class="col-2"></div>
														<div class="col-2">자기소개</div>
														<div class="col-8"></div>
													</div>
													<form action="/ap_member.team" id="ap_frm">
														<div class="row">
															<div class="col-1"></div>
															<div class="col-10"><textarea id="ap_input" name="ap_input" placeholder="30자 이하..."></textarea></div>
															<div class="col-1"></div>
															<input type="hidden" value="${team_info.code}" name="team_code">
														</div>
														<div class="row">
															<div class="col-4"></div>
															<div class="col-4"><button>신청하기</button></div>
															<div class="col-4"></div>
														</div>
													</form>
												</div>
											</c:otherwise>
										</c:choose>
											
										</div>
									</div>
								</div>
							</div>
							<c:set var="doneLoop" value="true"/>
						</c:otherwise>
					</c:choose>
					</c:if>
				</c:forEach> 

			<div class="col-md-2 col-xl-2"></div>
		</div>
	</div>
	
	<script>
		$("#btn1").on("click", function() {
			alert("미완성...ㅠㅠ");
		})
		$("#btn2").on("click", function() {
			alert("미완성...ㅠㅠ");
		})
	
	
	// 팀 가입 신청하기 눌렀을 때 유효성 검사
	
		let ap_input_regex = /^.{0,30}$/;
		
		$("#ap_frm").on("submit", function() {

			if($("#ap_input").val().trim() == "") {
				alert("소개글을 입력하세요.");
				$("#ap_input").focus;
				return false;
			}
			else if(ap_input_regex.test($("#ap_input").val()) == false) {
				alert("다시 입력하세요(30자 이하)");
				$("#ap_input").focus;
				return false;
			} 
		})
	
		// 브라우저 크기 별 style 값 다르게 주기
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