<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegisterList</title>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0474140514f12dfa658e3a29b717ea54&libraries=services"></script>
<style>
div {
	border: 1px solid black;
}
</style>
</head>
<body>
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
					<td>${i.competition_date}</td>
					<td><script>set_place(${latirude},${i.longitude})</script></td>
					<td>${i.name}</td>
					<c:choose>
						<c:when test="${i.ability_code ==1}">
							<td>하</td>
						</c:when>
						<c:when test="${i.ability_code ==2}">
							<td>중</td>
						</c:when>
						<c:otherwise>
							<td>상</td>
						</c:otherwise>
					</c:choose>
					<td>${i.headcount}명</td>
					<td><a
						href="/to_apply_form.mercenary?team_code=${i.team_code}&competition_result_code=${i.competition_result_code}
						&name=${i.name}&ability_code=${i.ability_code}"><input
							type="button" value="신청" class="btn btn-primary btn-sm"></a></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan=7 align=center><a href="/index.jsp"><input
						type="button" value="뒤로가기" class="btn btn-primary"></a></td>
			</tr>
		</tbody>
	</table>
	<script>
		function set_place(latirude,longitude) {
			var geocoder = new kakao.maps.services.Geocoder();

			var coord = new kakao.maps.LatLng(latirude, longitude);
			var callback = function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					console.log(result[0].address.address_name);
					document.getElementById("centerAddr").innerHTML = result[0].address.address_name;
				}
			};

			geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
		}
	</script>
</body>
</html>