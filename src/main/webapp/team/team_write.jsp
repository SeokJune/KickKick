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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
	integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
* {
	box-sizing: border-box;
	border: 1px solid black;
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
						<div class="col-md-3"></div>
						<div class="col-9 col-md-6" style="margin: auto;">
							<input type="text" placeholder="팀명" class="w-100"
								name="team_name" id="team_name">
						</div>
						<div class="col-3 col-md-3">
							<button type="button" id="dup" style="font-size: 12px;">중복</button>
						</div>
					</div>


					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-12 col-md-6" style="margin: auto;">
							<input type="text" placeholder="팀장명(MEMBER_CODE_FK FOREIGN KEY)"
								class="w-100" name="captain_name" readonly>
						</div>
						<div class="col-md-3"></div>
					</div>

					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-12 col-md-6" style="margin: auto;">
							<input type="text"
								placeholder="팀장 연락처(MEMBER_CODE_FK FOREIGN KEY)" class="w-100"
								name="captain_phone" readonly>
						</div>
						<div class="col-md-3"></div>
					</div>

					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-12 col-md-6" style="margin: auto;">
							<select name="hometown_code">
								<c:forEach var="item" items="${arr}">
									<option value="${item.code}">${item.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-3"></div>
					</div>

					<div class="row">

						<div class="col-12 col-md-8" style="margin: auto;">
							<textarea placeholder="간략 소개글" name="outline" class="w-100"
								id="outline"></textarea>
						</div>
					</div>
				</div>

				<div class="col-12 col-md-4"></div>
			</div>

			<div class="row" style="margin: auto;">
				<div class="col-xl-3 "></div>

				<div class="col-12 col-md-6" style="margin: auto;">
					<div contenteditable="true" id="edi"
						style="height: 150px; border: 1px solid black;"></div>
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
		// 팀명 중복도 및 올바른 형식 
		let team_name = $("#team_name");
		let team_name_regex = /^[가-힣a-zA-Z]+$/;
		let dup = document.getElementById("dup");
		let tf;

		var team_name_ValidFlag = false; // 팀명 사용 취소 누를 때 false를 반환해서 생성하기 버튼을 눌렀을 때 데이터 넘어가는 것을 막음.

		dup.onclick = function() {
			let val = team_name.val();
			tf = team_name_regex.test(val);
			if (tf) {
				window.open("/team_name_check.team?team_name="+ $("#team_name").val(), "", "width=350px,height=250px");
			} else {
				swal('사용 불가능한 팀명!', "이 팀명으로는 사용 못해!!", 'warning');
			}
		}
		
		// 중복 검사 후 팀명 값을 변경했을 때 false 반환.
		$("#team_name").on("keyup", function() {
			team_name_ValidFlag = false;
		})

		// 생성하기 눌렀을 시
		$("#frm").on("submit", function() {
			console.log($("#outline").val())
			console.log($("#edi").val())
			if (team_name_regex.test(team_name.val()) == false) {
				alert("팀명을 다시 입력하세요.");
				return false;
			} 
			else if(team_name_ValidFlag == false) {
				alert("중복도 검사를 다시 하세요.")
				return false;
			}
			else if ($("#outline").val().trim() == "" ) {
				alert("간략소개글을 입력하세요.");
				return false;
			}
			else if ($("#edi").html().trim() == "") {
				alert("게시글을 입력하세요.");
				return false;
			}
			let content = $("#edi").html();
			$("#spy").val(content);
		});
	</script>

</body>

</html>