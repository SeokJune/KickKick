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
<!-- 폰트 -->	
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
html {
	background-color: #76b852;
}

body {
	background-color: #76b852;
	font-family: 'NanumSquareNeo';
}

.container {
	border: 1px solid black;
	width: 700px;
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
.label{
font-family: 'NanumSquareNeoExtraBold';
}

#profile_view{
display:none;
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
#password-alert *{
font-size: x-small;
}
.valid-feedback,.invalid-feedback{
font-size: small;
}
.btn {
	border: none;
}
	
</style>
</head>
<body>
	<div class="container my_page_container">
		
		<div class="wrapper verify_pw" id="verify_pw_view">
			<div class="row">
				<span>비밀번호를 입력해주세요.</span>
				<input type="password" id="verify_pw" name="verify_pw" required>
				<button id="btn_verify_pw">확인</button> 
			</div>
		</div>
		
		
			<div class="wrapper profile_view" id="profile_view">
				<form action="/modify_member_profile.member" method="post" onsubmit="return confirm('프로필을 수정하시겠습니까?');">

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
									<label>비밀번호</label>
							</div>
					<!-- '비밀번호 변경'버튼 -->		
							<div class="row">
									<button class="btn btn-primary" type="button" id="edit_pw_btn">비밀번호
										변경</button>
							</div>
						</div>
					</div>
					<!-- 비밀번호 입력창 :  '비밀번호 변경'버튼 클릭시 보여짐-->
					 <div class="row" id="edit_pw_fadeIn">
		                <div class="col">
		               		<div class="row input"> 
		               			<div class="col">
			                        <input type="password" class="form-control rounded mt-1"
			                        	id="member_confirm_pw" name="member_confirm_pw" 
			                            placeholder=" 기존 비밀번호"  value="${profile.pw}"
			                            aria-describedby="password" class="password" />
			                    </div>
			                    <div class="col">       
			                        <button class="btn btn-light btn-sm" id="confirm_pw" type="button">확인</button>  
			                    </div>        
		           			</div>
							<div class="row input" >
								<div class="col">
									<input type="password" class="form-control rounded mt-1"
										id="member_new_pw" name="member_new_pw" 
										placeholder=" 새 비밀번호"
										pattern="^(?=.*[A-Z])(?=.*[~.!@#$%^&*()_+={}>;<:,.?/\-\[\]\\\|])(?=.*[0-9]).{8,20}$"
										aria-describedby="password" class="password" 
										maxlength="20">
									<div class="valid-feedback">Good</div>
									<div class="invalid-feedback">Wrong</div>
								</div>
							<!-- 비밀번호 보기&숨기기 버튼 -->
		                    	<div class="col">
									<button class="btn btn-light btn-sm" id="view_pw" type="button">보기</button>
								</div>
								<div class="col">		
									<div class="alert px-3 py-3 mb-0 d-none" role="alert"
									data-mdb-color="warning" id="password-alert">
										<ul class="list-unstyled mb-0">
											<li class="requirements leng"><i
												class="bi bi-check text-success me-2"></i> <i
												class="bi bi-x text-danger me-3"></i> 8자 이상</li>
											<li class="requirements big-letter"><i
												class="bi bi-check text-success me-2"></i> <i
												class="bi bi-x text-danger me-3"></i> 하나 이상의 알파벳 대문자를 포함</li>
											<li class="requirements num"><i
												class="bi bi-check text-success me-2"></i> <i
												class="bi bi-x text-danger me-3"></i> 숫자 하나 이상 포함</li>
											<li class="requirements special-char"><i
												class="bi bi-check text-success me-2"></i> <i
												class="bi bi-x text-danger me-3"></i> 특수문자가 하나 이상 포함</li>
										</ul>
									</div>	
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
						<!-- 전화번호1,2,3 입출력창 -->
						<div class="col">
							<div class="row label">
								<label for="member__phone">전화번호</label>
							</div>
							<div class="row input">
								<div class="col">
									<input type="text" class="form-control" id="member_phone"
										name="member_phone" pattern="^0+\d{9,10}$"
										value="${profile.phone}"
										minlength="10" maxlength="11" style="width: 200px;" required readonly>
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
										name="member_pin">
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
						<!-- 생년월일 입출력창 -->
						<div class="col">
							<div class="row label">
								<label for="member_birth">생년월일</label>
							</div>
							<div class="row input">
								<div class="col">
									<p><input type="text" class="form-control" id="member_birth_year"
										name="member_birth_year" pattern="^(19[0-9][0-9]|20[0-2][0-3])$" 
										value="${profile.birth_date.substring(0,4)}"
										minlength="4" maxlength="4" required readonly 
										style="width: 100px;">년</p>
								
								</div>
								<div class="col">
									<input type="text" class="form-control" id="member_birth_month"
										name="member_birth_month" pattern="^(0[1-9]|1[0-2])$"
										value="${profile.birth_date.substring(4,6)}"
										minlength="2" maxlength="2" required readonly
										style="width: 100px;"> 
								</div>
								<div class="col">월</div>
								<div class="col">
									<input type="text" class="form-control" id="member_birth_day"
										name="member_birth_day" pattern="^(0[1-9]|[12][0-9]|3[01])$"
										value="${profile.birth_date.substring(6,8)}"
										minlength="2" maxlength="2" required readonly
										style="width: 100px;"> 
								</div>
								<div class="col">일</div>
							</div>
						</div>
					</div>
	
					<!-- 이메일 -->
					<div class="row insert" style="height: 85px;">
						<!-- 이메일 입출력창 -->
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
										readonly>
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
						<!-- 닉네임 입출력창 -->
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
										minlength="2" maxlength="10" readonly
										style="width: 255px;">
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
	
				<!-- '수정하기' 버튼 클릭시 '수정완료'버튼과 '취소'버튼 보여지고 '수정하기'버튼 숨겨짐 -->	
					<div class="row">
					<!-- 수정 버튼 -->
						<button class="btn btn-secondary" id="edit" type="button"
							style="background-color: #76b852;">수정하기</button>
					<!-- 수정완료,취소 버튼 -->		
						<button class="btn btn-secondary" id="edit_complete" 
							style="background-color: #76b852;">수정완료</button>
						<input type="reset" class="btn btn-secondary" id="edit_cancel" 
							value="취소"
							style="background-color: #76b852;">
					</div>
					
				</form>
			</div>
	</div>


	<script>
			$("#btn_verify_pw").on("click",function(){
				$.ajax({
					url: "/verify_pw.member",
					type: "post",
					data:{
						id: "${param.member_id}",
						verify_pw: $("#verify_pw").val()
					},
					dataType:"json" ,
					error:function() {
						alert("서버 요청 실패");
					}
				}).done(function(resp){
						if(resp){
							$("#verify_pw_view").hide();
							$("#profile_view").fadeIn();
						}else{
							alert("비밀번호가 일치하지 않습니다.");
						}
				})
			})
	</script>


	<script>
		$("#edit_pw").hide();
		$("#edit_phone_btn").hide();
		$("#edit_complete").hide();
		$("#edit_cancel").hide();
		$("#edit_pw_fadeIn").hide();

		//수정하기 버튼 :클릭시 비밀번호,전화번호 수정 버튼 & 수정 취소 버튼 보여짐
		$("#edit").on("click",function() {
			$("#edit").hide();
			$("#edit_pw").fadeIn();
			$("#edit_phone_btn").fadeIn();
			$("#edit_complete").fadeIn();
			$("#edit_cancel").fadeIn();
			$("#member_birth_year,#member_birth_month,#member_birth_day,#member_email,#member_nickname").removeAttr("readonly");
		})
		

		//비밀번호 변경 버튼
		$("#edit_pw_btn").on("click", function() {
			if ($("#edit_pw_fadeIn").css("display") == "none") {
				$("#edit_pw_fadeIn").fadeIn();
				$("#edit_pw_btn").text("비밀번호 변경 취소");
				$("#member_confirm_pw").val("").removeAttr("disabled").removeAttr("readonly").attr("required","true");
				$("#confirm_pw").removeAttr("disabled").html("확인");
				$("#member_new_pw").val("").attr("disabled","true");
			} else {
				$("#edit_pw_fadeIn").hide();
				$("#edit_pw_btn").text("비밀번호 변경");
				$("#member_confirm_pw").val("${profile.pw}");
				$("#member_new_pw").val("").removeAttr("required").removeAttr("disabled");
			}
		})

		//비밀번호 보기&숨기기 버튼
		$("#view_pw").on("click", function() {
			let password_field = $("#member_confirm_pw");
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

	//비밀번호 변경 : 기존 비밀번호 비동기 검사
	let confirm_pw = true;
		$("#confirm_pw").on("click",function(){
				$.ajax({
					url: "/verify_pw.member",
					type: "post",
					data:{
						id: "${param.member_id}",
						verify_pw: $("#member_confirm_pw").val()
					},
					dataType:"json" ,
					error:function() {
						alert("서버 요청 실패");
					}
				}).done(function(resp){
						if(resp){
							$("#member_confirm_pw").attr("readonly","true");
							$("#member_new_pw").removeAttr("disabled").attr("required","true");
							$("#confirm_pw").html("확인 완료").attr("disabled","true")
							 confirm_pw = true;
							 
						}else{
							alert("기존 비밀번호 입력이 잘못되었습니다.");
							confirm_pw = false;
						}
				})
			})
		
		//pw 유효성 검사
				let lengBoolean, bigLetterBoolean, numBoolean, specialCharBoolean;
				addEventListener("DOMContentLoaded", (event) => {
					const password = document.getElementById("member_new_pw");
					const passwordAlert = document.getElementById("password-alert");
					const requirements = document.querySelectorAll(".requirements");
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
				
				
				
				
				
				
		//전화번호 중복 체크
		let phone_valid = true;
		let regex_phone = /^[0-9]{10,11}$/;
		$("#member_phone").on("keyup",function() {
			let phone = $("#member_phone").val();
			console.log(phone);
				
			if(phone=="${profile.phone}"){
				phone_valid = true;
				$("#phone_checking").html("");
			}else{$.ajax({
						url : "/phone_over_check.member",
						type : "post",
						data : {member_phone : $("#member_phone").val()},
						error : function() {alert("서버 요청 실패");}
								}).done(function(resp) {
									resp = JSON.parse(resp);
									console.log(resp);
									if (resp) { //true면 중복인거
										$("#phone_checking").html("이미 사용중인 전화번호 입니다.").css({"color" : "red"}).css("font-size", "x-small");
										phone_valid = false;
									} else {
										$("#phone_checking").html("");
										phone_valid = true;
									}
								})
					}		
			})

			
		//전화번호 변경 버튼 				
		$("#veri_code").hide();
		$("#edit_phone_btn").on("click",function() {
					if ($("#veri_code").css("display") == "none") {
						$("#veri_code").fadeIn();
						$("#member_phone")
								.removeAttr("readonly");
						$("#edit_phone_btn").html("변경 취소");
					} else {
						$("#veri_code").hide();
						$("#member_phone").attr("readonly", "true").val("${profile.phone}");
						$("#edit_phone_btn").html("변경");
						$("#phone_checking").html("");
						 phone_valid = true;
					}
				})

		//이메일 중복 체크
		let email_valid = true;

		$("#member_email").on("keyup", function() {
			let email = $("#member_email").val();
			console.log(email);
			
			if(email=="" || email=="${profile.email}"){
				$("#email_checking").html("");
				email_valid = true;
			}else{
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
			}
		})
		
		//닉네임 중복 체크
		let nickname_valid = true;
		$("#member_nickname").on("keyup", function() {
			let nickname = $("#member_nickname").val();
			console.log(nickname);
			
			if(nickname=="" || nickname=="${profile.nick_name}"){
				$("#nickname_checking").html("");
				nickname_valid = true;
			}else{
				$.ajax({
					url : "/nickname_over_check.member",
					type : "post",
					data : {
						member_nickname : $("#member_nickname").val()
					},
					error : function() {
						alert("서버 요청 실패");
					}
				}).done(function(resp) {
					resp = JSON.parse(resp);
					console.log(resp);
					if (resp) { //true면 중복인거
						$("#nickname_checking").html("이미 사용중인 닉네임입니다.").css({
							"color" : "red"
						}).css("font-size", "x-small");
						nickname_valid = false;
					} else {
						$("#nickname_checking").html("");
						nickname_valid = true;
					}
				})
				
			}
		})
		
		
				


		//submit전 전화번호,이메일 중복 검사
		$("#edit_complete").on("click", function() {

			if (!phone_valid) {
				alert("전화번호 중복 여부를 확인하세요.");
				return false;
			}
			
			if(!confirm_pw){
				alert("기존 비밀번호가 일치하지 않아 비밀번호 변경이 불가능합니다.다시 확인해주세요.");
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

		
	</script>

</body>
</html>