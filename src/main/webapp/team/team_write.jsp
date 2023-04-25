<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
* {
	box-sizing: border-box;
}

.container {
	max-width: 800px;
}

#logo {
	text-align: center;
}

#logo_img {
	width: 100px;
	height: 100px;
}
</style>
</head>

<body>
	<form action="/create.team" id="frm">
		<div class="container-fluid">
			<div class="row body">
				<div class="col-12 col-md-3"></div>

				<div class="col-12 col-md-1" id="logo">
					<img src="/image/세터.png" id="logo_img">
				</div>

				<div class="col-12 col-md-4" id="team_info">
					<div class="row">
						<div class="col-12 col-md-8" style="margin: auto;">
							<input type="text" placeholder="팀명" class="w-100"
								name="team_name">
						</div>
					</div>


					<div class="row">
						<div class="col-12 col-md-8" style="margin: auto;">
							<input type="text" placeholder="팀장명(readonly)" class="w-100"
								name="captain_name">
						</div>
					</div>

					<div class="row">
						<div class="col-12 col-md-8" style="margin: auto;">
							<input type="text" placeholder="팀장 연락처(readonly)" class="w-100"
								name="captain_phone">
						</div>
					</div>

					<div class="row">
						<div class="col-12 col-md-8" style="margin: auto;">
							<select name="hometown_code">
								<c:forEach var="item" items="${arr}">
									<option value="${item.code}">${item.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="row">
						<div class="col-12 col-md-8" style="margin: auto;">
							<textarea placeholder="간략 소개글" name="outline" class="w-100"></textarea>
						</div>
					</div>
				</div>

				<div class="col-12 col-md-4"></div>
			</div>

			<div class="row" style="margin: auto;">
				<div class="col-xl-3 "></div>

				<div class="col-12 col-md-6" style="margin: auto;">
					<div contenteditable="true" id="edi" style="height: 150px; border: 1px solid black;"></div>
					<input type="hidden" name="content" id="spy">
				</div>

				<div class="col-xl-3"></div>
			</div>

			<br>
			
			<div class="row footer">
				<div class="col-6">
					<a href="/"><button type="button" style="float: right;">생성취소</button></a>
				</div>	
				<div class="col-6">
					<button id="create_team">생성하기</button>
				</div>
			</div>
		</div>
	</form>
	
	<script>
		$("#frm").on("submit", function() {
			let content = $("#edi").html();
			$("#spy").val(content);
		});
	</script>
	
</body>

</html>