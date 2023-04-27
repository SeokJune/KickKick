<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<title>login_form</title>

<style>
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
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
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

.wrong .bi-check {
	display: none;
}

.good .bi-x {
	display: none;
}

.valid-feedback, .invalid-feedback {
	margin-left: 0.5rem;
}
</style>
</head>

<body>

	<div class="container login_container align-self-center">

		<div class="wrapper mx-auto position-relative">
			<div class="position-absolute top-10 end-0 me-5">
				<button type="button" class="btn-close" id="btn_close"
					aria-label="Close"></button>
			</div>
			<div class="wrapper_login" id="login_view_fadeOut">
				<div class="row d-flex justify-content-center mx-auto p-0 loginForm">
					<div class=" col-md-6 login-form-1">
						<!-- 로그인 창1 미디어 사이즈 xs이하되면 예만 남음-->
						<div class="KickKick_logo text-center d-md-block d-none">
							<h1 class="mb-4">⚽KickKick</h1>
							<h3>킥킥에 돌아오신걸 환영해요!</h3>
						</div>
						<form action="/login.member" method="post">
							<div class="form-group mb-4">
								<label class="control-label font-weight-bold font-size-7pt">아이디</label>
								<span>*</span> <input type="text" class="form-control" id="id"
									name="id" value="" />
							</div>
							<div class="form-group">
								<label class="control-label font-weight-bold font-size-7pt">비밀번호</label>
								<span>*</span> <input type="password" class="form-control m-0"
									id="pw" name="pw" value="" />
							</div>
							<div class="form-group mb-4">
								<a class="btn_forget_pwd" id="btn_forget_pwd">아이디 / 비밀번호를
									잊으셨나요?</a>
							</div>
							<div class="form-group mb-4">
								<input type="submit" class="site_login form-control"
									value="Login" />
							</div>
						</form>
						<div
							class="form-group d-block d-md-none d-flex justify-content-center mb-4 login_button">
							<button class="btnSubmit kakao_login">
								<img src="/image/login_img/kakao_login_logo.png" alt="">
							</button>
							<button class="btnSubmit naver_login">
								<img src="/image/login_img/naver_login_logo.png" alt="">
							</button>
							<button class="btnSubmit apple_login">
								<img src="/image/login_img/apple_login_logo.png" alt="">
							</button>
						</div>
						<div class="form-group join_form">
							아직 계정이 없으신가요? <a href="/member/join_form.jsp" class="btnJoin">
								가입하기</a>
						</div>
					</div>


					<!-- 로그인창 2 미디어 사이즈 xs이하면 사라짐 -->
					<div
						class="d-none d-md-block col-md-6 login-form-2 align-self-center"
						id="hidden">
						<div class="form-group text-center mb-4">
							<img src="/image/login_img/ball_icon.png" class="mx-auto d-block"
								id="to_main_ball_img" alt="" style="height: 50%; width: 50%;">
						</div>
						<div class="form-group text-center">
							<h5>SNS으로 로그인하기</h5>
						</div>
						<div
							class="form-group text-center d-flex justify-content-center login_button"
							style="background-color: #25252500;">
							<button class="btnSubmit kakao_login">
								<img src="/image/login_img/kakao_login_logo.png" alt="">
							</button>
							<button class="btnSubmit naver_login">
								<img src="/image/login_img/naver_login_logo.png" alt="">
							</button>
							<button class="btnSubmit apple_login">
								<img src="/image/login_img/apple_login_logo.png" alt="">
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- id/pw 찾기 누르면 fadeIn -->
			<div class="wrapper_find_member" id="find_member_fadeIn"
				style="display: none">
				<div class="row d-flex justify-content-center mx-auto p-0 loginForm">
					<div class=" col-md-6 login-form-1 align-center">

						<div class="KickKick_logo text-center d-md-block  mb-4">
							<h3 class="mb-5">계정 찾기</h3>
							<p class="body_font mb-5">휴대폰 인증을 통해 아이디를 확인합니다.</p>
						</div>
						<div class="text-center">
							<input type="checkbox" class="btn-check align-"
								id="btn-check-outlined" autocomplete="off"> <label
								class="btn btn-outline-success" for="btn-check-outlined">휴대폰
								인증하기</label><br>
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
			<div class="wrapper_phone_Certification justify-content-center"
				id="to_phone_authentication_fadeIn" style="display: none">
				<div class="KickKick_logo text-center d-md-block mb-5">
					<h1 class="mb-4">⚽KickKick</h1>
					<h3>이제 얼마 안남았습니다!</h3>
				</div>
				<div class="row g-3">
					<div class="col-12 col-md-4 text-end">
						<label for="phone" class="col-form-label">전화번호</label>
					</div>
					<div class="col-12 col-md-4">
						<input type="text" id="phone" name="phone" class="form-control"
							placeholder="(-) 제외">
					</div>
					<div class="col-12 col-md-4">
						<button type="submit" class="btn btn-outline-success"
							id="phone_auth">인증번호 받기</button>
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
						<button type="button" class="btn btn-outline-success"
							id="phone_auth_ok">인증</button>
					</div>
				</div>
			</div>
			<!-- 인증하기 누르면 fadeIn -->
			<div class="wrapper_change_pw justify-content-center"
				id="to_change_pw_fadeIn" style="display: none">
				<div class="KickKick_logo text-center d-md-block mb-5">
					<h1 class="mb-4">⚽KickKick</h1>
					<h3>'${session.id}'님! 이제 진짜 진짜 얼마 안남았어요!</h3>
				</div>
				<div class="row d-flex justify-content-center">
					<div class="col-12 col-md-6">
						<div class="input-group d-flex">
							<input type="password" class="form-control rounded mt-1"
								placeholder="새 비밀번호" aria-label="password"
								aria-describedby="password" id="password" class="password" />
							<div class="valid-feedback">Good</div>
							<div class="invalid-feedback">Wrong</div>
						</div>
					</div>
					<div class="col-12 col-md-6">
						<div class="input-group d-flex">
							<input type="password" class="form-control rounded mt-1"
								placeholder="새 비밀번호" aria-label="password"
								aria-describedby="password_check" id="password_check" class="password_check" />
							<div class="valid-feedback">Good</div>
							<div class="invalid-feedback">Wrong</div>
						</div>
					</div>
					<br>
					<div class="col-6 mt-4 mt-xxl-0 w-auto h-auto">

						<div class="alert px-4 py-3 mb-0 d-none" role="alert"
							data-mdb-color="warning" id="password-alert">
							<ul class="list-unstyled mb-0">
								<li class="requirements leng"><i
									class="bi bi-check text-success me-2"></i> <i
									class="bi bi-x text-danger me-3"></i> 암호는 8자 이상이어야 합니다</li>
								<li class="requirements big-letter"><i
									class="bi bi-check text-success me-2"></i> <i
									class="bi bi-x text-danger me-3"></i> 암호에 하나 이상의 알파벳 대문자를 포함해야
									합니다.</li>
								<li class="requirements num"><i
									class="bi bi-check text-success me-2"></i> <i
									class="bi bi-x text-danger me-3"></i> 암호에 숫자가 하나 이상 포함되어야 합니다.
								</li>
								<li class="requirements special-char"><i
									class="bi bi-check text-success me-2"></i> <i
									class="bi bi-x text-danger me-3"></i> 암호에 특수문자가 하나 이상 포함되어야
									합니다.</li>
							</ul>
						</div>

					</div>
				</div>
				<br>
				<div class="row d-flex justify-content-center">
					<div class="col-12 col-md-6 d-flex justify-content-center">
						<button type="button" class="btn btn-outline-success"
							id="btn_change_pw">비밀번호 변경하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- wrapper tag -->
	</div>

	<!-- JQuery-->
	<script>
		$("#btn_close").on("click", function() {
			location.reload();
		});
		$("#to_main_ball_img").on("click", function() {
			location.href = "/index.jsp";
		});
		$("#btn_forget_pwd").on("click", function() {
			$("#login_view_fadeOut").hide();
			$("#find_member_fadeIn").fadeIn();
		});

		$("#btn-check-outlined").on("click", function() {
			$("#login_view_fadeOut").hide();
			$("#find_member_fadeIn").hide();
			$("#to_phone_authentication_fadeIn").fadeIn();
		});
		$("#phone_auth").on("click", function() {
			$.ajax({
				url : "/phone_auth.member",
				type : "post",
				data : {
					phone : $("#phone").val()
				}
			});
		});
		$("#phone_auth_ok").on("click", function() {
			$("#login_view_fadeOut").hide();
			$("#find_member_fadeIn").hide();
			$("#to_phone_authentication_fadeIn").hide();
			$("#to_change_pw_fadeIn").fadeIn();
			$.ajax({
				url : "/phone_auth_ok.member",
				type : "post",
				data : {
					code : $("#phone_auth_code").val()
				}
			}).done({

			// 아이디는 우리가 출력되게해주고 비밀번호만 다시 재설정하기로 짜야함!
			// null 값 return 
			//writer.println("<script>alert('인증이 완료되었습니다. 비밀번호 재성절 페이지로 이동합니다'); location.href=`/member/change_pw.jsp`;<\/script>"); 
			//writer.close();
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
                if(value == document.getElementById("password").value){
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
        //pw 빈칸 체크
		$("#btn_change_pw").on("click", function() {
			let password = $("#password").val();
			let password_check = $("#password_check").val();
			if(password == password_check){
				alert("로그인페이지로 이동합니다");
				$.ajax({
					url:"/change_pw.member",
					type:"post",
					data:{
						id:${session.id},
						password:$("#password").val()
					}
				});
				location.reload();
			}else{
				alert("다시 입력해주세요");
			}
		});
	</script>

</body>


</html>