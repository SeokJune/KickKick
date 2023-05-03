<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인</title>
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
<!--Popper Development version -->
<script src="https://unpkg.com/@popperjs/core@2"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>

<style>
* {
	font-family: 'NanumSquareNeoBold';
}

html {
	background-color: #76b852;
}

body {
	background-color: #76b852;
}

.row {
	-bs-gutter-x: 2rem;
	-bs-gutter-y: 0;
	display: flex;
	flex-wrap: wrap;
	margin-top: calc(var(- -bs-gutter-y)* -1);
	margin-right: calc(var(- -bs-gutter-x)* -.5);
	margin-left: calc(var(- -bs-gutter-x)* -.5);
}

.login_container {
	margin-top: 10%;
	margin-bottom: 5%;
}

.login-logo {
	position: relative;
	margin-left: -41.5%;
}

.wrapper {
	width: 80%;
	padding: 32px;
	background: whitesmoke;
	border-radius: 1rem;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
	animation-duration: 5s;
}

.login-form-1 h3 {
	text-align: center;
	margin-bottom: 12%;
}

.login-form-2 h3 {
	text-align: center;
	margin-bottom: 8%;
}

.site_login {
	font-weight: 600;
	width: 100%;
	color: whitesmoke;
	background-color: #76b852;
	border: none;
	padding: 2%;
}

#pw {
	margin-bottom: 0;
}

.login_button>button>img {
	height: 50px;
	width: 50px;
}

.btnSubmit {
	border: none;
	cursor: pointer;
	appearance: none;
	background-color: rgba(0, 0, 139, 0)
}

.btn_forget_pwd {
	font-size: small;
}

.btn_forget_pwd:hover {
	cursor: pointer;
}

.join_form {
	font-size: small;
}

.col-md-6 {
	font-size: medium;
}

.col-6 {
	font-size: small;
}

#to_main_ball_img:hover {
	cursor: pointer;
}

.wrong .bi-check {
	display: none;
}

.good .bi-x {
	display: none;
}

.valid-feedback, .invalid-feedback {
	margin-left: 0.5rem;
}

#tooltip {
	display: inline-block;
	background: #76b852;
	color: whitesmoke;
	font-weight: bold;
	padding: 5px 10px;
	font-size: 13px;
	border-radius: 4px;
}

#arrow, #arrow::before {
	position: absolute;
	width: 8px;
	height: 8px;
	background: inherit;
}

#arrow {
	visibility: hidden;
}

#arrow::before {
	visibility: visible;
	content: '';
	transform: rotate(45deg);
}

#tooltip[data-popper-placement^='top']>#arrow {
	bottom: -4px;
}

#tooltip[data-popper-placement^='bottom']>#arrow {
	top: -4px;
}

#tooltip[data-popper-placement^='left']>#arrow {
	right: -4px;
}

#tooltip[data-popper-placement^='right']>#arrow {
	left: -4px;
}
</style>
</head>

<body>
	<div class="container login_container align-self-center">
		<div class="wrapper mx-auto position-relative">
			<div class="position-absolute top-10 end-0 me-5">
				<button type="button" class="btn-close visually-hidden" id="btn_close" aria-label="Close" onclick="location.reload();"></button>
			</div>
			<div class="wrapper_login" id="login_view_fadeOut">
				<div class="row d-flex justify-content-center mx-auto p-0 loginForm">
					<div class=" col-md-6 login-form-1">
						<!-- 로그인 창1 미디어 사이즈 xs이하되면 예만 남음-->
						<div class="KickKick_logo text-center d-md-block d-none">
							<h1 class="mb-4">⚽KickKick</h1>
							<h3>킥킥에 돌아오신걸 환영해요!</h3>
						</div>
						<div class="d-md-none d-block d-flex justify-content-end">
							<button type="button" class="btn-close" id="btn_to_back" aria-label="Close" onclick="location.href='/';"></button>
						</div>
						<form action="/login.member" method="post" id="form_login">
							<div class="form-group mb-4">
								<label class="control-label font-weight-bold font-size-7pt">아이디</label>
								<span>*</span>
								<input type="text" class="form-control" id="id" name="id" required />
							</div>
							<div class="form-group">
								<label class="control-label font-weight-bold font-size-7pt">비밀번호</label>
								<span>*</span>
								<input type="password" class="form-control m-0" id="pw" name="pw" required />
							</div>
							<div class="form-group mb-4">
								<a class="btn_forget_pwd" id="btn_forget_pwd">아이디 / 비밀번호를 잊으셨나요?</a>
							</div>
							<div class="form-group mb-4">
								<input type="submit" class="site_login form-control" value="Login" />
							</div>
						</form>
						<div class="form-group d-block d-md-none d-flex justify-content-center mb-4 login_button">
							<button class="btnSubmit kakao_login">
								<img src="/image/login_img/kakao_login_logo.png" alt="카카오 로그인">
							</button>
							<button class="btnSubmit naver_login">
								<img src="/image/login_img/naver_login_logo.png" alt="네이버 로그인">
							</button>
							<button class="btnSubmit apple_login">
								<img src="/image/login_img/apple_login_logo.png" alt="애플 로그인">
							</button>
						</div>
						<div class="form-group join_form">
							아직 계정이 없으신가요?
							<a href="/member/join_form.jsp" class="btnJoin">가입하기</a>
						</div>
					</div>
					<!-- 로그인창 2 미디어 사이즈 xs이하면 사라짐 -->
					<div class="d-none d-md-block col-md-6 login-form-2 align-self-center" id="hidden">
						<div class="form-group text-center mb-4">
							<div id="tooltip" role="tooltip" class="mb-3">
								메인으로!
								<div id="arrow" data-popper-arrow></div>
							</div>
							<img src="/image/login_img/ball_icon.png" class="mx-auto d-block" id="to_main_ball_img" alt="메인으로" onclick="location.href = '/'" style="height: 50%; width: 50%;">
						</div>
						<div class="form-group text-center">
							<h5>SNS으로 로그인하기</h5>
						</div>
						<div class="form-group text-center d-flex justify-content-center login_button" style="background-color: #25252500;">
							<button class="btnSubmit kakao_login">
								<img src="/image/login_img/kakao_login_logo.png" alt="카카오 로그인">
							</button>
							<button class="btnSubmit naver_login">
								<img src="/image/login_img/naver_login_logo.png" alt="네이버 로그인">
							</button>
							<button class="btnSubmit apple_login">
								<img src="/image/login_img/apple_login_logo.png" alt="애플 로그인">
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- id/pw 찾기 누르면 fadeIn -->
			<div class="wrapper_find_member" id="find_member_fadeIn" style="display: none">
				<div class="row d-flex justify-content-center mx-auto p-0 loginForm">
					<div class="col-md-6 login-form-1 align-center">
						<div class="KickKick_logo text-center d-md-block mb-4">
							<h3 class="mb-5">계정 찾기</h3>
							<p class="body_font mb-5">휴대폰 인증을 통해 아이디를 확인합니다.</p>
						</div>
						<div class="text-center">
							<input type="checkbox" class="btn-check" id="btn-check-outlined" autocomplete="off">
							<label class="btn btn-outline-success" for="btn-check-outlined">휴대폰 인증하기</label>
						</div>
						<hr>
						<div>
							<p class="footer_font">가입했던 계정이 기억나지 않으신가요?</p>
							<p class="footer_font">걱정마세요!</p>
							<p class="footer_font">customer@KickKick.co.kr로 문의하시길 바랍니다.</p>
						</div>
					</div>
				</div>
			</div>
			<!-- 휴대폰 인증하기 누르면 fadeIn -->
			<div class="wrapper_phone_Certification justify-content-center" id="to_phone_authentication_fadeIn" style="display: none">
				<div class="KickKick_logo text-center d-md-block mb-5">
					<h1 class="mb-4">⚽KickKick</h1>
					<h3>이제 얼마 안남았습니다!</h3>
				</div>
				<div class="row g-3">
					<div class="col-12 col-md-4 text-end">
						<label for="phone" class="col-form-label">전화번호</label>
					</div>
					<div class="col-12 col-md-4">
						<input type="text" id="phone" name="phone" class="form-control" placeholder="(-) 제외">
					</div>
					<div class="col-12 col-md-4">
						<button type="submit" class="btn btn-outline-success" id="phone_auth">인증번호 받기</button>
					</div>
					<div class="row g-3 m-0 p-0  justify-content-center">
						<div class="col-12 col-md-4">
							<div class="timer">
								<div id="timeLimit"></div>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="row g-3">
					<div class="col-12 col-md-4 text-end">
						<label class="col-form-label">인증번호</label>
					</div>
					<div class="col-12 col-md-4">
						<input type="text" id="phone_auth_code" class="form-control">
					</div>
					<div class="col-12 col-md-4">
						<button type="button" class="btn btn-outline-success" id="phone_auth_ok">인증</button>
					</div>
				</div>
			</div>
			<!-- 인증하기 누르면 fadeIn -->
			<div class="wrapper_change_pw justify-content-center" id="to_change_pw_fadeIn" style="display: none">
				<div class="KickKick_logo text-center d-md-block mb-5">
					<h1 class="mb-4">⚽KickKick</h1>
					<h3 id="search_id"></h3>
					<h3>이제 진짜 진짜 얼마 안남았어요!</h3>
				</div>
				<div class="row d-flex justify-content-center">
					<div class="col-12 col-md-6 mb-1">
						<div class="input-group d-flex">
							<input type="password" class="form-control rounded mt-1" placeholder="새 비밀번호" aria-label="password" aria-describedby="password" id="password" class="password" />
							<div class="valid-feedback">Good</div>
							<div class="invalid-feedback">Wrong</div>
						</div>
					</div>
				</div>
				<div class="row d-flex justify-content-center">
					<div class="col-12 col-md-6 mt-1">
						<div class="input-group d-flex">
							<input type="password" class="form-control rounded mt-1" placeholder="새 비밀번호" aria-label="password" aria-describedby="password_check" id="password_check" class="password_check" />
							<div class="valid-feedback">Good</div>
							<div class="invalid-feedback">Wrong</div>
						</div>
					</div>
					<br>
					<div class="row d-flex justify-content-center">
						<div class="col-6 mt-4 mt-xxl-0 w-auto h-auto">
							<div class="alert px-4 py-3 mb-0 d-none" role="alert" data-mdb-color="warning" id="password-alert">
								<ul class="list-unstyled mb-0">
									<li class="requirements leng">
										<i class="bi bi-check text-success me-2"></i>
										<i class="bi bi-x text-danger me-3"></i>
										암호는 8자 이상이어야 합니다
									</li>
									<li class="requirements big-letter">
										<i class="bi bi-check text-success me-2"></i>
										<i class="bi bi-x text-danger me-3"></i>
										암호에 하나 이상의 알파벳 대문자를 포함해야 합니다.
									</li>
									<li class="requirements num">
										<i class="bi bi-check text-success me-2"></i>
										<i class="bi bi-x text-danger me-3"></i>
										암호에 숫자가 하나 이상 포함되어야 합니다.
									</li>
									<li class="requirements special-char">
										<i class="bi bi-check text-success me-2"></i>
										<i class="bi bi-x text-danger me-3"></i>
										암호에 특수문자가 하나 이상 포함되어야 합니다.
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="row d-flex justify-content-center">
					<div class="col-12 col-md-6 d-flex justify-content-center">
						<button type="button" class="btn btn-outline-success" id="btn_change_pw">비밀번호 변경하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		// 아이디/비밀번호 확인
		$($(".site_login")[0]).on("click", function (evt) {
			evt.preventDefault();
			$.ajax({
				url: "/login_chk.member",
				type: "post",
				dataType: "json",
				data: {
					id: $("#id").val(),
					pw: $("#pw").val()
				}
			}).done(function (chk_result) {
				if (!chk_result) {
					$("#id").val("");
					$("#pw").val("");
					alert("올바른 사용자 아이디와 비밀번호를 입력해주세요.");
				} else {
					$("#form_login").submit();
				}
			});
		});
		// 아이디/비밀번호 찾기 버튼
		$("#btn_forget_pwd").on("click", function () {
			$("#login_view_fadeOut").hide();
			$("#find_member_fadeIn").fadeIn();
			$("#btn_close").removeClass("visually-hidden");
		});
		// 휴대폰 인증하기 버튼
		$("#btn-check-outlined").on("click", function () {
			$("#login_view_fadeOut").hide();
			$("#find_member_fadeIn").hide();
			$("#to_phone_authentication_fadeIn").fadeIn();
			$("#btn_close").removeClass("visually-hidden");
		});
		// 타이머 구현
		function $ComTimer() { }
		$ComTimer.prototype = {
			comSecond: "",
			fnCallback: function () { },
			timer: "",
			domId: "",
			fnTimer: function () {
				// 남은 시간 계산
				var m = Math.floor(this.comSecond / 60) + "분 " + (this.comSecond % 60) + "초";
				// 1초씩 감소
				this.comSecond--;					
				this.domId.innerText = m;
				// 시간이 종료 되었으면..
				if (this.comSecond < 0) {
					// 타이머 해제
					clearInterval(this.timer);
					alert("인증시간이 초과하였습니다. 다시 인증해주시기 바랍니다.");
					$("#phone_auth").attr("disabled", false);
					$("#timeLimit").text("");
				}
			},
			fnStop: function () { clearInterval(this.timer); }
		}
		// 인증번호 받기 버튼 이벤트
		$("#phone_auth").on("click", function (evt) {
			// 전화번호 check 및 인증번호 발송
			$.ajax({
				url: "/phone_auth.member",
				type: "post",
				dataType: "json",
				data: { phone: $("#phone").val() }
			}).done(function (resp) {
				// 전화번호 check
				if (resp == "") {
					$("#phone").val("");
					alert("전화번호를 확인해주세요.");
					return false;
				}
				// 인증번호 받기 버튼 비활성화
				$("#phone_auth").attr("disabled", true);
				
				AuthTimer = new $ComTimer();
				// 제한 시간
				AuthTimer.comSecond = 180; 
				// 제한 시간 만료 메세지
				AuthTimer.fnCallback = function () { alert("다시인증을 시도해주세요.") };
				AuthTimer.timer = setInterval(function () { AuthTimer.fnTimer() }, 1000);
				AuthTimer.domId = document.getElementById("timeLimit");
			});
		});
		// 인증 버튼 이벤트
		$("#phone_auth_ok").on("click", function () {
			//입력 안했을 경우
			if(!$("#phone_auth_code").val()){
				alert("인증번호를 입력해주세요");
				return false;
			}
			// 인증 체크
			$.ajax({
				url: "/phone_auth_ok.member",
				type: "post",
				dataType: "json",
				data: { code: $("#phone_auth_code").val() }
			}).done(function name(resp) {
				if (resp.success) {
					AuthTimer.fnStop();
					$("#login_view_fadeOut").hide();
					$("#find_member_fadeIn").hide();
					$("#to_phone_authentication_fadeIn").hide();
					$("#to_change_pw_fadeIn").fadeIn();
					$("#search_id").text(resp.search_id + " 님!");
				} else {
					alert("인증번호를 다시 입력해주세요");
					$("#phone_auth_code").val("");
				}
			});
		});
		//pw 유효성 검사
		addEventListener("DOMContentLoaded", (event) => {
			const password = document.getElementById("password");
			const passwordAlert = document.getElementById("password-alert");
			const requirements = document.querySelectorAll(".requirements");
			let lengBoolean, bigLetterBoolean, numBoolean, specialCharBoolean;
			let leng = document.querySelector(".leng");
			let bigLetter = document.querySelector(".big-letter");
			let num = document.querySelector(".num");
			let specialChar = document.querySelector(".special-char");
			const specialChars = "!@#$%^&*()-_=+[{]}\\|;:'\",<.>/?`~";
			const numbers = "0123456789";

			requirements.forEach((element) => element.classList.add("wrong"));

			password.addEventListener("focus", () => {
				passwordAlert.classList.remove("d-none");
				if (!password.classList.contains("is-valid")) {
					password.classList.add("is-invalid");
				}
			});

			password.addEventListener("input", () => {
				let value = password.value;
				if (value.length < 8) {
					lengBoolean = false;
				} else if (value.length > 7) {
					lengBoolean = true;
				}

				if (value.toLowerCase() == value) {
					bigLetterBoolean = false;
				} else {
					bigLetterBoolean = true;
				}

				numBoolean = false;
				for (let i = 0; i < value.length; i++) {
					for (let j = 0; j < numbers.length; j++) {
						if (value[i] == numbers[j]) {
							numBoolean = true;
						}
					}
				}

				specialCharBoolean = false;
				for (let i = 0; i < value.length; i++) {
					for (let j = 0; j < specialChars.length; j++) {
						if (value[i] == specialChars[j]) {
							specialCharBoolean = true;
						}
					}
				}

				if (lengBoolean == true && bigLetterBoolean == true && numBoolean == true && specialCharBoolean == true) {
					password.classList.remove("is-invalid");
					password.classList.add("is-valid");

					requirements.forEach((element) => {
						element.classList.remove("wrong");
						element.classList.add("good");
					});
					passwordAlert.classList.remove("alert-warning");
					passwordAlert.classList.add("alert-success");
				} else {
					password.classList.remove("is-valid");
					password.classList.add("is-invalid");

					passwordAlert.classList.add("alert-warning");
					passwordAlert.classList.remove("alert-success");

					if (lengBoolean == false) {
						leng.classList.add("wrong");
						leng.classList.remove("good");
					} else {
						leng.classList.add("good");
						leng.classList.remove("wrong");
					}

					if (bigLetterBoolean == false) {
						bigLetter.classList.add("wrong");
						bigLetter.classList.remove("good");
					} else {
						bigLetter.classList.add("good");
						bigLetter.classList.remove("wrong");
					}

					if (numBoolean == false) {
						num.classList.add("wrong");
						num.classList.remove("good");
					} else {
						num.classList.add("good");
						num.classList.remove("wrong");
					}

					if (specialCharBoolean == false) {
						specialChar.classList.add("wrong");
						specialChar.classList.remove("good");
					} else {
						specialChar.classList.add("good");
						specialChar.classList.remove("wrong");
					}
				}
			});

			password.addEventListener("blur", () => {
				passwordAlert.classList.add("d-none");
			});
		});
		//pw 일치 검사
		addEventListener("DOMContentLoaded", (event) => {
			const password = document.getElementById("password_check");
			const passwordAlert = document.getElementById("password-alert");
			const requirements = document.querySelectorAll(".requirements");

			password.addEventListener("focus", () => {
				if (!password.classList.contains("is-valid")) {
					password.classList.add("is-invalid");
				}
			});
			requirements.forEach((element) => element.classList.add("wrong"));

			password.addEventListener("input", () => {
				let value = password.value;
				if (value == document.getElementById("password").value) {
					password.classList.remove("is-invalid");
					password.classList.add("is-valid");
	
					requirements.forEach((element) => {
						element.classList.remove("wrong");
						element.classList.add("good");
					});
					passwordAlert.classList.remove("alert-warning");
					passwordAlert.classList.add("alert-success");
				}
			});
		});
		//pw 변경
		$("#btn_change_pw").on("click", function () {
			let password = $("#password").val();
			let password_check = $("#password_check").val();
			if (password == password_check && password != "") {
				$.ajax({
					url: "/change_pw.member",
					type: "post",
					data: { id: $("#search_id").text().split(" ")[0] , password: $("#password").val() }
				}).done(function () {
					location.reload();
				});
			} else {
				password.val("");
				password_check.val("");
				alert("다시 입력해주세요");
			}
		});

		const image = document.querySelector("#to_main_ball_img");
		const tooltip = document.querySelector("#tooltip");

		const {createPopper} = Popper;
		// Pass the button, the tooltip, and some options, and Popper will do the
		// magic positioning for you:
		createPopper(image, tooltip, {
			placement: 'top',
			modifiers: [{
					name: 'offset',
					options: { offset: [0, 8] }
			}],
		});
	</script>
</body>

</html>