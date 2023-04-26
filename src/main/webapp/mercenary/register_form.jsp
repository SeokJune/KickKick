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
</style>
</head>
<body>
<form action="/to_mercenary_register" method="post">
	<div class="container fluid">

		<div class="row header1">
			<div>
				<button type="button" id="team_select">팀 선택</button>
			</div>
		</div>
		<div class="row header2">
			<div class="col-xs-12 col-md-4 col-xl-4 text-center">
				<div id="team_logo">img</div>
			</div>
			<div class="col-xs-12 col-md-8 col-xl-8">
				<div>
					팀명 <input type="text" id="team_name" readonly>
				</div>
				<div class="box">
					<div class="col-12 col-md-6 col-xl-6">
						팀장 <input type="text" id="name" readonly>
					</div>
					<div class="col-12 col-md-6 col-xl-6">
						연락처 <input type="text" id="phone" readonly>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="row body1">
			<div>
				<button type="button" id="match_select">경기 선택</button>
			</div>
			<div class="box">
				<div class="col-12 col-md-6 col-xl-6">
					장소 <input type="text" id="match_place" placeholder="장소">
				</div>
				<div class="col-12 col-md-6 col-xl-6">
					일시 <input type="text" id="match_date" placeholder="일시">
				</div>
			</div>
		</div>
		<br>
		<div class="row body2">
			<div class="box">
				<div class="col-12 col-md-6 col-xl-6 text-center">
					실력 <select class="form-select" aria-label="Default select example"
						name="ability">
						<option value="" selected>-- 선택해주세요 --</option>
						<option value="good">상</option>
						<option value="fair">중</option>
						<option value="poor">하</option>
					</select>
				</div>
				<div class="col-12 col-md-6 col-xl-6 text-center">
					인원수 <select class="form-select" aria-label="Default select example"
						name="people">
						<option value="" selected>-- 선택해주세요 --</option>
						<option value="one">1</option>
						<option value="two">2</option>
					</select>
				</div>
			</div>
		</div>
		<br>
		<div class="footer">
			<div class="col-xl-12 col-md-12 col-xs-12 text-center">
				<a><input type="submit" value="등록"></a> <a href="/index.jsp"><input
					type="button" value="취소"></a>
			</div>
		</div>
	</div>
	</form>
	<script>
      	function set_team_info(tc,tl,tn,n,p){
      		document.getElementById("team_logo").innerHTML = tl;
      		document.getElementById("team_name").value = tn;
      		document.getElementById("name").value = n;
      		document.getElementById("phone").value = p;
      	}
      	
      	function set_match_info(mp,md,mkc,mpc,ma){
      		document.getElementById("match_place").value = mp;
      		document.getElementById("match_date").value = md;
      	}
      
      	$("#team_select").on("click", function(){
      		window.open("/team_check.mercenary","","width=350px,height=250px");
      	})
      	$("#match_select").on("click", function(){
      		window.open("/match_check.mercenary?team_name="+$("#team_name").val(),"","width=600px,height=300px");
      	})
      </script>
</body>
</html>