<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
	integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
	
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
* {
 	margin: 0;
 	padding: 0;
	box-sizing: border-box;
}
div {
	font-family: 'NanumSquareNeoBold';
	outline-color: red;
}
input {
	border-radius: 5px;
	box-shadow: 5px 2px 3px;
}
.container-fluid{
	background:
      repeating-linear-gradient(190deg, rgba(255, 0, 0, 0.5) 40px,
        rgba(255, 153, 0, 0.5) 80px, rgba(255, 255, 0, 0.5) 120px,
        rgba(0, 255, 0, 0.5) 160px, rgba(0, 0, 255, 0.5) 200px,
        rgba(75, 0, 130, 0.5) 240px, rgba(238, 130, 238, 0.5) 280px,
        rgba(255, 0, 0, 0.5) 300px),
      repeating-linear-gradient(-190deg, rgba(255, 0, 0, 0.5) 30px,
        rgba(255, 153, 0, 0.5) 60px, rgba(255, 255, 0, 0.5) 90px,
        rgba(0, 255, 0, 0.5) 120px, rgba(0, 0, 255, 0.5) 150px,
        rgba(75, 0, 130, 0.5) 180px, rgba(238, 130, 238, 0.5) 210px,
        rgba(255, 0, 0, 0.5) 230px),
      repeating-linear-gradient(23deg, red 50px, orange 100px,
        yellow 150px, green 200px, blue 250px,
        indigo 300px, violet 350px, red 370px);	
}

#logo {
	text-align: center;
}

#imgChange {
	width: 100px;
	height: 100px;
}
#dup_btn {
	font-weight: 500;
	color: whitesmoke;
	border: none;
	padding: 3px;
	border-radius: 3px;
	font-size: 13px;
	background: linear-gradient(red, yellow, blue, orange);
}
#dup_check {
	font-size: 12px;
	color: rgba(0,0,0,0.5);
}
#create_team {
	font-weight: 500;
	color: whitesmoke;
	background: linear-gradient(red, yellow, blue, orange);
	border: none;
	margin-top: 4px;
	margin-bottom: 4px;
	padding: 5px;
	border-radius: 3px;
	box-shadow: 5px 2px 3px;
}
#cancel_team {
	font-weight: 500;
	color: whitesmoke;
	background: linear-gradient(red, yellow, blue, orange);	
	border: none;
	margin-top: 4px;
	margin-bottom: 4px;
	padding: 5px;
	border-radius: 3px;
	box-shadow: 5px 2px 3px;
}
#hometown_code {
	border-radius: 10px;
	box-shadow: 5px 2px 3px;
}
#outline {
	border-radius: 10px;
	box-shadow: 5px 2px 3px;
}
#edi {
	background-color: #FFFFFF;
	width: 70%;
	height: 150px; 
	border: 1px solid black;
	margin: auto;
	border-radius: 10px;
	box-shadow: 5px 2px 3px;
}
</style>
</head>

<body>
	<form action="/create.team" id="frm" method="post" enctype="multipart/form-data">
		<div class="container-fluid">
			<div class="row body">
				<div class="col-12 col-md-2"></div>


				<div class="col-12 col-md-2" id="logo">
					<div class="row">
						<div class="col-md-4 col-xl-4 d-none d-md-block"></div>
						<div class="col-12 col-md-8 col-xl-8">
							<a href="javascript:void(0);" onclick="$('#imgUpload').trigger('click')" class="imgUploadBtn">
								<img src="/image/team_img/로고를 선택해주세요.png" id="imgChange" alt="사진 업로드">
							</a> 
							<input type="file" id="imgUpload" name="file" id="file" accept="image/jpeg,image/png,image/jpg" style="display: none" onchange="previewFile()">							
						</div>
					</div>
					<div class="row">
						<div class="col-12">
						</div>
					</div>
				</div>





				<div class="col-12 col-md-4" id="team_info">
					<div class="row" style="margin-top:10px;">
						<div class="col-md-3"></div>
						<div class="col-9 col-md-6" style="margin: auto;">
							<input type="text" placeholder="팀명" class="w-100"
								name="team_name" id="team_name">
						</div>
						<div class="col-3 col-md-3" align="center" style="text-align: left;">
							<button type="button" id="dup_btn">중복</button>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-6" id="dup_check">한글,영어만 가능</div>
						<div class="col-md-3"></div>
					</div>


					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-12 col-md-6" style="margin: auto;">
							<input type="text" value="${id}"
								class="w-100" name="captain_name" readonly>
						</div>
						<div class="col-md-3"></div>
					</div>

					<div class="row" style="margin-top:17px;">
						<div class="col-md-3"></div>
						<div class="col-12 col-md-6" style="margin: auto;">
							<input type="text"
								value="${phone}" class="w-100"
								name="captain_phone" readonly>
						</div>
						<div class="col-md-3"></div>
					</div>

					<div class="row" style="margin-top:17px;">
						<div class="col-md-3"></div>
						<div class="col-12 col-md-6" style="margin: auto;">
							<select name="hometown_code" id="hometown_code">
								<c:forEach var="item" items="${hometown_arr}">
									<option value="${item.code}">${item.name}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-3"></div>
					</div>

					<div class="row">

						<div class="col-12 col-md-8" style="margin:auto; margin-top:17px;">
							<textarea placeholder="간략 소개글" name="outline" class="w-100"
								id="outline"></textarea>
						</div>
					</div>
				</div>

				
			</div>

			<div class="row" style="margin:auto; margin-top:10px;">
				<div class="col-md-3 col-xl-3 "></div>

				<div class="col-12 col-md-6">
					<div contenteditable="true" id="edi"></div>
					<input type="hidden" name="content" id="spy">
				</div>

				<div class="col-md-3 col-xl-3"></div>
			</div>

			<br>

			<div class="row footer">
				<div class="col-6">
					<button type="button" id="cancel_team" style="float: right;" onclick="location.href='/'">생성취소</button>
				</div>
				<div class="col-6">
					<button id="create_team">생성하기</button>
				</div>
			</div>
		</div>
	</form>

	<script>
		// 생성취소 눌렀을 시 전 페이지로 넘어가기
		
		// 팀명 중복도 및 올바른 형식 
		let team_name = $("#team_name");
		let team_name_regex = /^[가-힣a-zA-Z]+$/;
		let dup = document.getElementById("dup_btn");
		let tf;

		var team_name_ValidFlag = false; // 팀명 사용 취소 누를 때 false를 반환해서 생성하기 버튼을 눌렀을 때 데이터 넘어가는 것을 막음.

		dup.onclick = function() {
			let val = team_name.val();
			tf = team_name_regex.test(val);
			if (tf) {
				$.ajax({
					url : "/team_name_check.team",
					type : "post",
					data : {
						team_name : $("#team_name").val()
					}
				}).done(function(resp) {
					resp = JSON.parse(resp);
					
					if(resp) {
						$("#dup_check").html("사용불가능").css("color", "#DF013A");
						team_name_ValidFlag = false;
					}
					else {
						$("#dup_check").html("사용가능").css("color", "#2E2EFE");
						team_name_ValidFlag = true;
					}
					
				})
				

			} else {
				swal('사용 불가능한 팀명!', "팀명을 다시 입력하세요.", 'warning');
				$("#team_name").val("");
				$("#dup_check").text("한글,영어만 가능").css({
					"color":"#000000", "color":"rgba(0,0,0,0.5)"
				});
			}
		}

		// 중복 검사 후 팀명 값을 변경했을 때 false 반환.
		$("#team_name").on("keyup", function() {
			team_name_ValidFlag = false;
		})

		// 생성하기 눌렀을 시
		$("#frm").on("submit", function() {

			if (team_name_regex.test(team_name.val().trim()) == false) {
				alert("팀명을 다시 입력하세요.");
				return false;
			}
			else if ($("#imgUpload").val() == "") {
				alert("이미지를 업로드 하세요.")
				return false;
			}
			
			 else if (team_name_ValidFlag == false) {
				alert("중복도 검사를 다시 하세요.")
				return false;
			}
			 else if ($("#outline").val().trim() == "") {
				alert("간략소개글을 입력하세요.");
				return false;
			}
			 else if ($("#edi").html().trim() == "") {
				alert("게시글을 입력하세요.");
				return false;
			}
			let content = $("#edi").html();
			$("#spy").val(content);

			
		});
		
		
		function previewFile() {
			  let preview = document.querySelector("img");
			  let file = document.querySelector("input[type=file]").files[0];
			  let reader = new FileReader();

			  reader.addEventListener(
			    "load",
			    () => {
			      preview.src = reader.result;
			    },
			    false
			  );

			  if (file) {
			    reader.readAsDataURL(file);
			  }
			}
	</script>

</body>

</html>