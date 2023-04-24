<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KickKick - 회원가입</title>
<!-- 부트스트랩 CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 부트스트랩 JQ , JS CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
#container {
	border: 1px solid black;
	width: 700px;
	height: 800px;
	position: relative;
	left: 25%;
}

tr{
	width: 450px;
	height: 70px;
}
.form-floating{
	height:50px;
}
td{
width:100px;}
</style>
</head>
<body>

	<div id="container">

		<div>회원가입</div>

		<hr>


		<div id="join_form">
			<form action="/insert.members" method="post">
				<table align="center">



					<tr>
						<td colspan="3">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" 
								id="member_id" name="member_id"
								pattern="^[a-z]{1}[a-z0-9]{5,20}$"
								title="5자 이상 20자 이내로 영소문자,숫자 필수 포함" 
								minlength="5" maxlength="20" required> 
								<label for="member_id">아이디(필수)</label>
							</div>
						</td>
						<td colspan="1">
							<button type="button" class="btn btn-primary btn-sm" id="id_over_check">중복확인</button>
						</td>
					</tr>
					
					
					
					
					
					
					
					<tr>
						<td  colspan="3">
							<div class="form-floating">
								<input type="password" class="form-control" 
								id="member_pw" name="member_pw"
								pattern="^(?=.*[a-zA-Z])(?=.*[~.!@#$%^&*()_+={}>;<:,.?/\-\[\]\\\|])(?=.*[0-9]).{8,20}$"
								title="영대소문자,숫자,특수문자를 모두 포함한 8~20자" 
								minlength="8" maxlength="20" required>
								<label for="member_pw">비밀번호(필수)</label>
							</div>
						</td>
						<td colspan="1">
							<button class="btn btn-light btn-sm" id="view_pw" type="button">보기</button>
						</td>
					</tr>







					<tr>
						<td colspan="3">
							<div class="form-floating mb-3">
								<input type="text"  class="form-control" 
								id="member_name" name="member_name"
								pattern="^[가-힣]{2,5}$" 
								title="2자 이상 5자 이내의 한글" 
								minlength="2" maxlength="5" required>
								<label for="member_name">이름(필수)</label>
							</div>
						</td>
					</tr>






					<tr>
							<td>
						<div class="form-floating">	
								<input type="text"  class="form-control" 
								id="member_phone1" name="member_phone1" 
								pattern="^0+\d{1,2}$" 
								minlength="2" maxlength="3" required 
								style="width:140px;">
								<label for="member_phone1">전화번호(필수)</label>
							</div>
							</td>
							<td>
							<div clasㄹs="form-floating">	
								<input type="text"  class="form-control" 
								id="member_phone2" name="member_phone2"
								pattern="^\d{3,4}$" 
								minlength="3" maxlength="4" required
								style="width:100px;"> 
								<label for="member_phone2"></label>
							</div>
							</td>
							<td> 
							<div claㄹss="form-floating">	
								<input type="text" class="form-control" 
								id="member_phone3" name="member_phone3" 
								pattern="^\d{4}$"
								minlength="4" maxlength="4" required 
								style="width: 100px;">
								<label for="member_phone3"></label>
							</div>
							</td>
						
						<td>
							<button type="button" class="btn btn-primary btn-sm">인증번호 발송</button>
						</td>
					</tr>





					<tr>
						<td colspan="3">
							<div class="form-floating">	
								<input type="text" class="form-control" 
								id="member_pin" name="member_pin" required>
								<label for="member_pin">인증번호 (필수)</label>
							</div>
						</td>
						<td colspan="2">
							<button  type="button" class="btn btn-primary btn-sm">인증완료</button>
						</td>
					</tr>




					<tr>
						<div class="form-floating">
							<td style="width:100px;">
								<select class="form-select" id="member_birth_year" name="member_birth_year" style="width:100px;"></select>
							</td>
							<td  width="100px">
								<select class="form-select" id="member_birth_month" name="member_birth_month" style="width:100px;"></select>
							</td>
							<td  width="100px">
								<input type="text" class="form-control"
								id="member_birth_day" name="member_birth_day"
								pattern="^(0[1-9]|[12][0-9]|3[01])$" title="두자리로 입력"
								minlength="2" maxlength="2" required style="width: 100px;">
							</td>
						</div>
					</tr>




					<tr>
						<td colspan="3">
							<div class="form-floating">
								<input type="email" class="form-control"
									id="member_email" name="member_email"
									pattern="^([a-z]{1}[a-z0-9_+.-]+@)([a-zA-Z0-9]+\.)([a-z0-9]{2,4})$"
									title="abc@abc.com 형식으로 입력">
								 <label for="member_email">E-mail</label>	
							</div>	
						 </td>
					</tr>




					<tr>
						<td colspan="3">
							<div class="form-floating">	
								<input type="text"  class="form-control"
									id="member_nickname" name="member_nickname" 
									pattern="^[가-힣a-zA-Z0-9]{2,10}$"
									title="2자 이상 10자 이내로 한글, 영대소문자, 숫자 중 1개 이상 포함 " 
									minlength="2" maxlength="10">
								<label for="member_nickname">닉네임</label>	
							</div>		
						</td>
					</tr>





					<tr>
						<div class="form-check">
							<td colspan="4">
								<label class="form-check-label" for="member_agree">
        							가입에 동의하시겠습니까?
								</label>
								<input class="form-check-input" type="checkbox" id="member_agree" required>
							</td>
					</tr>





					<tr>
						<td colspan="4" align="center">
							<button class="btn btn-secondary" id="join">가입하기</button> 
							<a href="">
							<button class="btn btn-secondary" type="button" id="back">뒤로가기</button></a>
						</td>
						</div>
					</tr>




				</table>
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
			typeMismatch : "형식에 맞게 입력하세요",
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
	let id_valid_flag = false;
	$("#id_over_check").on("click",function(){
		if($("#member_id").val().trim() == ""){
			alert("ID를 입력해주세요.");
			return;
		}		
		window.open("/id_over_check.members?member_id="+$("#member_id").val(),"","width=350px,height=250px");
		
	})
	
//비밀번호 보기 
		$("#view_pw").on("click",function(){
			let password_field = $("#member_pw");
			let password_field_type = password_field.attr("type");
			console.log("click");
			
			if(password_field_type =="password"){
				password_field.attr("type","text");
				$("#view_pw").html("숨기기");
			}else{
				password_field.attr("type","password");
				$("#view_pw").html("보기");
			}
			
		})
		
		
//PW 일치 확인
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

		
		
		

//생년월 select option 
		$(document).ready(function() {
							var now = new Date();
							var year = now.getFullYear();
							var mon = (now.getMonth() + 1) > 9 ? ''
									+ (now.getMonth() + 1) : '0'
									+ (now.getMonth() + 1);

							//년도 selectbox만들기               
							for (var i = 1900; i <= year; i++) {
								$('#member_birth_year').append('<option value="' + i + '">' + i + '</option>');
							}
							// 월별 selectbox 만들기            
							for (var i = 1; i <= 12; i++) {
								var mm = i > 9 ? i : "0" + i;
								$('#member_birth_month').append('<option value="' + mm + '">' + mm + '</option>');
							}

							$("#member_birth_year  > option[value="+ year + "]").attr("selected","true");
							$("#member_birth_month  > option[value="+ mon + "]").attr("selected","true");
						})

	</script>

</body>
</html>