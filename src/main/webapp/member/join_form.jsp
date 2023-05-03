<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
<!-- sweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
html {
	background-color: #76b852;
}

body {
	background-color: #76b852;
	font-family: 'NanumSquareNeo';
}

.container {
	margin-top: 10%;
	margin-bottom: 5%;
}

.wrapper {
	width: 80%;
	padding: 32px;
	background: whitesmoke;
	border-radius: 1rem;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
	animation-duration: 5s;
}

.welcome {
	height: 100%;
	width: 50%;
	padding: 32px;
	background: whitesmoke;
	border-radius: 1rem;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
	animation-duration: 5s;
	margin: 0 auto;
}

label {
	font-size: small;
	font-family: 'NanumSquareNeoBold';
}

.essential {
	font-size: small;
	font-family: 'NanumSquareNeoBold';
	color: red;
}

.condition {
	font-size: 11px;
}

.btn {
	font-size: small;
}

#password-alert





 





*





 





&
nbsp





 





;{
font-size










:










x-small








;
}
.wrong .bi-check {
	display: none;
}

.good .bi-x {
	display: none;
}

.valid-feedback, .invalid-feedback {
	font-size: small;
}

.alert {
	font-family: 'NanumSquareNeoBold';
	text-color: black;
}

.row .insert {
	justify-content: center;
}

#member_birth_day {
	padding: 0.375rem 0 0.375rem 0;
	font-size: 0.75rem;
}

.form-select {
	padding: 0.375rem 0 0.375rem 0;
	background-size: 8px 8px;
	font-size: 0.75rem;
}

@media ( min-width :@screen-sm-min) {
	.form-select {
		padding: 0.375rem 0 0.375rem 0;
		background-size: 8px 8px;
		font-size: 0.75rem;
	}
}

.wrapper .welcome {
	width: 80%;
	padding: 32px;
	background: whitesmoke;
	border-radius: 1rem;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
	animation-duration: 5s;
}
</style>
</head>

<body>
	<div class="container join_form_container d-flex justify-content-center">
		<div class="wrapper join_form" id="join_form">
			<div class="header text-center">
				<h3>⚽KickKick</h3>
			</div>
			<form action="/insert_new_member.member" method="post">
				<div class="row justify-content-center">
					<div class="col-12 col-md-8">
						<!-- *&nbsp;타이틀 -->
						<div class="row insert">
							<div class="col-10">
								<div class="row label">
									<div class="col-12">
										<span class="essential" style="font-size: x-small;">*&nbsp;</span>
										<label for="member_id" style="font-size: x-small;">은 필수로 입력해주세요.</label>
									</div>
								</div>
							</div>
						</div>
						<!-- 아이디 -->
						<div class="row insert">
							<div class="col-10">
								<!-- 아이디 타이틀 -->
								<div class="row label">
									<div class="col-12">
										<span class="essential">*&nbsp;</span>
										<label for="member_id">아이디</label>
									</div>
								</div>
								<!-- 아이디 입력창 -->
								<div class="row input">
									<div class="col-12">
										<input type="text" class="form-control" id="member_id" name="member_id" onkeyup="checksum(this, 'A');" pattern="^[a-z](?=.*[0-9])[0-9a-z]{4,19}$" title="영소문자와 숫자 포함 5자 이상 20자 이하" maxlength="20" required>
									</div>
								</div>
								<!-- 아이디 중복확인 메세지 -->
								<div class="row checking">
									<div class="col-12">
										<h9 id="member_id_checking" style="font-size:x-small;"></h9>
									</div>
								</div>
							</div>
						</div>
						<!-- 비밀번호 -->
						<div class="row insert">
							<div class="col-10">
								<!-- 비밀번호 타이틀 -->
								<div class="row label">
									<div class="col-12">
										<span class="essential">*&nbsp;</span>
										<label for="member_id">비밀번호</label>
									</div>
								</div>
								<!-- 비밀번호 보기 & 숨기기 버튼 -->
								<!-- 
								<div class="row label">
									<div class="col-10">
										<button class="btn btn-sm p-0" id="view_pw" type="button">보기</button>
									</div>
								</div>
								 -->
								<!-- 비밀번호 입력창 -->
								<div class="row input">
									<div class="col-12">
										<input type="password" class="password form-control rounded" aria-label="password" aria-describedby="password" id="member_pw" name="member_pw" maxlength="20" />
										<div class="valid-feedback">Good</div>
										<div class="invalid-feedback">Wrong</div>
									</div>
								</div>
								<!-- 아이디 중복 확인 메세지 -->
								<div class="row d-flex justify-content-center">
									<div class="col-10 mt-xxl-0 w-auto h-auto">
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
								<!-- 비밀번호 확인 입력창 -->
								<div class="row input">
									<div class="col-12">
										<input type="password" class="password_check form-control rounded mt-1" aria-label="password" aria-describedby="password_check" id="password_check" maxlength="20" />
										<div class="valid-feedback">Good</div>
										<div class="invalid-feedback">Wrong</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 이름 -->
						<div class="row insert">
							<div class="col-10">
								<!-- 이름 타이틀 -->
								<div class="row label">
									<div class="col-12">
										<span class="essential">*&nbsp;</span>
										<label for="member_name">이름</label>
									</div>
								</div>
								<!-- 이름 입력창 -->
								<div class="row input">
									<div class="col-12">
										<input type="text" class="form-control" id="member_name" name="member_name" onkeyup="checksum(this, 'R');" pattern="^[가-힣]{2,5}$" title="2자 이상 5자 이내의 한글" minlength="2" maxlength="5" required>
									</div>
								</div>
							</div>
						</div>
						<!-- 닉네임 -->
						<div class="row insert">
							<div class="col-10 ">
								<!-- 닉네임 타이틀 -->
								<div class="row label">
									<div class="col-12">
										<span class="essential">*&nbsp;</span>
										<label for="member_nickname">닉네임</label>
									</div>
								</div>
								<!-- 닉네임 입력창 -->
								<div class="row input">
									<div class="col-12">
										<input type="text" class="form-control" id="member_nickname" name="member_nickname" onkeyup="checksum(this, 'A');" pattern="^[가-힣a-zA-Z0-9]{2,10}$" title="2자 이상 10자 이내로 한글, 영대소문자, 숫자 중 1개 이상 포함 " minlength="2" maxlength="10">
									</div>
								</div>
								<!-- 닉네임 중복 확인 메세지 -->
								<div class="row checking">
									<div class="col-12">
										<h9 id="member_nickname_checking" style="font-size:x-small;"></h9>
									</div>
								</div>
							</div>
						</div>
						<!-- 전화번호 -->
						<div class="row insert" id="pAuth">
							<div class="col-10">
								<!-- 전화번호 타이틀 -->
								<div class="row label">
									<div class="col-12">
										<span class="essential">*&nbsp;</span>
										<label for="member_phone">전화번호</label>
									</div>
								</div>
								<!-- 전화번호 입력창 & 인증번호 받기 버튼 -->
								<div class="row input">
									<div class="col-8">
										<input type="text" class="form-control" id="member_phone" name="member_phone" onkeyup="checksum(this, 'A');" pattern="^010[0-9]{8}$" title="010으로 시작하는 11자리 번화번호" maxlength="11" placeholder="(-) 제외" required>
									</div>
									<div class="col-4 mt-1 d-flex justify-content-center">
										<button type="button" class="btn btn-outline-success text-wrap" id="phone_auth">인증번호 받기</button>
									</div>
								</div>
								<!-- 전화번호 중복 메세지 -->
								<div class="row checking">
									<div class="col-12">
										<h9 id="member_phone_checking" style="font-size:x-small;"></h9>
									</div>
								</div>
								<br>
								<!-- 인증번호 입력창 -->
								<div class="row input">
									<div class="col-12">
										<input type="text" id="phone_auth_code" class="form-control">
									</div>
								</div>
								<!-- 인증 시간 & 인증 버튼 -->
								<div class="row justify-content-end">
									<div class="col-auto timer mx-3 p-1">
										<div id="timeLimit">03분00초</div>
									</div>
									<div class="col-auto">
										<button type="button" class="btn btn-outline-success" id="phone_auth_ok">인증</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 생년월일 -->
						<div class="row insert">
							<div class="col-10">
								<!-- 생년월일 타이틀 -->
								<div class="row label">
									<div class="col-12">
										<span class="essential">*&nbsp;</span>
										<label for="member_birth">생년월일</label>
									</div>
								</div>
								<!-- 생년월일 입력창 -->
								<div class="row input">
									<div class="col-4 d-flex align-items-center">
										<select class="form-select m-1 ps-1" id="member_birth_year" name="member_birth_year"></select>
										년
									</div>
									<div class="col-4 d-flex align-items-center">
										<select class="form-select m-1 ps-1" id="member_birth_month" name="member_birth_month"></select>
										월
									</div>
									<div class="col-4 d-flex align-items-center">
										<input type="text" class="form-control m-1 ps-1" id="member_birth_day" name="member_birth_day" onkeyup="checksum(this, 'R');" pattern="^(0[1-9]|[12][0-9]|3[01])$" title="두자리로 입력" minlength="2" maxlength="2" required>
										일
									</div>
								</div>
							</div>
						</div>
						<!-- 이메일 -->
						<div class="row insert">
							<div class="col-10">
								<!-- 이메일 타이틀 -->
								<div class="row label">
									<div class="col-12">
										<span class="essential">&nbsp;&nbsp;</span>
										<label for="member_email">E-mail</label>
									</div>
								</div>
								<!-- 이메일 입력창 -->
								<div class="row input">
									<div class="col-12">
										<input type="email" class="form-control" id="member_email" name="member_email" onkeyup="checksum(this, 'A');" pattern="^([a-z]{1}[a-z0-9_+.-]+@)([a-zA-Z0-9]+\.)([a-z0-9]{2,4})$" title="abc@abc.com 형식으로 입력">
									</div>
								</div>
								<!-- 이메일 중복 확인 메세지 -->
								<div class="row checking">
									<div class="col-12">
										<h9 id="member_email_checking" style="font-size:x-small;"></h9>
									</div>
								</div>
							</div>
						</div>
						<!-- 가입동의 -->
						<hr>
						<div class="row insert">
							<div class="col-10">
								<!-- 가입동의 입력창 -->
								<div class="row input member_agree justify-content-center">
									<div class="col-auto">
										<span> 가입에 동의하시겠습니까? </span>
										<input class="form-check-input" type="checkbox" id="member_agree" name="member_agree" value="Y" required>
									</div>
								</div>
							</div>
						</div>
						<!-- 가입버튼 & 돌아가기 버튼 -->
						<br>
						<div class="row justify-content-center">
							<div class="col-auto d-flex justify-content-end">
								<button class="btn btn-secondary" id="join" style="background-color: #76b852;">가입하기</button>
							</div>
							<div class="col-auto d-flex justify-content-start">
								<a href="/member/login_view.jsp">
									<button class="btn btn-secondary" type="button" id="back" style="background-color: #76b852;">뒤로가기</button>
								</a>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		// 정규식 & 중복 체크 - 아이디 & 닉네임 & 이메일
		let valid = new Map();
		function checksum(evt, type) {
			let id = $(evt).attr("id");
			let regex = new RegExp($(evt).attr("pattern"));
			let value = $(evt).val();
			// MAP(valid)에 KEY(value)가 없으면 flase 추가
			if (valid.get(id) != true || valid.get(id) != false) {
				valid.set(id, false);
			}
			// 정규식 체크
			if (!regex.exec(value)) {
				$("#" + id + "_checking").html($(evt).attr("title")).css(
						"color", "red");
				valid.set(id, false);
				return false;
			} else {
				valid.set(id, true);
			}
			// 중복체크 여부 확인
			if (type != "A") return false;
			// 중복 체크
			$.ajax({
				url : "/checksum.member",
				type : "post",
				dataType : "json",
				data : {
					param : value
				},
				error : function() {
					alert("서버 요청 실패");
				}
			}).done(
					function(resp) {
						if (resp) {
							$("#" + id + "_checking").html(
									"중복된 " + id.split("_")[1].toUpperCase())
									.css("color", "red");
							valid.set(id, false);
						} else {
							$("#" + id + "_checking").html(
									"사용가능한 " + id.split("_")[1].toUpperCase())
									.css("color", "red");
							valid.set(id, true);
						}
					});
		}
		// PW 유효성 검사
		addEventListener("DOMContentLoaded", (event) => {
			const password = document.getElementById("member_pw");
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
		// PW 일치 검사
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
				if (value == document.getElementById("member_pw").value) {
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
		// 휴대폰 인증하기 버튼
		$("#btn-check-outlined").on("click", function () {
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
				data: { phone: $("#member_phone").val() }
			}).done(function (str) {
				rand_code = str;
				
				// 전화번호 check
				if (rand_code == "") {
					$("#member_phone").val("");
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
			// 틀린 경우 다시 입력
			if($("#phone_auth_code").val() != rand_code ){
				alert("인증번호를 다시 입력해주세요");
				$("#phone_auth_code").val("");
				return false;
			}else{
				$.ajax({
					url: "/phone_auth_ok.member",
					type: "post",
					data: { rand: rand_code, code: $("#phone_auth_code").val() }
				}).done(function name() {
					AuthTimer.fnStop();
					$("#timeLimit").text("인증 성공!🎉");
					$("#pAuth button").attr("disabled", true);
					$("#pAuth input").attr("readonly", true);
				});
			}
		});
		// 생년월일 select option setting
		$(document).ready(function () {
			var now = new Date();
			var year = now.getFullYear();
			var mon = (now.getMonth() + 1) > 9 ? '' + (now.getMonth() + 1) : '0' + (now.getMonth() + 1);
			//년도 selectbox만들기               
			for (var i = year - 100; i <= year; i++) {
				$('#member_birth_year').append('<option value="' + i + '">' + i + '</option>');
			}
			$("#member_birth_year>option[value="+ year + "]").attr("selected", "true");
			// 월별 selectbox 만들기            
			for (var i = 1; i <= 12; i++) {
			    var mm = i > 9 ? i : "0" + i;
			    $('#member_birth_month').append('<option value="' + mm + '">' + mm + '</option>');
			}
			$("#member_birth_month>option[value=" + mon + "]").attr("selected", "true");
		});
		
		// 비밀번호 보기
		$("#view_pw").on("click", function() {
			let password_field = $("#member_pw");
			let password_field_type = password_field.attr("type");
			if (password_field_type == "password") {
				password_field.attr("type", "text");
				$("#view_pw").html("숨기기");
			} else {
				password_field.attr("type", "password");
				$("#view_pw").html("보기");
			}
		});
	</script>
	<!-- 가입 완료시 가입 환영 메세지 -->
	<c:if test="${param.status=='complete'}">
		<script>
			$(".container").css({
				"height" : "300px"
			})
			$("#join_form").css({
				"display" : "none"
			});
		</script>
		<div class="wrapper welcome" id="welcome_fadein">
			<div class="row">
				<div class="col d-flex justify-content-center">
					<div>${member_name}님</div>
				</div>
			</div>
			<div class="row">
				<div class="col d-flex justify-content-center mb-3">
					<div>KickKick에 오신걸 환영합니다.</div>
				</div>
			</div>
			<div class="row">
				<div class="col d-flex justify-content-center">
					<button type="button" class="btn btn-success" onclick="location.href = '/member/login_view.jsp';">로그인하러가기</button>
				</div>
			</div>
		</div>
	</c:if>
</body>

</html>