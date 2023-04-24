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
</style>
</head>
<body>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">팀 코드</th>
				<th scope="col">팀 이름</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${teamList}">
				<tr>
					<th scope="row"></th>
					<td>${i.team_code}</td>
					<td>${i.team_name}</td>
					<td><button id="use" item="${i.team_name}">선택</button></td>
				</tr>

			</c:forEach>
			<tr>
				<td colspan=4 align=center>
					<button id="close">취소</button>
				</td>
			</tr>
		</tbody>
	</table>
	<script>
		$("#close").on("click", function() {
			window.close(); // 팝업창을 닫음
		})
		$(document).ready(function() {
			$(document).on('click', '#use', function() {
				opener.document.getElementById("name").value = this.${i.team_name};
				window.close();
			})
		})
		
	</script>
</body>
</html>