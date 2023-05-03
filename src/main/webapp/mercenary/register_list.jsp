<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegisterList</title>
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
	overflow-x: auto;
}

.table {
	/* table-layout:fixed; */
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
</style>
</head>

<body>
	<div class="container fluid shadow p-3 mb-5 bg-body-tertiary rounded">
	<h2 style="text-align:center;">용병 등록 리스트</h2>
	<br>
	<br>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">날짜</th>
						<th scope="col">장소</th>
						<th scope="col">팀명</th>
						<th scope="col">실력</th>
						<th scope="col">구하는 인원수</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${register_list}">
						<tr>
							<th scope="row"></th>
							<td><input type="hidden" name="code" value="${i.code}"
								readonly> <input type="hidden" name="team_code"
								value="${i.team_code}" readonly> <input type="hidden"
								name="competition_result_code"
								value="${i.competition_result_code}" readonly> <input
								type="hidden" name="ability_code" value="${i.ability_code}"
								readonly> <input type="hidden" name="name"
								value="${i.name}" readonly> <input type="hidden"
								id="latirude" name="latirude" value="${i.latirude}" readonly>
								<input type="hidden" id="longitude" name="longitude"
								value="${i.longitude}" readonly> <%@page
									import="commons.DateCalculationUtils"%>${DateCalculationUtils.date_format_timestamp(i.competition_date)}
							</td>
							<td id="match_place_${i.code}"><script>
						var geocoder = new kakao.maps.services.Geocoder();

						var coord = new kakao.maps.LatLng(${i.latirude},${i.longitude});
						var callback = function(result, status) {
							if (status === kakao.maps.services.Status.OK) {
								console.log(result[0].address.address_name);
								document.getElementById("match_place_"+${i.code}).innerHTML = result[0].address.address_name;
							}
						};

						geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
						</script></td>
							<td>${i.name}</td>
							<c:choose>
								<c:when test="${i.ability_code == 1003}">
									<td>하</td>
								</c:when>
								<c:when test="${i.ability_code == 1002}">
									<td>중</td>
								</c:when>
								<c:otherwise>
									<td>상</td>
								</c:otherwise>
							</c:choose>
							<td>${i.headcount}명</td>
							<td><a href="/to_apply_form.mercenary?code=${i.code}"> <input
									type="button" value="신청" class="btn btn-primary btn-sm"></a>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan=7 align=center><a href="/index.jsp"><input
								type="button" value="뒤로가기" class="btn btn-primary"></a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>