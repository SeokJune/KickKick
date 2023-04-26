<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	height: 680px;
	padding: 32px;
	margin-top: 5%;
	margin-bottom: 5%;
	position: relative;
	background-color: whitesmoke;
	border-radius: 1rem;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
}

.wrapper{
position: relative;
left:10px;
}

.row input {
	height: 40px;
}

label {
	font-size: small
}

.essential {
	font-size: small;
	color: red;
}

.member_agree{
	margin-left:25%;
	margin-top:3%;
}
#member_agree{
	position:relative;
	bottom: 15%;
}

.btn {
	border: none;
}

#join{
	position:relative;
	left:160px;
	top:15px;
}
#back{
	position:relative;
	top:15px;
}
</style>
</head>
<body>

	<div class="container join_form_container">

		<div class="wrapper join_form" id="join_form">
			<form action="/insert_new_member.member" method="post">


<!--아이디 입력창 -->
				<div class="row">
					<div class="col md-9">
						<span class="essential">* </span><label for="member_id">아이디</label>
					</div>
				</div>
				<div class="row input">
					<div class="col md-9">
						<input type="text" class="form-control" id="member_id"
							name="member_id" pattern="^[a-z](?=.*[0-9])[0-9a-z]{4,19}$"
							title="5자 이상 20자 이내로 영소문자,숫자 필수 포함" minlength="5" maxlength="20"
							required>
					</div>
<!-- 아이디 중복확인 메세지 -->
					<div class="col md-3">
						<h9 id="id_checking"></h9>
					</div>
				</div>



<!-- 비밀번호 입력창 -->
				<div class="row">
					<div class="col md-9">
						<span class="essential">* </span><label for="member_pw">비밀번호</label>
					</div>
				</div>
				<div class="row input">
					<div class="col md-9">
						<input type="password" class="form-control" id="member_pw"
							name="member_pw"
							pattern="^(?=.*[a-zA-Z])(?=.*[~.!@#$%^&*()_+={}>;<:,.?/\-\[\]\\\|])(?=.*[0-9]).{8,20}$"
							title="영대소문자,숫자,특수문자를 모두 포함한 8~20자" minlength="8" maxlength="20"
							required>
					</div>
<!-- 비밀번호 보기&숨기기 버튼 -->
					<div class="col md-3">
						<button class="btn btn-light btn-sm" id="view_pw" type="button">보기</button>
					</div>
				</div>



<!-- 이름 입력창 -->
				<div class="row">
					<div class="col">
						<span class="essential">* </span> <label for="member_name">이름</label>
					</div>
				</div>
				<div class="row input">
					<div class="col md-9">
						<input type="text" class="form-control" id="member_name"
							name="member_name" pattern="^[가-힣]{2,5}$" title="2자 이상 5자 이내의 한글"
							minlength="2" maxlength="5" required>
					</div>
				</div>


<!-- 전화번호1,2,3 입력창 -->
				<div class="row">
					<div class="col md-9">
						<span class="essential">* </span><label for="member__phone">전화번호</label>
					</div>
				</div>
				<div class="row input">
					<div class="col">
						<input type="text" class="form-control" id="member_phone1"
							name="member_phone1" pattern="^0+\d{1,2}$" minlength="2"
							maxlength="3" required style="width: 100px;">
					</div>
					<div class="col">
						<input type="text" class="form-control" id="member_phone2"
							name="member_phone2" pattern="^\d{3,4}$" minlength="3"
							maxlength="4" required style="width: 100px;">
					</div>
					<div class="col">
						<input type="text" class="form-control" id="member_phone3"
							name="member_phone3" pattern="^\d{4}$" minlength="4"
							maxlength="4" required style="width: 100px;">
					</div>
<!-- 인증번호 전송 버튼 -->
					<div class="col">
						<button type="button" class="btn btn-primary btn-sm">인증번호 발송</button>
					</div>
					<div class="col md-3">
						<h9 id="phone_checking"></h9>
					</div>
				</div>



<!-- 인증번호 입력창 -->
				<div class="row">
					<div class="col">
						<span class="essential">* </span><label for="member_pin">인증번호</label>
					</div>
				</div>
				<div class="row input">
					<div class="col md-9">
						<input type="text" class="form-control" id="member_pin"
							name="member_pin" required>
					</div>
<!-- 인증완료 버튼 -->
					<div class="col">
						<button type="button" class="btn btn-primary btn-sm">인증완료</button>
					</div>
				</div>



<!-- 생년월일 입력창 -->
				<div class="row">
					<div class="col">
						<span class="essential">* </span><label for="member_birth">생년월일</label>
					</div>
				</div>
				<div class="row input">
					<div class="col md-9">
						<select class="form-select" id="member_birth_year"
							name="member_birth_year" style="width: 100px;"></select>
					</div>

					<div class="col">
						<select class="form-select" id="member_birth_month"
							name="member_birth_month" style="width: 100px;"></select>
					</div>
					<div class="col">
						<input type="text" class="form-control" id="member_birth_day"
							name="member_birth_day" pattern="^(0[1-9]|[12][0-9]|3[01])$"
							title="두자리로 입력" minlength="2" maxlength="2" required
							style="width: 100px;">
					</div>
				</div>



<!-- 이메일 입력창 -->
				<div class="row">
					<div class="col">
						<label for="member_email"> E-mail</label>
					</div>
				</div>
				<div class="row input">
					<div class="col md-9">
						<input type="email" class="form-control" id="member_email"
							name="member_email"
							pattern="^([a-z]{1}[a-z0-9_+.-]+@)([a-zA-Z0-9]+\.)([a-z0-9]{2,4})$"
							title="abc@abc.com 형식으로 입력">
					</div>
				</div>



<!-- 닉네임 입력창 -->
				<div class="row">
					<div class="col">
						<label for="member_nickname"> 닉네임</label>
					</div>
				</div>	
				<div class="row input">
					<div class="col md-9">
						<input type="text" class="form-control" id="member_nickname"
							name="member_nickname" pattern="^[가-힣a-zA-Z0-9]{2,10}$"
							title="2자 이상 10자 이내로 한글, 영대소문자, 숫자 중 1개 이상 포함 " minlength="2"
							maxlength="10" style="width:255px;">
					</div>
				</div>




<!-- 가입동의 체크 -->
				<div class="row input member_agree">
					<div class="col">
							<span> 가입에 동의하시겠습니까? </span> 
							<input class="form-check-input" type="checkbox" id="member_agree" name="member_agree" value="Y" style="height:25px;width:25px;"  required >
					</div>
				</div>

<!-- 가입버튼 & 돌아가기 버튼 -->
				<div class="row">
					<div class="col-md-6">
						<button class="btn btn-secondary" id="join"
							style="background-color: #76b852;">가입하기</button>
					</div>		
					<div class="col-md-6">
						<a href="">
							<button class="btn btn-secondary" type="button" id="back"
								style="background-color: #76b852;">뒤로가기</button>
						</a>
					</div>
				</div>



			</form>

		</div>

	</div>




	<script>
		//입력 형식 안내 메세지
		const validityMessage = {
			badInput : "잘못된 입력입니다.",
			patternMismatch : "형식에 맞게 입력하세요",
			rangeOverflow : "글자수를 초과하였습니다",
			rangeUnderflow : "글자수에 미달하였습니다",
			stepMismatch : "[커스텀 메세지] 간격에 맞게 입력하세요",
			tooLong : "[커스텀 메세지] 최대 글자 미만으로 입력하세요",
			tooShort : "[커스텀 메세지] 최소 글자 미만으로 입력하세요",
			typeMismatch : "형식에 맞게 입력하세요!",
			valueMissing : "필수로 입력해주세요.",
		}
		function getMessage(validity) {
			for ( const key in validityMessage) {
				if (validity[key]) {
					return validityMessage[key]
				}
			}
		}
		function showError(input) {
			input.setCustomValidity(getMessage(input.validity) || "")
		}
		$("input").on("invalid", function() {
			showError(this);
		});

		
		
		
		
		
		//아이디 중복 체크
		let id_valid = false;
		let regex_id = /^[a-z](?=.*[0-9])[0-9a-z]{4,19}$/;
		
		$("#member_id").on("keyup",function() {
	    	let id = $("#member_id").val();
	    	console.log(id);
	    	if(!regex_id.exec(id)){
	    		$("#id_checking").html("영소문자와 숫자 포함 5자 이상 20자 이하").css("color", "red").css("font-size","x-small");
	    		id_valid = false;
	    	}else{
			$.ajax({
				url:"/id_over_check.member",
				type:"post",
				data:{ member_id: $("#member_id").val()},
				error: function(){
					alert("서버 요청 실패");
				}
				
			}).done(function(resp){
				resp = JSON.parse(resp);
				console.log(resp);
				
				if(resp){
					$("#id_checking").html("중복된 ID").css({"color":"red"}).css("font-size","x-small");
					id_valid = false;
				}else{
					$("#id_checking").html("사용가능한 ID").css({"color":"dodgerblue"}).css("font-size","x-small");
					id_valid = true;
				}
				
			})
	    	}
		})

		
				
				
		//비밀번호 보기 
		$("#view_pw").on("click", function() {
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

		//비밀번호 일치 확인 : 현재 사용X
		$("#member_repw,#member_pw").on("keyup", function() {

			if ($("#member_pw").val() != "" || $("#member_repw").val() != "") {

				if ($("#member_pw").val() != $("#member_repw").val()) {
					$("#check_repw").html("불일치").css({
						"color" : "red"
					});
					return false;
				} else {
					$("#check_repw").html("일치").css({
						"color" : "dodgerblue"
					});
					return true;
				}
			} else {
				$("#check_repw").html("");
			}

		})
		
		
//전화번호 중복 체크
		let phone_valid = false;
		let regex_phone = /^[0-9]{10,11}$/;
		
		$("#member_phone1,#member_phone2,#member_phone3").on("keyup",function() {
	    	let phone = $("#member_phone1").val()+$("#member_phone2").val()+$("#member_phone3").val();
	    	console.log(phone);
			$.ajax({
				url:"/phone_over_check.member",
				type:"post",
				data:{ member_phone: $("#member_phone1").val()+$("#member_phone2").val()+$("#member_phone3").val()},
				error: function(){
					alert("서버 요청 실패");
				}
				
			}).done(function(resp){
				resp = JSON.parse(resp);
				console.log(resp);
				if(resp){ //true면 중복인거
					$("#phone_checking").html("중복된 전화번호").css({"color":"red"}).css("font-size","x-small");
					phone_valid =  false;
				}else{
					$("#phone_checking").html("");
					phone_valid = true;
				}
				
			})
		})


//submit전 아이디,전화번호 중복 검사
		$("#join").on("click",function(){
			
			if(!id_valid){
				alert("아이디 중복 여부를 확인하세요.");
				return false;
			}
			
			if(!phone_valid){
				alert("전화번호 중복 여부를 확인하세요.");
				return false;
			}
			
		})			
		

		//생년월 select option 
		$(document)
				.ready(
						function() {
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