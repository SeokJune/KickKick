<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<!--  
					<input type="hidden" id="latirude" value="${i.latirude}">
					<input type="hidden" id="longitude" value="${i.longitude}">
					-->
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