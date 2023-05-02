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
* {
	border: 1px solid black;
	box-sizing: border-box;
}

.container-fluid {
	padding: 0px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row team_info1">
			<div class="col-xs-12 col-md-3 col-xl-2" style="text-align: center;">
				<img src="${team_info.logo_path}${team_info.logo}" style="width: 80px; height: 80px;">
			</div>
			<div class="col-xs-12 col-md-9 col-xl-8">
				<div class="row">
					<div class="col-12 col-md-12 col-xl-6">${team_info.name}</div>
					<div class="col-12 col-md-12 col-xl-6">${team_info.hometown_name}</div>
					<div class="col-12 col-md-12 col-xl-6">${team_info.member_name}</div>
					<div class="col-12 col-md-12 col-xl-6">${team_info.member_phone}</div>
					<div class="col-12 col-md-12 col-xl-6">승무패</div>
					<div class="col-12 col-md-12 col-xl-6">${team_info.outline}</div>
				</div>
			</div>
			<div class="col-xl-2"></div>
		</div>

		<div class="row empty_place d-none d-md-flex">
			<div class="col-12" style="height: 50px;"></div>
		</div>

		<div class="row team_info2">
			<div class="col-xl-3"></div>
			<div class="col-md-12 col-xl-6" style="height: 150px">${team_info.content}</div>
			<div class="col-xl-3"></div>

		</div>
	</div>
</body>
</html>