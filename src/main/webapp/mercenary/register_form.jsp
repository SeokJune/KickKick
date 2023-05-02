<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegisterForm</title>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a47338e87e3d914e6d508799cd4f4e17&libraries=services"></script>
<style>
div {
	font-family: 'NanumSquareNeoBold';
}

.header2>div {
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
	<form action="/to_mercenary_register.mercenary" method="post">
		<div class="container fluid">

			<div class="row header1">
				<div>
					<button type="button" id="team_select"
						class="btn btn-primary btn-sm" style="background-color: #0455BF;">팀
						선택</button>
				</div>
			</div>
			<div class="row header2">
				<div class="col-xs-12 col-md-4 col-xl-4 text-center">
					<div id="team_logo">img</div>
				</div>
				<div class="col-xs-12 col-md-8 col-xl-8">
					<input type="hidden" id="code" name="code" readonly>
					<input type="hidden" id="competition_registration_code" name="competition_registration_code" readonly>
					<div class="input-group mb-3">
						<span class="input-group-text">팀명</span> <input type="text"
							class="form-control" id="name" name="name" readonly>
					</div>
					<div class="box">
						<div class="col-12 col-md-6 col-xl-6">
							<div class="input-group mb-3">
								<span class="input-group-text">팀장</span> <input type="text"
									class="form-control" id="member_name" readonly>
							</div>
						</div>
						<div class="col-12 col-md-6 col-xl-6">
							<div class="input-group mb-3">
								<span class="input-group-text">연락처</span> <input type="text"
									class="form-control" id="member_phone" readonly>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="row body1">
				<div>
					<button type="button" id="match_select"
						class="btn btn-primary btn-sm">경기 선택</button>
				</div>
				<div class="box">
					<div class="col-12 col-md-6 col-xl-6">
					<input type="hidden" id="latirude" readonly> <!-- 위도 -->
					<input type="hidden" id="longitude" readonly> <!-- 경도 -->
						<div class="input-group mb-3">
						<script>
						var geocoder = new kakao.maps.services.Geocoder();

						var coord = new kakao.maps.LatLng(${"#latirude"},${"#longitude"});
						var callback = function(result, status) {
							if (status === kakao.maps.services.Status.OK) {
								console.log(result[0].address.address_name);
								document.getElementById("match_place_"+${"#code"}).innerHTML = result[0].address.address_name;
							}
						};

						geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
						</script>
							<span class="input-group-text">장소</span> <input type="text"
								class="form-control" id="match_place_"${"#code"} name="match_place"
								readonly>
						</div>
					</div>
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">일시</span> <input type="text"
								class="form-control" id="competition_date" name="competition_date" readonly>
						</div>
					</div>
				</div>
				<div class="box">
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">종목</span> <input type="text"
								class="form-control" id="competition_kind_name" name="competition_kind_name"
								readonly>
						</div>
					</div>
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">총 인원수</span> <input type="text"
								class="form-control" id="competition_kind_headcount" name="competition_kind_headcount" readonly>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="row body2">
				<div class="box">
					<div class="col-12 col-md-6 col-xl-6 text-center">
						실력 <select class="form-select" name="ability">
							<option value="" selected>-- 선택해주세요 --</option>
							<option value="1001">상</option>
							<option value="1002">중</option>
							<option value="1003">하</option>
						</select>
					</div>
					<div class="col-12 col-md-6 col-xl-6 text-center">
					<!-- <input type="hidden" id="competition_kind_headcount" readonly>--> 
						인원수 <select class="form-select" id="people_count" name="people_count">
							<option value="0" selected>-- 선택해주세요 --</option>
						</select>
					</div>
				</div>
			</div>
			<br>
			<div class="footer">
				<div class="col-xl-12 col-md-12 col-xs-12 text-center">
					<a><input type="submit" value="등록" class="btn btn-primary"></a>
					<a href="/index.jsp"><input type="button" value="취소"
						class="btn btn-primary"></a>
				</div>
			</div>
		</div>
	</form>
	<script>
		function set_team_info(c, lp, l, n, mn, mp) {
			document.getElementById("code").value = c;
			
			if(l == ''){
				document.getElementById("team_logo").innerHTML = lp;
			}else{
				document.getElementById("team_logo").innerHTML = lp+"\\"+l;
			}
			
			document.getElementById("name").value = n;
			document.getElementById("member_name").value = mn;
			document.getElementById("member_phone").value = mp;
		}

		function set_match_info(crc,ckc,ckn,ckh,la,lo,cd) {
			document.getElementById("competition_registration_code").value = crc;
			document.getElementById("competition_kind_name").value = ckn;
			document.getElementById("competition_kind_headcount").value = ckh;
			document.getElementById("latirude").value = la;
			document.getElementById("longitude").value = lo;
			document.getElementById("competition_date").value = cd;

		}

		// 받은 총 인원 수에 따라 용병 인원수 조절
		survey('#competition_kind_headcount', function() {
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
		});
		
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

		$("#team_select").on(
				"click",
				function() {
					window.open("/team_check.mercenary", "",
							"width=350px,height=250px");
				})
		$("#match_select").on(
				"click",
				function() {
					window.open("/match_check.mercenary?code="
							+ $("#code").val(), "",
							"width=800px,height=600px");
				})
	</script>
</body>
</html>