<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
					<td>
					<a href="javascript:set_team('${i.code}','${fn:escapeXml(i.logo_path)}\','${i.logo}','${i.name}','${i.member_name}','${i.member_phone}')">
					<!-- <a href="javascript:set_team('${i.code}','${i.name}','${i.member_name}','${i.member_phone}')"> -->
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
	/*
	function set_team(c,n,mn,mp){
		opener.set_team_info(c,1,1,n,mn,mp);
		window.close();
	}
	*/
		$("#close").on("click", function() {
			window.close(); // 팝업창을 닫음
		})
		
	</script>
</body>
</html>