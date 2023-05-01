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
				<th scope="col">팀 코드</th>
				<th scope="col">팀 이름</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${team_select_list}">
				<tr>
					<th scope="row"></th>
					<td>${i.code}</td>
					<td>${i.name}</td>
					<td><a href="javascript:set_team('${i.code}','${i.logo_path}','${i.logo}','${i.name}','${i.member_name}','${i.member_phone}')">
					<button id="use" class="btn btn-primary btn-sm">선택</button></a></td>
				</tr>

			</c:forEach>
			<tr>
				<td colspan=4 align=center>
					<button id="close" class="btn btn-primary btn-sm">취소</button>
				</td>
			</tr>
		</tbody>
	</table>
	<script>
		function set_team(c,lp,l,n,mn,mp){
			opener.set_team_info(c,lp,l,n,mn,mp);
			window.close();
		}
		$("#close").on("click", function() {
			window.close(); // 팝업창을 닫음
		})
		
	</script>
</body>
</html>