<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<title>Document</title>
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
				<img src="세터.png" style="width: 80px; height: 80px;">
			</div>
			<div class="col-xs-12 col-md-9 col-xl-8">
				<div class="row">
					<div class="col-12 col-md-12 col-xl-6">팀명</div>
					<div class="col-12 col-md-12 col-xl-6">연고지</div>
					<div class="col-12 col-md-12 col-xl-6">팀장이름</div>
					<div class="col-12 col-md-12 col-xl-6">연락처</div>
					<div class="col-12 col-md-12 col-xl-6">승무패</div>
					<div class="col-12 col-md-12 col-xl-6">간략 소개글</div>
				</div>
			</div>
			<div class="col-xl-2"></div>
		</div>

		<div class="row empty_place d-none d-md-flex">
			<div class="col-12" style="height: 50px;"></div>
		</div>

		<div class="row team_info2">
			<div class="col-xl-3"></div>
			<div class="col-md-12 col-xl-6" style="height: 150px">소개글</div>
			<div class="col-xl-3"></div>

		</div>
	</div>
</body>
</html>