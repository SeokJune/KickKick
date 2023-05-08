<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplyForm</title>
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

<!-- gbn css -->
<link href="/css/gbn.css" rel="stylesheet" type="text/css">
<!-- kakao api -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a47338e87e3d914e6d508799cd4f4e17&libraries=services"></script>
<style>
* {
	font-family: 'NanumSquareNeoBold';
}

.container {
	width: 70%;
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
		<div class="container fluid shadow p-3 mb-5 bg-body-tertiary rounded">
			<h2 class="mb-5" style="text-align: center;">용병 신청</h2>
			<div class="row header">
				<div class="col-xs-12 col-md-4 col-xl-4 text-center">
					<img src="../image/${apply_info.logo_path}/${apply_info.logo}" class="mb-3"
						style="width: 100px; height: 100px; border-radius: 40px;">
					</div>
				<div class="col-xs-12 col-md-8 col-xl-8">
					<input type="hidden" id="team_code" name="team_code"
						value="${apply_info.team_code}" readonly>
					<div class="input-group mb-3">
						<span class="input-group-text">팀명</span> <input type="text"
							class="form-control" id="team_name" name="team_name"
							value="${apply_info.team_name}" readonly>
					</div>
					<div class="box">
						<div class="col-12 col-md-6 col-xl-6">
							<div class="input-group mb-3">
								<span class="input-group-text">팀장</span> <input type="text"
									class="form-control" id="name"
									value="${apply_info.member_name}" readonly>
							</div>
						</div>
						<div class="col-12 col-md-6 col-xl-6">
							<div class="input-group mb-3">
								<span class="input-group-text">연락처</span> <input type="text"
									class="form-control" id="phone"
									value="${apply_info.member_phone}" readonly>
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
								value="${apply_info.opposing_team_name}" readonly>
						</div>
					</div>
					<div class="col-12 col-md-6 col-xl-6">
						<input type="hidden" id="mercenary_registration_code"
							name="mercenary_registration_code" value="${apply_info.code}"
							readonly> <input type="hidden" id="ability_code"
							name="ability_code" value="${apply_info.ability_code}" readonly>
						<div class="input-group mb-3">
							<span class="input-group-text">요구 실력</span>
							<c:choose>
								<c:when test="${apply_info.ability_code == 1003}">
									<input type="text" class="form-control" value="하" readonly>
								</c:when>
								<c:when test="${apply_info.ability_code == 1002}">
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
						<input type="hidden" id="latirude" value="${apply_info.latirude}"
							readonly>
						<!-- 위도 -->
						<input type="hidden" id="longitude"
							value="${apply_info.longitude}" readonly>
						<!-- 경도 -->
						<div class="input-group mb-3">
							<span class="input-group-text">장소</span> <input type="text"
								class="form-control" id="match_place" name="match_place"
								readonly>
							<script>
								var geocoder = new kakao.maps.services.Geocoder();

								var coord = new kakao.maps.LatLng(${apply_info.latirude},${apply_info.longitude});
								var callback = function(result, status) {
									if (status === kakao.maps.services.Status.OK) {
										console.log(result[0].address.address_name);
										document.getElementById("match_place").value = result[0].address.address_name;
									}
								};

								geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
								</script>
						</div>
					</div>
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<%@page import="commons.DateCalculationUtils"%>
							<span class="input-group-text">일시</span> <input type="text"
								class="form-control" name="match_date"
								value="${DateCalculationUtils.date_format_timestamp(apply_info.competition_date)}"
								readonly>

						</div>
					</div>
				</div>
				<div class="box">
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">종목</span> <input type="text"
								class="form-control" id="competition_kind_name"
								name="competition_kind_name"
								value="${apply_info.competition_kind_name}" readonly>
						</div>
					</div>
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">총 인원수</span> <input type="text"
								class="form-control" name="competition_kind_headcount"
								value="${apply_info.competition_kind_headcount}" readonly>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="row body2">
				<div class="col-12 col-md-12 col-xl-12">
					<div class="input-group">
						<span class="input-group-text">소개글</span>
						<textarea class="form-control" name="content" id="content"
							placeholder="간단한 소개를 적어주세요." required></textarea>
					</div>
				</div>
			</div>
			<br>
			<div class="footer">
				<div class="col-xl-12 col-md-12 col-xs-12 text-center">
					<a><input type="submit" value="신청" class="btn btn-primary"></a>
					<a href="/to_register_list.mercenary?cpage=1"><input type="button"
						value="취소" class="btn btn-primary"></a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>