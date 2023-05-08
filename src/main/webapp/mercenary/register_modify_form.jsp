<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegisterModifyForm</title>
<!-- JQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap - CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- Bootstrap - JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- Bootstrap - icon -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
<!-- Font 기본 : {font-family: 'NanumSquareNeoBold'}-->
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">

<!-- gbn css -->
<link href="/commons/css/gnb.css" rel="stylesheet" type="text/css">
<!-- awesome font -icon--->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- kakao api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a47338e87e3d914e6d508799cd4f4e17&libraries=services"></script>
<style>

div {
	font-family: 'NanumSquareNeoBold';
}

.container{
	width: 70%;
	margin-top: 150px;
}

.team2>div {
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
<c:import url="/commons/gnb.jsp">
	</c:import>
	<form id="form" action="/modify_mercenary_register.mercenary?cpage=${ctPage}" method="post">
		<div class="container fluid shadow p-3 mb-5 bg-body-tertiary rounded">
		<h2 class="mb-5" style="text-align:center;">용병 등록</h2>
			
			<div class="row team1">
				<div class="col-xs-12 col-md-4 col-xl-4 text-center">
				<input type="hidden" id="logo_path" name="logo_path" value="${modify_form_info.logo_path}" required readonly>
				<input type="hidden" id="logo" name="logo" value="${modify_form_info.logo}" readonly>
					<div id="team_logo"></div>
					<script>
						var team_logo = document.getElementById("team_logo");
						
						var logo_path = document.getElementById("logo_path").value;
						var logo = document.getElementById("logo").value;
						
						var img = document.createElement("img");
						img.src = "../image/"+logo_path+"/"+logo;
						img.width = "100";
						img.height = "100";
						
						team_logo.appendChild(img);
					</script>
				</div>
				<div class="col-xs-12 col-md-8 col-xl-8">
					<input type="hidden" id="code" name="code" value="${modify_form_info.code}" required readonly>
					<input type="hidden" id="competition_registration_code" name="competition_registration_code" required readonly>
					<div class="input-group mb-3">
						<span class="input-group-text">팀명</span> <input type="text"
							class="form-control" id="name" name="name" value="${modify_form_info.team_name}" required readonly>
					</div>
					<div class="box">
						<div class="col-12 col-md-6 col-xl-6">
							<div class="input-group mb-3">
								<span class="input-group-text">팀장</span> <input type="text"
									class="form-control" id="member_name" value="${modify_form_info.member_name}" required readonly>
							</div>
						</div>
						<div class="col-12 col-md-6 col-xl-6">
							<div class="input-group mb-3">
								<span class="input-group-text">연락처</span> <input type="text"
									class="form-control" id="member_phone" value="${modify_form_info.member_phone}" required readonly>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="row match1">
				
				<div class="box">
					<div class="col-12 col-md-6 col-xl-6">
					<input type="hidden" id="latirude" value="${modify_form_info.latirude}" readonly> <!-- 위도 -->
					<input type="hidden" id="longitude" value="${modify_form_info.longitude}" readonly> <!-- 경도 -->
						<div class="input-group mb-3">
							<span class="input-group-text">장소</span> <input type="text"
								class="form-control" id="match_place" name="match_place"
								required readonly>
						<script>
							var geocoder = new kakao.maps.services.Geocoder();

							var coord = new kakao.maps.LatLng(${modify_form_info.latirude},${modify_form_info.longitude});
							var callback = function(result, status) {
								if (status === kakao.maps.services.Status.OK) {
									document.getElementById("match_place").value = result[0].address.address_name;
								}
							};

							geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
						</script>
						</div>
					</div>
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">일시</span> 
							<%@page import="commons.DateCalculationUtils"%>
							<input type="text" class="form-control" id="competition_date" name="competition_date"
							 value="${DateCalculationUtils.date_format_timestamp(modify_form_info.competition_date)}" required readonly>
						</div>
					</div>
				</div>
				<div class="box">
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">종목</span> <input type="text"
								class="form-control" id="competition_kind_name" name="competition_kind_name" 
								value="${modify_form_info.competition_kind_name}"required readonly>
						</div>
					</div>
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">총 인원수</span> <input type="text"
								class="form-control" id="competition_kind_headcount" name="competition_kind_headcount" 
								value="${modify_form_info.competition_kind_headcount}" required readonly>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="row match2">
				<div class="box">
					<div class="col-12 col-md-6 col-xl-6 text-center">
						실력 <select class="form-select" name="ability" required>
							<option value="" selected>-- 선택해주세요 --</option>
							<option value="1001">상</option>
							<option value="1002">중</option>
							<option value="1003">하</option>
						</select>
					</div>
					<div class="col-12 col-md-6 col-xl-6 text-center">
					<!-- <input type="hidden" id="competition_kind_headcount" readonly>--> 
						인원수 <select class="form-select" id="people_count" name="people_count" required>
							<option value="" selected>-- 선택해주세요 --</option>
						</select>
					</div>
				</div>
			</div>
			<br>
			<div class="buttons">
				<div class="col-xl-12 col-md-12 col-xs-12 text-center">
					<a><input type="submit" value="수정" id="register_btn" class="btn btn-primary"></a>
					<a href="/to_register_list.mercenary?cpage=${ctPage}"><input type="button" value="취소"
						class="btn btn-primary"></a>
				</div>
			</div>
			<br>
		</div>
	</form>
	<script>
		
		// 받은 총 인원 수에 따라 용병 인원수 조절
		var objSel = document.getElementById("people_count");
		var objOption = document.createElement("option");
		objOption.text = "1";
		objOption.value = "1";

		var objOption2 = document.createElement("option");
		objOption2.text = "2";
		objOption2.value = "2";

		objSel.options.add(objOption);
		objSel.options.add(objOption2);
		if ($("#competition_kind_headcount").val() >= 9) {
			var objOption3 = document.createElement("option");
			objOption3.text = "3";
			objOption3.value = "3";

			var objOption4 = document.createElement("option");
			objOption4.text = "4";
			objOption4.value = "4";

			objSel.options.add(objOption3);
			objSel.options.add(objOption4);
		}
		
	</script>
</body>
</html>