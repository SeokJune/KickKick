<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegisterForm</title>
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
	
	<form id="form" action="/to_mercenary_register.mercenary" method="post">
		<div class="container fluid shadow p-3 mb-5 bg-body-tertiary rounded">
		<h2 class="mb-5" style="text-align:center;">용병 등록</h2>
			<div class="row team1">
				<div class="mb-3">
					<button type="button" id="team_select"
						class="btn btn-primary">팀
						선택</button>
				</div>
			</div>
			<div class="row team2">
				<div class="col-xs-12 col-md-4 col-xl-4 text-center">
				<input type="hidden" id="logo_path" name="logo_path" required readonly>
				<input type="hidden" id="logo" name="logo" readonly>
					<div id="team_logo">
						
					</div>
				</div>
				<div class="col-xs-12 col-md-8 col-xl-8">
					<input type="hidden" id="code" name="code" required readonly>
					<input type="hidden" id="competition_registration_code" name="competition_registration_code" required readonly>
					<div class="input-group mb-3">
						<span class="input-group-text">팀명</span> <input type="text"
							class="form-control" id="name" name="name" required readonly>
					</div>
					<div class="box">
						<div class="col-12 col-md-6 col-xl-6">
							<div class="input-group mb-3">
								<span class="input-group-text">팀장</span> <input type="text"
									class="form-control" id="member_name" required readonly>
							</div>
						</div>
						<div class="col-12 col-md-6 col-xl-6">
							<div class="input-group mb-3">
								<span class="input-group-text">연락처</span> <input type="text"
									class="form-control" id="member_phone" required readonly>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="row match1">
				<div class="mb-3">
					<button type="button" id="match_select"
						class="btn btn-primary">경기 선택</button>
				</div>
				<div class="box">
					<div class="col-12 col-md-6 col-xl-6">
					<input type="hidden" id="latirude" readonly> <!-- 위도 -->
					<input type="hidden" id="longitude" readonly> <!-- 경도 -->
						<div class="input-group mb-3">
							<span class="input-group-text">장소</span> <input type="text"
								class="form-control" id="match_place" name="match_place"
								required readonly>
						</div>
					</div>
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">일시</span> 
							<input type="text" class="form-control" id="competition_date" name="competition_date" required readonly>
						</div>
					</div>
				</div>
				<div class="box">
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">종목</span> <input type="text"
								class="form-control" id="competition_kind_name" name="competition_kind_name"
								required readonly>
						</div>
					</div>
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">총 인원수</span> <input type="text"
								class="form-control" id="competition_kind_headcount" name="competition_kind_headcount" required readonly>
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
					<a><input type="button" value="등록" id="register_btn" class="btn btn-primary" onclick="valid_register(this)"></a>
					<a href="/index.jsp"><input type="button" value="취소"
						class="btn btn-primary"></a>
				</div>
			</div>
			<br>
		</div>
	</form>
	<script>
		function set_team_info(c, lp, l, n, mn, mp) {
			document.getElementById("code").value = c;
			
			document.getElementById("logo_path").value = lp;
			document.getElementById("logo").value = l;
			
			document.getElementById("name").value = n;
			document.getElementById("member_name").value = mn;
			document.getElementById("member_phone").value = mp;
		}
		function set_match_info(crc,ckc,ckn,ckh,la,lo,cd,dft) {
			document.getElementById("competition_registration_code").value = crc;
			document.getElementById("competition_kind_name").value = ckn;
			document.getElementById("competition_kind_headcount").value = ckh;
			document.getElementById("latirude").value = la;
			document.getElementById("longitude").value = lo;
			document.getElementById("competition_date").value = dft;

		}
		
		// 용병 등록 중복 검사
		function valid_register(evt){
			$.ajax({
				url:"/register_btn_ajax.mercenary",
				async: false,
				type:"post",
				dataType: "json",
				data:{
					code:document.getElementById("code").value,
					competition_registration_code:document.getElementById("competition_registration_code").value
				}
			}).done(function(resp) {
				if(resp){
					alert("이미 용병을 등록하셨습니다!");
					location.reload();
				}else{
					$("#form").submit();
				}
			})
		}
		
		// 받은 logo_path에 따라 이미지 추가
		survey('#logo_path', function() {
			var team_logo = document.getElementById("team_logo");
			
			var logo_path = document.getElementById("logo_path").value;
			var logo = document.getElementById("logo").value;
			
			console.log(logo_path);
			console.log(logo);

			var img = document.createElement("img");
			img.src = "../"+logo_path+logo;
			img.width = "100";
			img.height = "100";
			
			console.log(img.src);
			team_logo.appendChild(img);
		});
		
		// 받은 위도, 경도에 따라 위치 구하는 함수
		survey('#latirude,#longitude', function() {
			var latirude = document.getElementById("latirude").value;
			var longitude = document.getElementById("longitude").value;
			
			var geocoder = new kakao.maps.services.Geocoder();

			var coord = new kakao.maps.LatLng(latirude,longitude);
			var callback = function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var mp = result[0].address.address_name
					document.getElementById("match_place").value = result[0].address.address_name;
				}
			};

			geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
			
		});
		
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
							"width=500px,height=300px");
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