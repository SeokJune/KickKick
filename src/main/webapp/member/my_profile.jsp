<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KickKick - 마이페이지</title>
<!-- 부트스트랩 CSS CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- 부트스트랩 JQ , JS CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
html {
	background-color: #76b852;
}

body {
	background-color: #76b852;
}

.container {
	border: 1px solid black;
	width: 600px;
	height: 900px;
	padding: 32px;
	margin-top: 5%;
	margin-bottom: 5%;
	position: relative;
	background-color: whitesmoke;
	border-radius: 1rem;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
}

.wrapper {
	position: relative;
	padding-left: 25px;
	padding-right: 25px;
	padding-top: 20px;
}

.row input {
	height: 40px;
	width: 250px;
}

label {
	font-size: small
}

.btn {
	border: none;
}
</style>
</head>
<body>

	<div class="container my_page_container">

		<div class="wrapper join_form">
			<form action="" method="post">


				<!-- 아이디 : 변경 불가-->
				<div class="row" style="height: 85px;">
					<!--아이디 출력창 -->
					<div class="col">
						<div class="row label">
							<div class="col md-9">
								<label for="member_id">아이디</label>
							</div>
						</div>
						<div class="row input">
							<div class="col md-9">
								<input type="text" class="form-control" id="member_id"
									value="${profile.id}"
									name="member_id" readonly>
							</div>
						</div>
					</div>
				</div>



				<!-- 비밀번호 : 수정하기 버튼 클릭시 보여짐-->
				<div class="row" id="edit_pw">
					<div class="col">
						<div class="row label">
							<div class="col md-9">
								<label for="member_pw">비밀번호</label>
							</div>
						</div>
				<!-- '비밀번호 변경'버튼 -->		
						<div class="row">
							<div class="col">
								<button class="btn btn-primary" type="button" id="edit_pw_btn">비밀번호
									변경</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 비밀번호 입력창 :  '비밀번호 변경'버튼 클릭시 보여짐-->
				<div class="row input" id="edit_pw_fadeIn">
					<div class="col">
						<!-- 기존 비밀번호 입력창 -->
						<div class="row">
							<input type="password" class="form-control" id="member_pw"
								name="member_pw" minlength="8" maxlength="20"
								placeholder="기존 비밀번호">
						</div>
						<!-- 새 비밀번호 입력창 -->
						<div class="row">
							<input type="password" class="form-control" id="member_new_pw"
								name="member_new_pw" minlength="8" maxlength="20"
								pattern="^(?=.*[a-zA-Z])(?=.*[~.!@#$%^&*()_+={}>;<:,.?/\-\[\]\\\|])(?=.*[0-9]).{8,20}$"
								placeholder="새 비밀번호">
							<!-- 비밀번호 보기&숨기기 버튼 -->
							<div class="col md-3">
								<button class="btn btn-light btn-sm" id="view_pw" type="button">보기</button>
							</div>
						</div>

					</div>
				</div>



 
				<!-- 이름 : 변경 불가 -->
				<div class="row" style="height: 85px;">
					<!-- 이름 출력창 -->
					<div class="col">
						<div class="row label">
							<div class="col">
								<label for="member_name">이름</label>
							</div>
						</div>
						<div class="row input">
							<div class="col md-9">
								<input type="text" class="form-control" id="member_name"
									value="${profile.name}"
									name="member_name" readonly>
							</div>
						</div>
					</div>
				</div>





				<!-- 전화번호 : 인증 후 변경 가능 -->
				<div class="row" style="height: 85px;">
					<!-- 전화번호1,2,3 입력창 -->
					<div class="col">
						<div class="row label">
							<label for="member__phone">전화번호</label>
						</div>
						<div class="row input">
							<div class="col">
								<input type="text" class="form-control" id="member_phone1"
									name="member_phone1" pattern="^0+\d{1,2}$" minlength="2"
									maxlength="3" required style="width: 100px;" readonly>
							</div>
							-
							<div class="col">
								<input type="text" class="form-control" id="member_phone2"
									name="member_phone2" pattern="^\d{3,4}$" minlength="3"
									maxlength="4" required style="width: 100px;" readonly>
							</div>
							-
							<div class="col">
								<input type="text" class="form-control" id="member_phone3"
									name="member_phone3" pattern="^\d{4}$" minlength="4"
									maxlength="4" required style="width: 100px;" readonly>
							</div>
						<!-- 전화번호 변경 버튼 : 수정하기 버튼 클릭시 보여짐 -->
							<div class="col">
								<button type="button" class="btn btn-primary btn-sm"
									id="edit_phone_btn" style="-bs-btn-font-size: .75rem;">변경</button>
							</div>
						</div>
						<!-- 전화번호 중복 메세지 -->
						<div class="row checking">
							<h9 id="phone_checking"></h9>
						</div>
					</div>
				</div>


			<!-- 전화번호 변경 버튼 클릭시 보여짐 -->
				<!-- 인증번호 -->
				<div class="row" id="veri_code" style="height: 85px;">
					<!-- 인증번호 입력창 -->
					<div class="col">
						<div class="row label">
							<label for="member_pin">인증번호</label>
						</div>
						<div class="row input">
							<div class="col">
								<input type="text" class="form-control" id="member_pin"
									name="member_pin" required>
							</div>
							<!-- 인증완료 버튼 -->
							<div class="col">
								<button type="button" class="btn btn-primary btn-sm">인증번호
									전송</button>
							</div>
						</div>
					</div>
				</div>




				<!-- 생년월일 -->
				<div class="row" style="height: 85px;">
					<!-- 생년월일 출력창 -->
					<div class="col">
						<div class="row label">
							<label for="member_birth">생년월일</label>
						</div>
						<div class="row input">
							<div class="col">
								<input type="text" class="form-control" id="member_birth_year"
									name="member_birth_year"
									pattern="^(19[0-9][0-9]|20[0-2][0-3])$" minlength="4"
									maxlength="4" required readonly style="width: 100px;">
							</div>
							<div class="col">
								<input type="text" class="form-control" id="member_birth_month"
									name="member_birth_month" pattern="^(0[1-9]|1[0-2])$"
									minlength="2" maxlength="2" required readonly
									style="width: 100px;"> 
							</div>
							<div class="col">
								<input type="text" class="form-control" id="member_birth_day"
									name="member_birth_day" pattern="^(0[1-9]|[12][0-9]|3[01])$"
									minlength="2" maxlength="2" required readonly
									style="width: 100px;"> 
							</div>
						</div>
					</div>
				</div>




				<!-- 이메일 -->
				<div class="row insert" style="height: 85px;">
					<!-- 이메일 출력창 -->
					<div class="col">
						<div class="row label">
							<div class="col">
								<label for="member_email"> E-mail</label>
							</div>
						</div>
						<div class="row input">
							<div class="col md-9">
								<input type="email" class="form-control" id="member_email"
									value="${profile.email}"
									name="member_email"
									pattern="^([a-z]{1}[a-z0-9_+.-]+@)([a-zA-Z0-9]+\.)([a-z0-9]{2,4})$"
									required readonly>
							</div>
						</div>
						<!-- 이메일 중복 확인 메세지 -->
						<div class="row checking">
							<div class="col md-3">
								<h9 id="email_checking"> </h9>
							</div>
						</div>
					</div>
				</div>





				<!-- 닉네임 -->
				<div class="row insert" style="height: 85px;">
					<!-- 닉네임 입력창 -->
					<div class="col">
						<div class="row label">
							<div class="col">
								<label for="member_nickname"> 닉네임</label>
							</div>
						</div>
						<div class="row input">
							<div class="col md-9">
								<input type="text" class="form-control" id="member_nickname"
									value="${profile.nick_name}"
									name="member_nickname" pattern="^[가-힣a-zA-Z0-9]{2,10}$"
									minlength="2" maxlength="10" required readonly
									style="width: 255px;">
							</div>
						</div>
					</div>
				</div>




			<!-- '수정하기' 버튼 클릭시 '수정완료'버튼과 '취소'버튼 보여지고 '수정하기'버튼 숨겨짐 -->	
				<div class="row">
				<!-- 수정 버튼 -->
					<button class="btn btn-secondary" id="edit" type="button"
						style="background-color: #76b852;">수정하기</button>
				<!-- 수정완료,취소 버튼 -->		
					<button class="btn btn-secondary" id="edit_complete"
						style="background-color: #76b852;">수정완료</button>
					<button class="btn btn-secondary" id="edit_cancel" type="button"
						style="background-color: #76b852;">취소</button>
				</div>

			</form>

		</div>

	</div>










	<script>
		$("#edit_pw").hide();
		$("#edit_phone_btn").hide();
		$("#edit_complete").hide();
		$("#edit_cancel").hide();

		$("#edit")
				.on(
						"click",
						function() {
							$("#edit").hide();
							$("#edit_pw").show();
							$("#edit_phone_btn").show();
							$("#edit_complete").show();
							$("#edit_cancel").show();
							$(
									"#member_birth_year,#member_birth_month,#member_birth_day,#member_email,#member_nickname")
									.removeAttr("readonly");

						})

		$("#edit_cancel").on("click", function() {
			location.href = "";
		});

		//비밀번호 변경 버튼
		$("#edit_pw_fadeIn").hide();
		$("#edit_pw_btn").on("click", function() {
			if ($("#edit_pw_fadeIn").css("display") == "none") {
				$("#edit_pw_fadeIn").fadeIn();
				$("#edit_pw_btn").html("비밀번호 변경 취소");
			} else {
				$("#edit_pw_fadeIn").hide();
				$("#edit_pw_btn").html("비밀번호 변경");
				$("#member_pw").val("");
				$("#member_new_pw").val("")
			}
		})

		//비밀번호 보기&숨기기 버튼
		$("#view_pw").on("click", function() {
			let password_field = $("#member_pw");
			let new_password_field = $("#member_new_pw");
			let password_field_type = password_field.attr("type");
			let new_password_field_type = new_password_field.attr("type");

			if (password_field_type == "password") {
				password_field.attr("type", "text");
				new_password_field.attr("type", "text");
				$("#view_pw").html("숨기기");
			} else {
				password_field.attr("type", "password");
				new_password_field.attr("type", "password");
				$("#view_pw").html("보기");
			}

		})

		//전화번호 중복 체크
		let phone_valid = false;
		let regex_phone = /^[0-9]{10,11}$/;
		$("#member_phone1,#member_phone2,#member_phone3").on(
				"keyup",
				function() {
					let phone = $("#member_phone1").val()
							+ $("#member_phone2").val()
							+ $("#member_phone3").val();
					console.log(phone);
					$.ajax(
							{
								url : "/phone_over_check.member",
								type : "post",
								data : {
									member_phone : $("#member_phone1").val()
											+ $("#member_phone2").val()
											+ $("#member_phone3").val()
								},
								error : function() {
									alert("서버 요청 실패");
								}

							}).done(
							function(resp) {
								resp = JSON.parse(resp);
								console.log(resp);
								if (resp) { //true면 중복인거
									$("#phone_checking").html(
											"이미 사용중인 전화번호 입니다.").css({
										"color" : "red"
									}).css("font-size", "x-small");
									phone_valid = false;
								} else {
									$("#phone_checking").html("");
									phone_valid = true;
								}

							})
				})

		//전화번호 변경 버튼 				
		$("#veri_code").hide();
		$("#edit_phone_btn").on(
				"click",
				function() {
					if ($("#veri_code").css("display") == "none") {
						$("#veri_code").fadeIn();
						$("#member_phone1,#member_phone2,#member_phone3")
								.removeAttr("readonly");
						$("#edit_phone_btn").html("변경 취소");
					} else {
						$("#veri_code").hide();
						$("#member_phone1,#member_phone2,#member_phone3").attr(
								"readonly", "true");
						$("#edit_phone_btn").html("변경");
					}
				})

		//이메일 중복 체크
		let email_valid = false;
		$("#member_email").on("keyup", function() {
			let email = $("#member_email").val();
			console.log(email);
			$.ajax({
				url : "/email_over_check.member",
				type : "post",
				data : {
					member_email : $("#member_email").val()
				},
				error : function() {
					alert("서버 요청 실패");
				}
			}).done(function(resp) {
				resp = JSON.parse(resp);
				console.log(resp);
				if (resp) { //true면 중복인거
					$("#email_checking").html("이미 사용중인 이메일 주소입니다.").css({
						"color" : "red"
					}).css("font-size", "x-small");
					email_valid = false;
				} else {
					$("#email_checking").html("");
					email_valid = true;
				}

			})
		})

		//submit전 전화번호,이메일 중복 검사
		$("#join").on("click", function() {

			if (!phone_valid) {
				alert("전화번호 중복 여부를 확인하세요.");
				return false;
			}

			if (!email_valid) {
				alert("이메일 중복 여부를 확인하세요.");
				return false;
			}

		})

		
	</script>

</body>
</html>