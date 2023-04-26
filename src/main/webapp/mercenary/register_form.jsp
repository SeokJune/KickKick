<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegisterForm</title>
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

.header2>div {
	float: left;
}

.box>div {
	float: left;
}
.btn{
	border:none;
}
</style>
</head>
<body>
	<form action="/to_mercenary_register.mercenary" method="post">
		<div class="container fluid">

			<div class="row header1">
				<div>
					<button type="button" id="team_select" class="btn btn-primary btn-sm" style="background-color:#0455BF;">팀 선택</button>
				</div>
			</div>
			<div class="row header2">
				<div class="col-xs-12 col-md-4 col-xl-4 text-center">
					<div id="team_logo">img</div>
				</div>
				<div class="col-xs-12 col-md-8 col-xl-8">
					<input type="hidden" id="team_code" readonly>
					<div class="input-group mb-3">
						<span class="input-group-text">팀명</span> <input
							type="text" class="form-control" id="team_name" name="team_name" readonly>
					</div>
					<div class="box">
						<div class="col-12 col-md-6 col-xl-6">
							<div class="input-group mb-3">
								<span class="input-group-text">팀장</span> <input
									type="text" class="form-control" id="name" readonly>
							</div>
						</div>
						<div class="col-12 col-md-6 col-xl-6">
							<div class="input-group mb-3">
								<span class="input-group-text">연락처</span> <input
									type="text" class="form-control" id="phone" readonly>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="row body1">
				<div>
					<button type="button" id="match_select" class="btn btn-primary btn-sm">경기 선택</button>
				</div>
				<div class="box">
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">장소</span> <input
								type="text" class="form-control" id="match_place" name="match_place" readonly>
						</div>
					</div>
					<div class="col-12 col-md-6 col-xl-6">
						<div class="input-group mb-3">
							<span class="input-group-text">일시</span> <input
								type="text" class="form-control" id="match_date" name="match_date" readonly>
						</div>
					</div>
				</div>
			</div>
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
					<div class="col-12 col-md-6 col-xl-6 text-center">
						<input type="hidden" id="match_person_count" readonly> 인원수
						<select class="form-select" id="people_count" name="people_count">
							<option value="0" selected>-- 선택해주세요 --</option>
						</select>
					</div>
				</div>
			</div>
			<br>
			<div class="footer">
				<div class="col-xl-12 col-md-12 col-xs-12 text-center">
					<a><input type="submit" value="등록" class="btn btn-primary"></a>
					<a href="/index.jsp"><input type="button" value="취소" class="btn btn-primary"></a>
				</div>
			</div>
		</div>
	</form>
	<script>
		function set_team_info(tc, tl, tn, n, p) {
			document.getElementById("team_logo").innerHTML = tl;
			document.getElementById("team_code").value = tc;
			document.getElementById("team_name").value = tn;
			document.getElementById("name").value = n;
			document.getElementById("phone").value = p;
		}

		function set_match_info(mp, md, mkc, mpc, ma) {
			document.getElementById("match_place").value = mp;
			document.getElementById("match_date").value = md;
			document.getElementById("match_person_count").value = mpc;

		}

		// 받은 총 인원 수에 따라 용병 인원수 조절
		survey('#match_person_count', function() {
			var objSel = document.getElementById("people_count");
				var objOption = document.createElement("option");
				objOption.text = "1";
				objOption.value = "1";

				var objOption2 = document.createElement("option");
				objOption2.text = "2";
				objOption2.value = "2";

				objSel.options.add(objOption);
				objSel.options.add(objOption2);
			if ($("#match_person_count").val() >= 9) {
				var objOption = document.createElement("option");
				objOption.text = "3";
				objOption.value = "3";

				var objOption2 = document.createElement("option");
				objOption2.text = "4";
				objOption2.value = "4";

			}
		});
		function survey(selector, callback) {
			var input = $(selector);
			var oldvalue = input.val();
			setInterval(function() {
				if (input.val() != oldvalue) {
					oldvalue = input.val();
					callback();
				}
			}, 100);
		}

		$("#team_select").on(
				"click",
				function() {
					window.open("/team_check.mercenary", "",
							"width=350px,height=250px");
				})
		$("#match_select").on(
				"click",
				function() {
					window.open("/match_check.mercenary?team_name="
							+ $("#team_name").val(), "",
							"width=600px,height=300px");
				})
	</script>
</body>
</html>