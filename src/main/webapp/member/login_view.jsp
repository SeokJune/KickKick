<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
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

.login_container {
	margin-top: 10%;
	margin-bottom: 5%;
}

.login-logo {
	position: relative;
	margin-left: -41.5%;
}

.wrapper {
	padding: 32px;
	background: whitesmoke;
	border-radius: 1rem;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
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

.btnForgetPwd {
	font-size: small;
}

.join_form {
	font-size: small;
}
</style>
</head>

<body>

	<div class="container login_container">
		<div class="wrapper">
			<div class="row d-flex justify-content-center mx-auto p-0 loginForm"">
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
						<span>*</span> <input type="pw" class="form-control m-0" id="pw"
							name="pw" value="" />
					</div>
					<div class="form-group mb-4">
						<a href="/findMember.member" class="btnForgetPwd">아이디 / 비밀번호를 잊으셨나요?</a>
					</div>
					<div class="form-group mb-4">
						<input type="submit" class="site_login form-control" value="Login" />
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
						아직 계정이 없으신가요? <a href="#" class="btnJoin"> 가입하기</a>
					</div>
				</div>
				<!-- 로그인창 2 미디어 사이즈 xs이하면 사라짐 -->
				<div class="d-none d-md-block col-md-6 login-form-2" id="hidden">
					<div class="form-group text-center mb-4">
						<img src="/image/login_img/ball_icon.png" class="mx-auto d-block"
							alt="" style="height: 50%; width: 50%;">
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

					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- JQuery-->

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>


</html>