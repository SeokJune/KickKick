<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a47338e87e3d914e6d508799cd4f4e17&libraries=services"></script>
<style>
* {
	font-family: 'NanumSquareNeoBold';
}

.btn {
	border: none;
}
</style>
</head>
<body>
	<div class="row header1">
		<div>
			<input type="hidden" id="code" name="code" readonly>
			<button type="button" id="team_select" class="btn btn-primary btn-sm">팀
				선택</button>
			<div class="input-group mb-3">
				<span class="input-group-text">팀명</span> <input type="text"
					class="form-control" id="name" name="name" readonly>
			</div>
		</div>
		<div>
			<button type="button" id="match_select"
				class="btn btn-primary btn-sm">경기 선택</button>
			<div class="input-group mb-3">
			<input type="hidden" id="latirude" readonly>
			<input type="hidden" id="longitude" readonly>
				<span class="input-group-text">매치코드</span> <input type="text"
					class="form-control" id="competition_registration_code"
					name="competition_registration_code" readonly> <span
					class="input-group-text">장소</span> <input type="text"
					class="form-control" id="match_place" name="match_place" readonly> <span
					class="input-group-text">일시</span> <input type="text"
					class="form-control" id="competition_date"
					name="competition_date" readonly>
			</div>
		</div>
	</div>
	<div>
		<input type="hidden" id="apply_list" readonly>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">신청인</th>
				<th scope="col">소개글</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody id="table_body">
			<tr>
				<td colspan=4 align=center><a href="/index.jsp"><input
						type="button" value="뒤로가기" class="btn btn-primary"></a></td>
			</tr>
		</tbody>
	</table>
	<script>
		function set_team_info(c, lp, l, n, mn, mp) {
			document.getElementById("code").value = c;
			document.getElementById("name").value = n;
		}

		function set_match_info(crc, ckc, ckn, ckh, la, lo, cd) {
			document.getElementById("competition_registration_code").value = crc;
			document.getElementById("latirude").value = la;
			document.getElementById("longitude").value = lo;
			document.getElementById("competition_date").value = cd;
		}

		$("#team_select").on(
				"click",
				function() {
					window.open("/team_check.mercenary", "",
							"width=350px,height=250px");
				});
		$("#match_select")
				.on(
						"click",
						function() {
							window.open("/match_check.mercenary?code="
									+ $("#code").val(), "",
									"width=600px,height=300px");
						});
		
		survey('#competition_registration_code', function() {
			$.ajax(
					{
						url : "/apply_list_ajax.mercenary",
						type : "post",
						data : {
							"code" : $("#code").val(),
							"competition_registration_code" : $(
									"#competition_registration_code").val()
						}
					}).done(function(resp) {
				resp = JSON.parse(resp);
				document.getElementById("apply_list").value = resp;
				console.log(resp.length);
				for(var i=0;i < resp.length;i++){
				var row;
					row += '<tr>';
					row += '<th scope="row">' + '</th>';
					row += '<td>' + resp[0].name + '</td>';
					row += '<td>';
					row += '<div class="col-12 col-md-12 col-xl-12">' + '<textarea class="form-control" name="contents" id="contents" readonly>'
					+ resp[0].content + '</textarea>' + '</div>';
					row += '</td>';		
					row += '<td>';
					row += '<button class="btn btn-primary">' + '수락' + '</button>'
					row += '&nbsp;&nbsp;';
					row += '<button class="btn btn-primary">' + '거절' + '</button>'
					row += '</td>';		
					row += '</tr>';
					
					$("#table_body").prepend(row);
				}
			});
		});

		function survey(selector, callback) {
			var input = $(selector);
			var oldvalue = input.val();
			setInterval(function() {
				if (input.val() != oldvalue) {
					oldvalue = input.val();
					callback();
				}
			}, 100);
		}
	</script>
</body>
</html>