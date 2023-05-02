<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>KickKick - 회원가입</title>
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
<!-- 폰트 -->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
html {
	background-color: #76b852;
}

body {
	background-color: #76b852;
	font-family: 'NanumSquareNeo';
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

#password-alert * {
	font-size: x-small;
}

.valid-feedback, .invalid-feedback {
	font-size: small;
}

.row .insert {
	justify-content: center;
}
</style>
</head>

<body>

	<div
		class="container join_form_container d-flex justify-content-center">
		<div class="wrapper join_form" id="join_form">
			<div class="header text-center">
				<h3>⚽KickKick</h3>
			</div>
			<div class="row ">
			<form action="/insert_new_member.member" method="post"></form>
				<div class="col">
					<div class="row label d-flex justify-content-center">
						
						<div class="col-6 col-sm-8">
							<span class="essential">*</span><label class="condition">은
								필수로 입력해주세요.</label>
						</div>
					</div>
					<!-- 아이디 -->
					<div class="row insert">
						<!--아이디 입력창 -->
						<div class="col-md-6 col-sm-8">
							<div class="row label">
								<div class="col-6 col-sm-8">
									<span class="essential">* </span><label for="member_id">아이디</label>
								</div>
							</div>
							<div class="row input">
								<div class="col md-9">
									<input type="text" class="form-control" id="member_id"
										name="member_id" pattern="^[a-z](?=.*[0-9])[0-9a-z]{4,19}$"
										maxlength="20" required>
								</div>
							</div>
							<!-- 아이디 중복확인 메세지 -->
							<div class="row checking">
								<div class="col md-3">
									<h9 id="id_checking"></h9>
								</div>
							</div>
						</div>
					</div>
					<!-- 비밀번호 -->
					<div class="row insert">
						<div class="row insert">
							<div class="col-md-6 col-sm-8">
								<div class="row label d-flex">
									<div class="col-md-6 col-sm-6">
										<span class="essential">* </span><label for="member_pw">비밀번호</label>
									</div>
									<!-- 비밀번호 보기&숨기기 버튼 -->
									<div class="col-md-6 col-sm-6">
										<button class="btn btn-sm p-0" id="view_pw" type="button">보기</button>
									</div>

								</div>
								<div class="row input">
									<input type="password" class="form-control rounded"
										aria-label="password" aria-describedby="password"
										id="password" class="password" />
									<div class="valid-feedback">Good</div>
									<div class="invalid-feedback">Wrong</div>
								</div>
							</div>
						</div>
						<div class="row d-flex justify-content-center">
							<div class="col-10 mt-xxl-0 w-auto h-auto">
								<div class="alert px-4 py-3 mb-0 d-none " role="alert"
									data-mdb-color="warning" id="password-alert">
									<ul class="list-unstyled mb-0">
										<li class="requirements leng"><i
											class="bi bi-check text-success me-2"></i> <i
											class="bi bi-x text-danger me-3"></i> 암호는 8자 이상이어야 합니다</li>
										<li class="requirements big-letter"><i
											class="bi bi-check text-success me-2"></i> <i
											class="bi bi-x text-danger me-3"></i> 암호에 하나 이상의 알파벳 대문자를
											포함해야 합니다.</li>
										<li class="requirements num"><i
											class="bi bi-check text-success me-2"></i> <i
											class="bi bi-x text-danger me-3"></i> 암호에 숫자가 하나 이상 포함되어야
											합니다.</li>
										<li class="requirements special-char"><i
											class="bi bi-check text-success me-2"></i> <i
											class="bi bi-x text-danger me-3"></i> 암호에 특수문자가 하나 이상 포함되어야
											합니다.</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="row insert">
							<div class="col-md-6 col-sm-6">
								<div class="row input d-flex">
									<input type="password" class="form-control rounded mt-1"
										aria-label="password" aria-describedby="password_check"
										id="password_check" class="password_check" />
									<div class="valid-feedback">Good</div>
									<div class="invalid-feedback">Wrong</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 이름 -->
					<div class="row insert">
						<!-- 이름 입력창 -->
						<div class="col-md-6 col-sm-6">
							<div class="row label">
								<div class="col">
									<span class="essential">* </span> <label for="member_name">이름</label>
								</div>
							</div>
							<div class="row input">
								<div class="col">
									<input type="text" class="form-control" id="member_name"
										name="member_name" pattern="^[가-힣]{2,5}$"
										title="2자 이상 5자 이내의 한글" minlength="2" maxlength="5" required>
								</div>
							</div>
						</div>
					</div>
					<!-- 전화번호 -->
					<div class="row insert">
						<!-- 전화번호 입력창 -->
						<div class="col-md-6 col-sm-6">
							<div class="row label">
								<div class="col">
									<span class="essential">* </span><label for="member__phone">전화번호</label>
								</div>
							</div>
							<div class="row input">
								<div class="col">
									<input type="text" id="phone" name="phone" class="form-control"
										placeholder="(-) 제외">
								</div>
								<div class="col-md-4 mt-1 d-flex justify-content-center">
									<button type="submit" class="btn btn-outline-success text-wrap"
										id="phone_auth">인증번호 받기</button>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col">
									<input type="text" id="phone_auth_code" class="form-control">
								</div>
								<div class="row">
									<div class="col-md-6  d-flex justify-content-center mt-1">
										<div class="timer mx-3">
											<div id="timeLimit">03:00</div>
										</div>
										<div class="col-md-6 d-flex">
											<button type="button" class="btn btn-outline-success"
												id="phone_auth_ok">인증</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 전화번호 중복 메세지 -->
					<div class="row checking">
						<div class="col">
							<h9 id="phone_checking"></h9>
						</div>
					</div>


					<!-- 생년월일 -->
					<div class="row insert">
						<!-- 생년월일 입력창 -->
						<div class="col-md-6 col-sm-6">
							<div class="row label">
								<div class="col">
									<span class="essential">* </span><label for="member_birth">생년월일</label>
								</div>
							</div>
							<div class="row input ">
								<div class="col-md-4 col-sm-3 d-flex align-items-center">
									<select class="form-select m-1" id="member_birth_year"
										name="member_birth_year"></select> 년
								</div>
								<div class="col-md-4 col-sm-3 d-flex align-items-center">
									<select class="form-select m-1" id="member_birth_month"
										name="member_birth_month"></select> 월
								</div>
								<div class="col-md-4 col-sm-3 d-flex align-items-center">
									<input type="text" class="form-control m-1"
										id="member_birth_day" name="member_birth_day"
										pattern="^(0[1-9]|[12][0-9]|3[01])$" title="두자리로 입력"
										minlength="2" maxlength="2" required> 일
								</div>
							</div>
						</div>
					</div>
					<!-- 이메일 -->
					<div class="row insert">
						<!-- 이메일 입력창 -->
						<div class="col-md-6 col-sm-6">
							<div class="row label">
								<div class="col">
									<label for="member_email"> E-mail</label>
								</div>
							</div>
							<div class="row input">
								<div class="col">
									<input type="email" class="form-control" id="member_email"
										name="member_email"
										pattern="^([a-z]{1}[a-z0-9_+.-]+@)([a-zA-Z0-9]+\.)([a-z0-9]{2,4})$"
										title="abc@abc.com 형식으로 입력">
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
					<div class="row insert mb-4">
						<!-- 닉네임 입력창 -->
						<div class="col-md-6 col-sm-6">
							<div class="row label">
								<div class="col">
									<label for="member_nickname"> 닉네임</label>
								</div>
							</div>
							<div class="row input">
								<div class="col">
									<input type="text" class="form-control" id="member_nickname"
										name="member_nickname" pattern="^[가-힣a-zA-Z0-9]{2,10}$"
										title="2자 이상 10자 이내로 한글, 영대소문자, 숫자 중 1개 이상 포함 " minlength="2"
										maxlength="10">
								</div>
							</div>
							<!-- 닉네임 중복 확인 메세지 -->
							<div class="row checking">
								<div class="col md-3">
									<h9 id="nickname_checking"> </h9>
								</div>
							</div>
						</div>
					</div>
					<!-- 가입동의  -->
					<div class="row insert ">
						<div class="col d-flex justify-content-center mb-4">
							<div class="row input member_agree ">
								<div class="col">
									<span> 가입에 동의하시겠습니까? </span> <input class="form-check-input"
										type="checkbox" id="member_agree" name="member_agree"
										value="Y" required>
								</div>
							</div>
						</div>
					</div>
					<!-- 가입버튼 & 돌아가기 버튼 -->
					<div class="row">
						<div class="col-6 d-flex justify-content-end">
							<button class="btn btn-secondary" id="join"
								style="background-color: #76b852;">가입하기</button>
						</div>
						<div class="col-6 d-flex justify-content-start">
							<a href="">
								<button class="btn btn-secondary" type="button" id="back"
									style="background-color: #76b852;">뒤로가기</button>
							</a>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<script>
        //입력 형식 안내 메세지
        const validityMessage = {
            badInput: "잘못된 입력입니다.",
            patternMismatch: "형식에 맞게 입력하세요",
            rangeOverflow: "글자수를 초과하였습니다",
            rangeUnderflow: "글자수에 미달하였습니다",
            stepMismatch: "[커스텀 메세지] 간격에 맞게 입력하세요",
            tooLong: "[커스텀 메세지] 최대 글자 미만으로 입력하세요",
            tooShort: "[커스텀 메세지] 최소 글자 미만으로 입력하세요",
            typeMismatch: "형식에 맞게 입력하세요!",
            valueMissing: "필수로 입력해주세요.",
        }
        function getMessage(validity) {
            for (const key in validityMessage) {
                if (validity[key]) {
                    return validityMessage[key]
                }
            }
        }
        function showError(input) {
            input.setCustomValidity(getMessage(input.validity) || "")
        }
        $("input").on("invalid", function () {
            showError(this);
        });


        //아이디 중복 체크
        let id_valid = false;
        let regex_id = /^[a-z](?=.*[0-9])[0-9a-z]{4,19}$/;

        $("#member_id").on(
            "keyup",
            function () {
                let id = $("#member_id").val();
                console.log(id);
                if (!regex_id.exec(id)) {
                    $("#id_checking").html("영소문자와 숫자 포함 5자 이상 20자 이하").css(
                        "color", "red").css("font-size", "x-small");
                    id_valid = false;
                } else {
                    $.ajax({
                        url: "/id_over_check.member",
                        type: "post",
                        data: {
                            member_id: $("#member_id").val()
                        },
                        error: function () {
                            alert("서버 요청 실패");
                        }

                    }).done(function (resp) {
                        resp = JSON.parse(resp);
                        console.log(resp);

                        if (resp) {
                            $("#id_checking").html("중복된 ID").css({
                                "color": "red"
                            }).css("font-size", "x-small");
                            id_valid = false;
                        } else {
                            $("#id_checking").html("사용가능한 ID").css({
                                "color": "dodgerblue"
                            }).css("font-size", "x-small");
                            id_valid = true;
                        }

                    })
                }
            })

        //비밀번호 보기 
        $("#view_pw").on("click", function () {
            let password_field = $("#member_pw");
            let password_field_type = password_field.attr("type");
            console.log("click");

            if (password_field_type == "password") {
                password_field.attr("type", "text");
                $("#view_pw").html("숨기기");
            } else {
                password_field.attr("type", "password");
                $("#view_pw").html("보기");
            }

        })

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
        //pw 빈칸 체크
        $("#btn_change_pw").on("click", function () {
            let password = $("#password").val();
            let password_check = $("#password_check").val();
            if (password == password_check && password != "") {
                alert("로그인페이지로 이동합니다");
                $.ajax({
                    url: "/change_pw.member",
                    type: "post",
                    data: {
                        password: $("#password").val()
                    }
                });
                location.reload();
            } else {
                password.val("");
                password_check.val("");
                alert("다시 입력해주세요");
            }
        });

		// 휴대폰 인증하기 버튼
		$("#btn-check-outlined").on("click", function () {
			$("#btn_close").removeClass("visually-hidden");
		});
		// 타이머 구현_daldal
		function $ComTimer() {
			//prototype extend
		}
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
		// 인증 시간
		$("#phone_auth").on("click", function (evt) {
			// 전화번호 check 및 인증번호 발송
			$.ajax({
				url: "/phone_auth.member",
				type: "post",
				dataType: "json",
				data: { phone: $("#phone").val() }
			}).done(function (str) {
				rand_code = str;
				
				// 전화번호 check
				if (rand_code == "") {
					$("#phone").val("");
					alert("전화번호를 확인해주세요.");
					return false;
				}
				
				// 인증번호 받기 버튼 비활성화
				$("#phone_auth").attr("disabled", true);
				
				AuthTimer = new $ComTimer();
				// 제한 시간
				AuthTimer.comSecond = 30; 
				// 제한 시간 만료 메세지
				AuthTimer.fnCallback = function () { alert("다시인증을 시도해주세요.") };
				AuthTimer.timer = setInterval(function () { AuthTimer.fnTimer() }, 1000);
				AuthTimer.domId = document.getElementById("timeLimit");
			});
		});
		// 인증 버튼
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
				});
			}
		});
        
        //이메일 중복 체크
        let email_valid = true;

        $("#member_email").on("keyup", function () {
            let email = $("#member_email").val();
            console.log(email);

            if (email == "") {
                email_valid = true;
                $("#email_checking").html("");
            } else {
                $.ajax({
                    url: "/email_over_check.member",
                    type: "post",
                    data: {
                        member_email: $("#member_email").val()
                    },
                    error: function () {
                        alert("서버 요청 실패");
                    }
                }).done(function (resp) {
                    resp = JSON.parse(resp);
                    console.log(resp);
                    if (resp) { //true면 중복인거
                        $("#email_checking").html("이미 사용중인 이메일 주소입니다.").css({
                            "color": "red"
                        }).css("font-size", "x-small");
                        email_valid = false;
                    } else {
                        $("#email_checking").html("");
                        email_valid = true;
                    }
                })

            }
        })

        //닉네임 중복 체크
        let nickname_valid = true;

        $("#member_nickname").on("keyup", function () {
            let nickname = $("#member_nickname").val();
            console.log(nickname);

            if (nickname == "") {
                nickname_valid = true;
                $("#nickname_checking").html("");
            } else {
                $.ajax({
                    url: "/nickname_over_check.member",
                    type: "post",
                    data: {
                        member_nickname: $("#member_nickname").val()
                    },
                    error: function () {
                        alert("서버 요청 실패");
                    }
                }).done(function (resp) {
                    resp = JSON.parse(resp);
                    console.log(resp);
                    if (resp) { //true면 중복인거
                        $("#nickname_checking").html("이미 사용중인 닉네임입니다.").css({
                            "color": "red"
                        }).css("font-size", "x-small");
                        nickname_valid = false;
                    } else {
                        $("#nickname_checking").html("");
                        nickname_valid = true;
                    }
                })

            }
        })


        //submit전 아이디,전화번호,이메일 중복 검사
        $("#join").on("click", function () {

            if (!id_valid) {
                alert("아이디 중복 여부를 확인하세요.");
                return false;
            }


            if (!phone_valid) {
                alert("전화번호 중복 여부를 확인하세요.");
                return false;
            }

            if (!email_valid) {
                alert("이메일 중복 여부를 확인하세요.");
                return false;
            }

            if (!nickname_valid) {
                alert("닉네임 중복 여부를 확인하세요.");
                return false;
            }
        })

        //생년월 select option 
        $(document)
            .ready(
                function () {
                    var now = new Date();
                    var year = now.getFullYear();
                    var mon = (now.getMonth() + 1) > 9 ? ''
                        + (now.getMonth() + 1) : '0'
                    + (now.getMonth() + 1);

                    //년도 selectbox만들기               
                    for (var i = 1900; i <= year; i++) {
                        $('#member_birth_year').append(
                            '<option value="' + i + '">' + i
                            + '</option>');
                    }
                    // 월별 selectbox 만들기            
                    for (var i = 1; i <= 12; i++) {
                        var mm = i > 9 ? i : "0" + i;
                        $('#member_birth_month').append(
                            '<option value="' + mm + '">' + mm
                            + '</option>');
                    }

                    $(
                        "#member_birth_year  > option[value="
                        + year + "]").attr("selected",
                            "true");
                    $(
                        "#member_birth_month  > option[value="
                        + mon + "]").attr("selected",
                            "true");
                })
    </script>

</body>

</html>