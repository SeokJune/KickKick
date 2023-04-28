<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<th scope="col">매치 종류</th>
				<th scope="col">팀당 인원 수</th>
				<th scope="col">장소</th>
				<th scope="col">일시</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${match_select_list}">
				<tr>
					<th scope="row"></th>
					<td>${i.competition_kind_code}</td>
					<td>${i.competition_kind_headcount}</td>
					<td>장소</td>
					<td>${i.competition_date}</td>
					<td><a href="javascript:set_match('${i.competition_kind_code}','${i.competition_kind_name}','${i.competition_kind_headcount}','${i.latirude}','${i.longitude}','${i.competition_date}')">
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
		function set_match(ckc,ckn,ckh,la,lo,cd){
			opener.set_match_info(ckc,ckn,ckh,la,lo,cd);
			window.close();
		}
		$("#close").on("click", function() {
			window.close(); // 팝업창을 닫음
		})
	</script>
</body>
</html>