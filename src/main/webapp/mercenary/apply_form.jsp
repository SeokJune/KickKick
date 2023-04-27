<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplyForm</title>
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

.header>div {
	float: left;
}

.box>div {
	float: left;
}

.btn {
	border: none;
}
</style>
</head>
<body>
	<div class="container fluid">

		<div class="row header">
			<div class="col-xs-12 col-md-4 col-xl-4 text-center">
				<div id="team_logo">${team_info.team_logo}</div>
			</div>
			<div class="col-xs-12 col-md-8 col-xl-8">
				<input type="hidden" id="team_code" name="team_code" value="${team_info.team_code}" readonly>
				<div class="input-group mb-3">
					<span class="input-group-text">팀명</span> <input type="text"
						class="form-control" id="team_name" name="team_name" value="${team_info.team_name}" readonly>
				</div>
				<div class="box">
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">팀장</span> <input type="text"
								class="form-control" id="name" value="${team_info.name}" readonly>
						</div>
					</div>
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">연락처</span> <input type="text"
								class="form-control" id="phone" value="${team_info.phone}" readonly>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="row body1">
			<div class="box">
				<div class="col-12 col-md-12 col-xl-12">
					<div class="input-group mb-3">
						<span class="input-group-text">상대 팀명</span> <input type="text"
							class="form-control" id="" name="" readonly>
					</div>
				</div>
			</div>
			<div class="box">
				<div class="col-12 col-md-6 col-xl-6">
					<div class="input-group mb-3">
						<span class="input-group-text">장소</span> <input type="text"
							class="form-control" id="match_place" name="match_place" readonly>
					</div>
				</div>
				<div class="col-12 col-md-6 col-xl-6">
					<div class="input-group mb-3">
						<span class="input-group-text">일시</span> <input type="text"
							class="form-control" id="match_date" name="match_date" readonly>
					</div>
				</div>
			</div>
		</div>
		<!--
		<br>
		<div class="row body2">
			<div class="box">
				<div class="col-12 col-md-6 col-xl-6 text-center">
					실력 <select class="form-select" name="ability">
						<option value="" selected>-- 선택해주세요 --</option>
						<option value="1">상</option>
						<option value="2">중</option>
						<option value="3">하</option>
					</select>
				</div>
			</div>
		</div>
		  -->
		<br>
		<div class="row body3">
			<div class="col-12 col-md-12 col-xl-12">
				<div class="input-group">
					<span class="input-group-text">소개글</span>
					<textarea class="form-control" name="contents" id="contents"
					placeholder="간단한 소개를 적어주세요."></textarea>
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="col-xl-12 col-md-12 col-xs-12 text-center">
				<a><input type="submit" value="신청" class="btn btn-primary"></a>
				<a href="/to_register_list.mercenary"><input type="button"
					value="취소" class="btn btn-primary"></a>
			</div>
		</div>



	</div>
</body>
</html>