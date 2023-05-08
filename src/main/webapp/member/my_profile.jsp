<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
<!-- awesome font -icon -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- sweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- Global Navi Bar -->
<link href="/commons/css/gnb.css" rel="stylesheet" type="text/css">

<!-- 공통 CSS -->
<style type="text/css">
* {
	font-family: 'NanumSquareNeoBold';
}

html, body {
	background-color: #76b852;
}
</style>

<!-- contents CSS -->
<style type="text/css">
label {
	font-size: small;
}

.my_page_container {
	min-width: 478px;
	height: max-content;
	padding: 8%;
	margin-bottom: 5%;
	position: relative;
	background-color: whitesmoke;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
}

.info, .label, .nav-link {
	font-family: 'NanumSquareNeoExtraBold';
	font-size: large;
}

.btn-primary {
	border: none;
}

.btn-outline-secondary {
	background-color: white;
}

#verify_pw {
	background-color: white;
	border: none;
}

#btn_verify_pw {
	height: 80px;
	width: 80px;
	background-color: white;
	border: 2px solid gainsboro;
	border-radius: 3rem;
	box-shadow: 0 3px 5px 0 rgba(0, 0, 0, 0.2), 0 9px 30px 0 rgba(0, 0, 0, 0.19);
	transition-duration: 0.3s;
	border: none;
}

#btn_verify_pw:hover {
	background-color: gainsboro;
	color: white;
}

#profile_view, .bi-check, .bi-x {
	display: none;
}

.valid-feedback, .invalid-feedback {
	margin-left: 0.5rem;
	font-size: small;
}

.label {
	padding: 1%;
}

#password-alert * {
	font-size: x-small;
}
</style>
</head>

<body>
	<!-- Golbal Navi Bar -->
	<c:import url="/commons/gnb.jsp">
	</c:import>
	<!--  -->
	<div class="container" id="contents">
		<!-- Local Navi Bar -->
		<div class="row" id="lnb">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<button class="nav-link text-dark" aria-current="page" id="my_team" onclick="location.href='/'">내 팀</button>
				</li>
				<li class="nav-item">
					<button class="nav-link text-dark" aria-current="page" id="my_comp" onclick="location.href='/my_team_list.team'">내 경기</button>
				</li>
				<li class="nav-item">
					<button class="nav-link text-dark active" aria-current="page" id="my_info" onclick="location.href='/my_profile.membe'">내 정보</button>
				</li>
			</ul>
		</div>
		<!-- contents -->
		<div class="row my_page_container justify-content-center">
			<div class="col-10">
				<!-- 비밀 번호 확인 -->
				<div class="row justify-content-center" id="verify_pw_view">
					<div class="col-8 col-md-6">
						<div class="row">
							<div class="col-3">
								<p class="info text-end">ID :</p>
							</div>
							<div class="col-9">${profile.id}</div>
						</div>
						<div class="row">
							<div class="col-3 mt-2">
								<p class="info text-end">PW :</p>
							</div>
							<div class="col-9">
								<input type="password" id="verify_pw" name="verify_pw" class="form-control" required>
							</div>
						</div>
					</div>
					<div class="col-4 col-md-2">
						<button class="btn ms-3" id="btn_verify_pw">확인</button>
					</div>
				</div>
				<!-- 내 정보 조회 -->
				<div class="row justify-content-center" id="profile_view">
					<div class="col-10 col-md-8">
						<form action="/modify_member_profile.member" method="post" onsubmit="return confirm('프로필을 수정하시겠습니까?');">
							<!-- 아이디 -->
							<div class="wrapper">
								<div class="row label">
									<div class="col-12">
										<label for="member_id">아이디</label>
									</div>
								</div>
								<div class="row input">
									<div class="col-12 col-md-8 w-100">
										<input type="text" class="form-control" id="member_id" value="${profile.id}" name="member_id" readonly>
									</div>
								</div>
							</div>
							<!-- 비밀 번호 : 수정하기 버튼 클릭 시 보임 -->
							<div class="wrapper" id="edit_pw">
								<div class="row label">
									<div class="col-12">
										<label>비밀번호</label>
									</div>
								</div>
								<div class="row input">
									<div class="col-12 col-md-8 w-100">
										<button class="btn btn-outline-secondary comp w-100" type="button" id="edit_pw_btn">비밀번호 변경</button>
									</div>
								</div>
							</div>
							<!-- 비밀 번호 입력창 : '비밀번호 변경'버튼 클릭시 보여짐 -->
							<div class="wrapper" id="edit_pw_fadeIn">
								<div class="row input">
									<div class="col-9 col-md-6 w-75">
										<input type="password" class="form-control rounded mt-1" id="member_confirm_pw" name="member_confirm_pw" placeholder="기존 비밀번호" aria-describedby="password" class="password" />
									</div>
									<div class="col-3 col-md-2 w-25">
										<button class="btn btn-outline-secondary btn-sm w-100 mt-2" id="confirm_pw" type="button">확인</button>
									</div>
								</div>
								<div class="row input">
									<div class="col-9 col-md-6 w-75">
										<input type="password" class="password form-control rounded mt-1" id="member_new_pw" name="member_new_pw" placeholder=" 새 비밀번호" aria-label="password" pattern="^(?=.*[A-Z])(?=.*[~.!@#$%^&*()_+={}>;<:,.?/\-\[\]\\\|])(?=.*[0-9]).{8,20}$" aria-describedby="password" class="password" maxlength="20">
										<div class="valid-feedback">Good</div>
										<div class="invalid-feedback">Wrong</div>
										<div class="alert px-1 py-1 mb-0 d-none" role="alert" data-mdb-color="warning" id="password-alert">
											<ul class="list-unstyled mb-0">
												<li class="requirements leng">
													<i class="bi bi-check text-success me-2"></i>
													<i class="bi bi-x text-danger me-3"></i>
													8자 이상
												</li>
												<li class="requirements big-letter">
													<i class="bi bi-check text-success me-2"></i>
													<i class="bi bi-x text-danger me-3"></i>
													하나 이상의 알파벳 대문자를 포함
												</li>
												<li class="requirements num">
													<i class="bi bi-check text-success me-2"></i>
													<i class="bi bi-x text-danger me-3"></i>
													숫자 하나 이상 포함
												</li>
												<li class="requirements special-char">
													<i class="bi bi-check text-success me-2"></i>
													<i class="bi bi-x text-danger me-3"></i>
													특수문자가 하나 이상 포함
												</li>
											</ul>
										</div>
									</div>
									<!-- 비밀번호 보기&숨기기 버튼 -->
									<div class="col-3 col-md-2 w-25">
										<button class="btn btn-outline-secondary btn-sm w-100 mt-2" id="view_pw" type="button">보기</button>
									</div>
								</div>
							</div>
							<!-- 이름 -->
							<div class="wrapper">
								<div class="row label">
									<div class="col-12">
										<label>이름</label>
									</div>
								</div>
								<div class="row input">
									<div class="col-12 col-md-8 w-100">
										<input type="text" class="form-control" id="member_name" value="${profile.name}" name="member_name" readonly>
									</div>
								</div>
							</div>
							<!-- 전화 번호 -->
							<div class="wrapper">
								<div class="row label">
									<div class="col-12">
										<label">전화번호</label>
									</div>
								</div>
								<div class="row input">
									<!-- col-9 col-md-6 w-75 -->
									<div class="col-12">
										<input type="text" class="form-control" id="member_phone" name="member_phone" pattern="^0+\d{9,10}$" value="${profile.phone}" minlength="10" maxlength="11" required readonly>
									</div>
									<!-- 전화번호 변경 버튼 : 수정하기 버튼 클릭시 보여짐 -->
									<div class="col-3 col-md-2 w-25 mt-1">
										<button type="button" class="btn btn-outline-secondary btn-sm" id="edit_phone_btn" style="-bs-btn-font-size: .75rem;">변경</button>
									</div>
								</div>
								<!-- 전화번호 중복 메세지 -->
								<div class="row checking px-1 py-1">
									<div class="col-12">
										<h9 id="member_phone_checking"></h9>
									</div>
								</div>
							</div>
							<!-- 인증 번호 -->
							<div class="wrapper" id="veri_code">
								<div class="row label">
									<label>인증번호</label>
								</div>
								<div class="row input">
									<div class="col-9 col-md-6 w-75">
										<input type="text" class="form-control" id="member_pin" name="member_pin">
									</div>
									<!-- 인증완료 버튼 -->
									<div class="col-3 col-md-2 w-25 mt-1">
										<button type="button" class="btn btn-primary btn-sm w-100">인증번호 전송</button>
									</div>
								</div>
							</div>
							<!-- 생년월일 -->
							<div class="wrapper">
								<div class="row label">
									<div class="col-12">
										<label>생년월일</label>
									</div>
								</div>
								<div class="row input text-start">
									<div class="col-3">
										<input type="text" class="form-control fs-6" id="member_birth_year" name="member_birth_year" value="${profile.birth_date.substring(0,4)}" readonly>
									</div>
									<p class="col-1 mt-2">년</p>
									<div class="col-3">
										<input type="text" class="form-control fs-6" id="member_birth_month" name="member_birth_month" value="${profile.birth_date.substring(4,6)}" readonly>
									</div>
									<div class="col-1 mt-2">월</div>
									<div class="col-3">
										<input type="text" class="form-control fs-6" id="member_birth_day" name="member_birth_day" value="${profile.birth_date.substring(6,8)}" readonly>
									</div>
									<div class="col-1 mt-2">일</div>
								</div>
							</div>
							<!-- 이메일 -->
							<div class="wrapper">
								<div class="row label">
									<div class="col-12">
										<label> E-mail</label>
									</div>
								</div>
								<div class="row input">
									<div class="col-12 col-md-8 w-100">
										<input type="email" class="form-control" id="member_email" value="${profile.email}" name="member_email" pattern="^([a-z]{1}[a-z0-9_+.-]+@)([a-zA-Z0-9]+\.)([a-z0-9]{2,4})$" readonly>
									</div>
								</div>
								<!-- 이메일 중복 확인 메세지 -->
								<div class="row checking px-1 py-1">
									<div class="col-12">
										<h9 id="email_checking"></h9>
									</div>
								</div>
							</div>
							<!-- 닉네임 -->
							<div class="wrapper">
								<div class="row label">
									<div class="col-12">
										<label for="member_nickname">닉네임</label>
									</div>
								</div>
								<div class="row input">
									<div class="col-12 col-md-8 w-100">
										<input type="text" class="form-control" id="member_nickname" value="${profile.nick_name}" name="member_nickname" pattern="^[가-힣a-zA-Z0-9]{2,10}$" minlength="2" maxlength="10" readonly>
									</div>
								</div>
								<!-- 닉네임 중복 확인 메세지 -->
								<div class="row checking px-1 py-1">
									<div class="col-12">
										<h9 id="nickname_checking"> </h9>
									</div>
								</div>
							</div>
							<!-- '수정하기' 버튼 클릭시 '수정완료'버튼과 '취소'버튼 보여지고 '수정하기'버튼 숨겨짐 -->
							<div class="row p-3" id="edit">
								<div class="col-12 col-md-8 w-100">
									<!-- 수정 버튼 -->
									<div class="row">
										<button class="btn btn-primary comp" id="btn_edit" type="button">수정하기</button>
									</div>
									<div class="row mt-2">
										<button class="btn btn-secondary comp" id="btn_delete" type="button">탈퇴신청</button>
									</div>
								</div>
							</div>
							<div class="row p-3" id="edit_complete">
								<div class="col-12 col-md-8 w-100">
									<div class="row">
										<!-- 수정완료 버튼 -->
										<button class="btn btn-primary" id="btn_edit_complete">수정완료</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- 탈퇴신청 버튼 클릭시 보여짐 -->
				<div class="wrapper delete_member" id="delete_member_view">
					<form action="/delete_member.member" method="post" onsubmit="return confirm('정말 탈퇴 하시겠습니까?');">
						<div class="row">
							<div class="col-12 d-flex justify-content-center">
								<p style="font-size: 50px;">
									<i class="fa-solid fa-user-xmark fa-flip-horizontal fa-2xl"></i>
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col text-center mt-2">
								<p class="h3">정말 탈퇴하시겠습니까?</p>
								<p class="h6 text-danger">
									<strong>탈퇴시 계정복구가 어렵습니다.</strong>
								</p>
							</div>
						</div>
						<div class="row m-3">
							<div class="col-6 d-flex justify-content-end">
								<button class="btn btn-secondary">탈퇴하기</button>
							</div>
							<div class="col-6 d-flex justify-content-start">
								<button type="button" class="btn btn-primary" onClick="window.location.href='/my_profile.member'">돌아가기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Script : GNB Margin -->
	<script type="text/javascript">
		$(window).on("load resize", function() {
			$("#contents").css("margin-top", $(".navbar").height());
		});
	</script>
	<!-- Script : contents -->
	<script type="text/javascript">
		// 비밀번호 확인
		$("#btn_verify_pw").on("click", function() {
			if ($("#verify_pw").val() == "") {
				alert("비밀번호를 입력해주세요.");
				return false;
			} else {
				$.ajax({
					url : "/verify_pw.member",
					type : "post",
					data : {
						id : "${param.member_id}",
						verify_pw : $("#verify_pw").val()
					},
					dataType : "json",
					error : function() {
						alert("서버 요청 실패");
					}
				}).done(function(resp) {
					if (resp) {
						$(".container").css({
							"height" : "max-content"
						});
						$("#verify_pw_view").hide();
						$("#profile_view").css("display", "flex");
					} else {
						alert("비밀번호가 일치하지 않습니다.");
					}
				});
			}
		});

		// 숨기기
		$("#edit_pw,#edit_phone_btn,#edit_complete,#edit_cancel,#edit_pw_fadeIn,#delete_member_view, #veri_code").hide();
		
		//수정하기 버튼 :클릭시 비밀번호,전화번호 수정 버튼 & 수정 취소 버튼 보여짐
		$("#btn_edit").on("click",function() {
			$("#edit").hide();
			$("#edit_pw").fadeIn();
			$("#edit_phone_btn").fadeIn();
			$("#edit_complete").fadeIn();
			$("#member_birth_year,#member_birth_month,#member_birth_day,#member_email,#member_nickname").removeAttr("readonly");
		});
		
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
		});
		
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

		});
		
		//비밀번호 변경 : 기존 비밀번호 비동기 검사
		let confirm_pw = true;
		$("#confirm_pw").on("click",function(){
			$.ajax({
				url: "/verify_pw.member",
				type: "post",
				data:{
					id: "${id}",
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
			});
		});
		
		// PW 유효성 검사
		addEventListener("DOMContentLoaded", (event) => {
			const password = document.getElementById("member_new_pw");
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
				if (password.value == "") {
					password.classList.remove("is-invalid");
				}
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
				if (value == document.getElementById("member_new_pw").value) {
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
			
			password.addEventListener("blur", () => {
				if (password.value == "") {
					password.classList.remove("is-invalid");
				}
			});
        });
		
		//전화번호 중복 체크
		let phone_valid = true;
		let regex_phone = /^[0-9]{10,11}$/;
		$("#member_phone").on("keyup",function() {
			let phone = $("#member_phone").val();
				
			if(phone=="${profile.phone}"){
				phone_valid = true;
				$("#phone_checking").html("");
			} else {
				$.ajax({
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
				});
			}		
		});

			
		//전화번호 변경 버튼
		$("#edit_phone_btn").on("click",function() {
			if ($("#veri_code").css("display") == "none") {
				$("#veri_code").fadeIn();
				$("#member_phone").removeAttr("readonly");
				$("#edit_phone_btn").html("취소");
			} else {
				$("#veri_code").hide();
				$("#member_phone").attr("readonly", "true").val("${profile.phone}");
				$("#edit_phone_btn").html("변경");
				$("#phone_checking").html("");
				 phone_valid = true;
			}
		});

		//이메일 중복 체크
		let email_valid = true;
		$("#member_email").on("keyup", function() {
			let email = $("#member_email").val();
			console.log(email);
			
			if(email=="" || email=="${profile.email}"){
				$("#email_checking").html("");
				email_valid = true;
			} else {
				$.ajax({
					url : "/email_over_check.member",
					type : "post",
					data : { member_email : $("#member_email").val() },
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
				});
			}
		});
		
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
						$("#nickname_checking").html("이미 사용중인 닉네임입니다.").css({"color" : "red", "font-size": "x-small"});
						nickname_valid = false;
					} else {
						$("#nickname_checking").html("");
						nickname_valid = true;
					}
				});
				
			}
		});
		
		//submit전 전화번호,이메일 중복 검사
		$("#btn_edit_complete").on("click", function() {
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
		});
		
		$("#btn_delete").on("click",function(){
			$("#profile_view").hide();
			$("#delete_member_view").fadeIn();
		});
	</script>
</body>

</html>