<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplyForm</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
*{font-family: 'NanumSquareNeoBold';}
div {
	border: 1px solid black;
}

.header>div {
	float: left;
}

.box>div {
	float: left;
}

.btn {
	border: none;
}
</style>
</head>
<body>
	<form action="/to_mercenary_apply.mercenary" method="post">
		<div class="container fluid">

			<div class="row header">
				<div class="col-xs-12 col-md-4 col-xl-4 text-center">
					<input type="hidden" id="logo_path" name="logo_path" value="${team_info.logo_path}" readonly>
					<input type="hidden" id="logo" name="logo" value="${team_info.logo}" readonly>
					<c:choose>
						<c:when test="${team_info.logo.equals('')}">
							<div>${team_info.logo_path}</div>
						</c:when>
						<c:otherwise>
							<div>${team_info.logo_path}\${team_info.logo}</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-xs-12 col-md-8 col-xl-8">
					<input type="hidden" id="team_code" name="team_code"
						value="${team_info.code}" readonly>
					<div class="input-group mb-3">
						<span class="input-group-text">팀명</span> <input type="text"
							class="form-control" id="team_name" name="team_name"
							value="${team_info.name}" readonly>
					</div>
					<div class="box">
						<div class="col-12 col-md-6 col-xl-6">
							<div class="input-group mb-3">
								<span class="input-group-text">팀장</span> <input type="text"
									class="form-control" id="name" value="${team_info.member_name}"
									readonly>
							</div>
						</div>
						<div class="col-12 col-md-6 col-xl-6">
							<div class="input-group mb-3">
								<span class="input-group-text">연락처</span> <input type="text"
									class="form-control" id="phone"
									value="${team_info.member_phone}" readonly>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="row body1">
				<div class="box">
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">상대 팀명</span> <input type="text"
								class="form-control" name="opponent_team"
								value="${opponent_team}" readonly>
						</div>
					</div>
					<div class="col-12 col-md-6 col-xl-6">
					<input type="hidden" id="mercenary_registration_code" name="mercenary_registration_code"
							value="${code}" readonly>
						<input type="hidden" id="ability_code" name="ability_code"
							value="${ability_code}" readonly>
						<div class="input-group mb-3">
							<span class="input-group-text">요구 실력</span>
							<c:choose>
								<c:when test="${ability_code == 1003}">
									<input type="text" class="form-control" value="하" readonly>
								</c:when>
								<c:when test="${ability_code == 1002}">
									<input type="text" class="form-control" value="중" readonly>
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" value="상" readonly>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<div class="box">
					<div class="col-12 col-md-6 col-xl-6">
						<input type="hidden" id="latirude" readonly>
						<!-- 위도 -->
						<input type="hidden" id="longitude" readonly>
						<!-- 경도 -->
						<div class="input-group mb-3">
							<span class="input-group-text">장소</span> <input type="text"
								class="form-control" id="match_place" name="match_place"
								readonly>
						</div>
					</div>
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">일시</span> <input type="text"
								class="form-control" name="match_date"
								value="${match_info.competition_date}" readonly>
						</div>
					</div>
				</div>
				<div class="box">
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">종목</span> <input type="text"
								class="form-control" id="competition_kind_name"
								name="competition_kind_name"
								value="${match_info.competition_kind_name}" readonly>
						</div>
					</div>
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">총 인원수</span> <input type="text"
								class="form-control" name="competition_kind_headcount"
								value="${match_info.competition_kind_headcount}" readonly>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="row body2">
				<div class="col-12 col-md-12 col-xl-12">
					<div class="input-group">
						<span class="input-group-text">소개글</span>
						<textarea class="form-control" name="contents" id="contents"
							placeholder="간단한 소개를 적어주세요."></textarea>
					</div>
				</div>
			</div>
			<div class="footer">
				<div class="col-xl-12 col-md-12 col-xs-12 text-center">
					<a><input type="submit" value="신청" class="btn btn-primary"></a>
					<a href="/to_register_list.mercenary"><input type="button"
						value="취소" class="btn btn-primary"></a>
				</div>
			</div>
		</div>
	</form>
	<script>
		survey('#latirude', function() {
			var latirude = document.getElementById("latirude");
			var longitude = document.getElementById("longitude");
			var geocoder = new kakao.maps.services.Geocoder();
	
			var coord = new kakao.maps.LatLng(latirude, longitude);
			var callback = function(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			        console.log(result[0].address.address_name);
			        document.getElementById("match_place").innerHTML=result[0].address.address_name;
			    }
			};

			geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
		})
		/*
		survey('#ability_code', function() {
			var ability = document.getElementById("ability").value;
			if(document.getElementById("ability_code").value == 1003){
				ability = "하";
			}else if(document.getElementById("ability_code").value == 1002){
				ability = "중";
			}else {
				ability = "상";
			}
		});
		*/
		function survey(selector, callback) {
			var input = $(selector);
			var oldvalue = input.val();
			setInterval(function() {
				if (input.val() != oldvalue) {
					oldvalue = input.val();
					callback();
				}
			}, 100);
		}
		
		
		
	</script>
</body>
</html>