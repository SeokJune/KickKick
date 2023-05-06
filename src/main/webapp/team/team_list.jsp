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
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
* {
	box-sizing: border-box;
}

div {
	font-family: 'NanumSquareNeoBold';
}

.container-fluid {
	background-color: whitesmoke;
}

.gate_header {
	text-align: center;
	font-size: 12px;
	border: 1px solid black;
	border-radius: 10px;
	background-color: #F7F2E0;
}

.gate_header>div {
	font-family: 'NanumSquareNeoExtraBold';
}

.team_info {
	text-align: center;
	font-size: 12px;
	display: flex;
	align-items: center;
}

.navi {
	text-align: center;
	font-size: 15px;
}

hr {
	border: 1px solid black;
}

a {
	text-decoration: none;
	color: inherit;
}

.search_btn {
	font-weight: 600;
	color: whitesmoke;
	background: linear-gradient(to right, #76b852, #3ADF00);
	border: none;
	padding: 5px;
	border-radius: 3px;
}

</style>
</head>

<body>
	<div class="container-fluid">

		<div class="row search">
			<div class="col-md-4"></div>

			<!-- 
			<div class=" col-3 col-md-1" style="text-align: right; line-height: 58px;">
				<select>
					<option>팀명</option>
					<option>랭킹</option>
				</select>
			</div>
			 -->

			<div class="col-9 col-md-4">
				<nav class="navbar navbar-light">
					 <div id="frm" class="d-flex" style="margin: auto;"> 
						<input id="input_team_name" class="form-control me-2"
							type="search" placeholder="팀명" aria-label="Search">
						<button class="btn btn-outline-success search_btn" type="submit">Search</button>
					 </div> 
				</nav>
			</div>

			<div class="col-md-4"></div>

		</div>

		<div class="row hr">
			<div class="col-md-2"></div>
			<div class="col-12 col-md-8">
				<hr style="border: 2px solid black;">
			</div>
			<div class="col-md-2"></div>
		</div>

		<div class="row">
			<div class="col-md-2 col-xl-2"></div>
			<div class="col-12 col-md-8 col-xl-8">
				<div class="row gate_header">
					<div class="col-4 col-md-2 col-xl-1">LOGO</div>
					<div class="col-4 col-md-2 col-xl-2">팀명</div>
					<div class="col-xl-1 d-none d-xl-block">연고지</div>
					<div class="col-4 col-md-4 col-xl-3">간략 소개글</div>
					<div class="col-md-2 col-xl-1 d-none d-md-block">랭킹</div>
					<div class="col-md-2 col-xl-2 d-none d-md-block">팀장</div>
					<div class="col-xl-2 d-none d-xl-block">팀 생성일</div>
				</div>
			</div>
			<div class="col-md-2 col-xl-2"></div>
		</div>
		<div class="row close">
			<c:choose>
				<c:when test="${teamlist_arr.size() != 0}">
					<c:forEach var="i" items="${teamlist_arr}">

						
							<div class="col-md-2"></div>
							<div class="col-12 col-md-8">
								<hr>
							</div>
							<div class="col-md-2"></div>
						

						
							<div class="col-md-2 col-xl-2"></div>
							<div class="col-12 col-md-8 col-xl-8">
								<div class="row team_info">
									<div class="col-4 col-md-2 col-xl-1">
										<a href="/view.team?team_code=${i.code}"><img
											src="${i.logo_path}${i.logo}"
											style="width: 50px; height: 50px; border-radius: 25px"></a>
									</div>
									<div class="col-4 col-md-2 col-xl-2">
										<a href="/view.team?team_code=${i.code}">${i.name}</a>
									</div>
									<div class="col-xl-1 d-none d-xl-block">${i.hometown_name}</div>
									<div class="col-4 col-md-4 col-xl-3">${i.outline}</div>
									<div class="col-md-2 col-xl-1 d-none d-md-block">랭킹</div>
									<div class="col-md-2 col-xl-2 d-none d-md-block">${i.member_name}</div>
									<div class="col-xl-2 d-none d-xl-block">${i.formedDate}</div>
								</div>
							</div>
							<div class="col-md-2 col-xl-2"></div>
						

						
							<div class="col-md-2"></div>
							<div class="col-12 col-md-8">
								<hr>
							</div>
							<div class="col-md-2"></div>
						

					</c:forEach>
				</c:when>
				<c:otherwise>
					<div class="row gate">
						<div class="col-md-1 col-xl-2"></div>
						<div class="col-12 col-md-10 col-xl-8">생성된 팀이 없습니다.</div>
						<div class="col-md-1 col-xl-2"></div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="row hr">
			<div class="col-md-2"></div>
			<div class="col-12 col-md-8">
				<hr style="border: 2px solid black;">
			</div>
			<div class="col-md-2"></div>
		</div>



		<div class="row">
			<div class="col-12 navi">${navi}</div>
		</div>

	</div>


	<script>
	
	
	$(".search_btn").on("click", function() {
		if($("#input_team_name").val().trim() == "") {
			alert("팀명을 입력하세요.");
			
		}
		else {
			$(".close").children().remove();
			$(".navi").parent().remove();
			$.ajax({
				url : "/search_team_name.team",
				dataType : "json",
				data : {
					team_name : $("#input_team_name").val()
				}
			}).done(function(resp) {
				if(resp.length == 0) {
					let read1=$('<div class="col-md-1 col-xl-2"></div><div class="col-12 col-md-10 col-xl-8"><br></div><div class="col-md-1 col-xl-2"></div>');
					let read2=$('<div class="col-md-1 col-xl-2"></div><div class="col-12 col-md-10 col-xl-8" style="text-align: center">검색된 팀이 없습니다.</div><div class="col-md-1 col-xl-2"></div>');
					$(".close").append(read1)
					$(".close").append(read2);
				}
				for(let i = 0; i<resp.length; i++) {
					let read1=$('<div class="col-md-2"></div><div class="col-12 col-md-8"><hr></div><div class="col-md-2"></div>')
					let read2=$('<div class="col-md-2 col-xl-2"></div><div class="col-12 col-md-8 col-xl-8"><div class="row team_info"><div class="col-4 col-md-2 col-xl-1"><a href="/view.team?team_code='+resp[i].code+'"><img src="'+resp[i].logo_path+''+resp[i].logo+'" style="width: 50px; height: 50px; border-radius: 25px"></a></div><div class="col-4 col-md-2 col-xl-2"><a href="/view.team?team_code=${i.code}">'+resp[i].name+'</a></div><div class="col-xl-1 d-none d-xl-block">'+resp[i].hometown_name+'</div><div class="col-4 col-md-4 col-xl-3">'+resp[i].outline+'</div><div class="col-md-2 col-xl-1 d-none d-md-block">랭킹</div><div class="col-md-2 col-xl-2 d-none d-md-block">'+resp[i].member_name+'</div><div class="col-xl-2 d-none d-xl-block">'+resp[i].member_phone+'</div></div></div><div class="col-md-2 col-xl-2"></div>');
					let read3=$('<div class="col-md-2"></div><div class="col-12 col-md-8"><hr></div><div class="col-md-2"></div>')
	
					$(".close").append(read1);
					$(".close").append(read2);
					$(".close").append(read3);
					
					
					
				}
			})
		}
	})
	
		/* $("#frm").on("submit", function() {
			if ($("#input_team_name").val().trim() == "") {
				alert("다시 입력해주세요.")
			} else {
				$.ajax({
					url : "/search_team_name.team",
					type : "post",
					data : {
						team_name : $("#input_team_name").val()
					}
				}).done(function(resp) {
					resp = JSON.parse(resp);
					for (let i = 0; resp.length; i++) {
						$("#h1").html("");
						$("#b1").html("");
						$("#h2").html("");
					}
				})
			}

		}) */
	</script>
</body>

</html>