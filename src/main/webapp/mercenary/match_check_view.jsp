<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<!-- kakao api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a47338e87e3d914e6d508799cd4f4e17&libraries=services"></script>
<style>
*{font-family: 'NanumSquareNeoBold';}
div {
	border: 1px solid black;
}
.btn{
	border:none;
}
</style>
</head>
<body>
<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">매치 코드</th>
				<th scope="col">장소</th>
				<th scope="col">일시</th>
				<th scope="col">팀당 인원 수</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${match_select_list}">
				<tr>
					<th scope="row"></th>
					<td>${i.competition_registration_code}</td>
					<td id="match_place_${i.competition_registration_code}">
					<script>
						var geocoder = new kakao.maps.services.Geocoder();

						var coord = new kakao.maps.LatLng(${i.latirude},${i.longitude});
						var callback = function(result, status) {
							if (status === kakao.maps.services.Status.OK) {
								var mp = result[0].address.address_name
								document.getElementById("match_place_"+${i.competition_registration_code}).innerHTML = result[0].address.address_name;
							}
						};

						geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
						</script>
					</td>
					<td><%@page import="commons.DateCalculationUtils"%>${DateCalculationUtils.date_format_timestamp(i.competition_date)}</td>
					<td>${i.competition_kind_headcount}</td>
					<td><a href="javascript:set_match('${i.competition_registration_code}','${i.competition_kind_code}','${i.competition_kind_name}',
					'${i.competition_kind_headcount}','${i.latirude}','${i.longitude}','${i.competition_date}','${DateCalculationUtils.date_format_timestamp(i.competition_date)}')">
					<button id="use" class="btn btn-primary btn-sm">선택</button></a></td>
				</tr>

			</c:forEach>
			<tr>
				<td colspan=6 align=center>
					<button id="close" class="btn btn-primary btn-sm">취소</button>
				</td>
			</tr>
		</tbody>
	</table>
	<script>
		function set_match(crc,ckc,ckn,ckh,la,lo,cd,dft){
			opener.set_match_info(crc,ckc,ckn,ckh,la,lo,cd,dft);
			window.close();
		}
		$("#close").on("click", function() {
			window.close(); // 팝업창을 닫음
		})
	</script>
</body>
</html>