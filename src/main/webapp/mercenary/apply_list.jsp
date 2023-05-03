<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplyList</title>
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

.table {
	border_collapse: separate;
}

th {
	white-space: nowrap;
}

td {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
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
	<div class="container fluid shadow p-3 mb-5 bg-body-tertiary rounded">
		<h2 style="text-align: center;">용병 신청 리스트</h2>
		<br>
		<br>
		<div class="row team1">
			<div class="mb-3">
				<input type="hidden" id="code" name="code" readonly>
				<button type="button" id="team_select"
					class="btn btn-primary">팀 선택</button>
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">팀명</span> <input type="text"
					class="form-control" id="name" name="name" readonly>
			</div>
		</div>
		<br>
		<div class="row match1">
			<div class="mb-3">
				<button type="button" id="match_select"
					class="btn btn-primary">경기 선택</button>
			</div>
			<div class="col-12 col-md-12 col-xl-12">
				<div class="input-group mb-3">
					<span class="input-group-text">매치코드</span> <input type="text"
						class="form-control" id="competition_registration_code"
						name="competition_registration_code" readonly>
				</div>
			</div>
			<div class="box">
				<div class="col-12 col-md-6 col-xl-6">
					<input type="hidden" id="latirude" readonly> <input
						type="hidden" id="longitude" readonly>
					<div class="input-group mb-3">
						<span class="input-group-text">장소</span> <input type="text"
							class="form-control" id="match_place" name="match_place" readonly>
					</div>
				</div>
				<div class="col-12 col-md-6 col-xl-6">
					<div class="input-group mb-3">
						<span class="input-group-text">일시</span> <input type="text"
							class="form-control" id="competition_date"
							name="competition_date" readonly>
					</div>
				</div>
			</div>
		</div>

		<div class="table-responsive">
			<input type="hidden" id="apply_list" readonly>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">신청인</th>
						<th scope="col">소개글</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody id="table_body">
					<tr>
						<td colspan=4 align=center><a href="/index.jsp"><input
								type="button" value="뒤로가기" class="btn btn-primary"></a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<script>
		function set_team_info(c, lp, l, n, mn, mp) {
			document.getElementById("code").value = c;
			document.getElementById("name").value = n;
		}
		function set_match_info(crc,ckc,ckn,ckh,la,lo,cd,dft) {
			document.getElementById("competition_registration_code").value = crc;
			document.getElementById("latirude").value = la;
			document.getElementById("longitude").value = lo;
			document.getElementById("competition_date").value = dft;
		}

		$("#team_select").on(
				"click",
				function() {
					window.open("/team_check.mercenary", "",
							"width=350px,height=250px");
				});
		$("#match_select")
				.on(
						"click",
						function() {
							window.open("/match_check.mercenary?code="
									+ $("#code").val(), "",
									"width=800px,height=600px");
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
		
		survey('#competition_registration_code', function() {
			$.ajax(
					{
						url : "/apply_list_ajax.mercenary",
						type : "post",
						data : {
							"code" : $("#code").val(),
							"competition_registration_code" : $(
									"#competition_registration_code").val()
						}
					}).done(function(resp) {
				resp = JSON.parse(resp);
				document.getElementById("apply_list").value = resp;
				console.log(resp.length);
				for(var i=0;i < resp.length;i++){
				var row;
					row += '<tr id='+ i +'>';
					row += '<th scope="row">' + '</th>';
					row += '<td>' + resp[0].name + '</td>';
					row += '<td>';
					row += '<div class="col-12 col-md-12 col-xl-12">' + '<textarea class="form-control" name="contents" id="contents" readonly>'
					+ resp[0].content + '</textarea>' + '</div>';
					row += '</td>';		
					row += '<td>';
					row += '<button class="btn btn-primary">' + '수락' + '</button>'
					row += '&nbsp;&nbsp;';
					row += '<button class="btn btn-primary">' + '거절' + '</button>'
					row += '</td>';		
					row += '</tr>';
					
					$("#table_body").prepend(row);
				}
			});
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
	</script>
</body>
</html>