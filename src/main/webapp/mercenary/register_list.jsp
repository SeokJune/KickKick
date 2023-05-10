<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegisterList</title>
<!-- JQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap - CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- Bootstrap - JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- Bootstrap - icon -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- Font 기본 : {font-family: 'NanumSquareNeoBold'}-->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">

<!-- gbn css -->
<link href="/commons/css/gnb.css" rel="stylesheet" type="text/css">
<!-- kakao api -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a47338e87e3d914e6d508799cd4f4e17&libraries=services"></script>
<style>
* {
	font-family: 'NanumSquareNeoBold';
}

.container {
	width: 70%;
	overflow-x: auto;
	margin-top: 150px;
}

.table {
	/* table-layout:fixed; */
	border_collapse: separate;
}

th {
	white-space: nowrap;
}

td {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>
</head>

<body>
<c:import url="/commons/gnb.jsp">
	</c:import>
	<div class="container fluid shadow p-3 mb-5 bg-body-tertiary rounded">
		<h2 class="mb-5" style="text-align: center;">용병 등록 리스트</h2>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">날짜</th>
						<th scope="col">장소</th>
						<th scope="col">팀명</th>
						<th scope="col">실력</th>
						<th scope="col">구하는 인원수</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${register_list}">
						<tr>
							<th scope="row"></th>
							<td><input type="hidden" name="code" value="${i.code}"
								readonly> <input type="hidden" name="team_code"
								value="${i.team_code}" readonly> <input type="hidden"
								name="competition_result_code"
								value="${i.competition_result_code}" readonly> <input
								type="hidden" name="ability_code" value="${i.ability_code}"
								readonly> <input type="hidden" name="name"
								value="${i.name}" readonly> <input type="hidden"
								id="latirude" name="latirude" value="${i.latirude}" readonly>
								<input type="hidden" id="longitude" name="longitude"
								value="${i.longitude}" readonly> <%@page
									import="commons.DateCalculationUtils"%>${DateCalculationUtils.date_format_timestamp(i.competition_date)}
							</td>
							<td id="match_place_${i.code}"><script>
						var geocoder = new kakao.maps.services.Geocoder();

						var coord = new kakao.maps.LatLng(${i.latirude},${i.longitude});
						var callback = function(result, status) {
							if (status === kakao.maps.services.Status.OK) {
								document.getElementById("match_place_"+${i.code}).innerHTML = result[0].address.address_name;
							}
						};

						geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
						</script></td>
							<td>${i.name}</td>
							<c:choose>
								<c:when test="${i.ability_code == 1003}">
									<td>하</td>
								</c:when>
								<c:when test="${i.ability_code == 1002}">
									<td>중</td>
								</c:when>
								<c:otherwise>
									<td>상</td>
								</c:otherwise>
							</c:choose>
							<td>${i.headcount}명</td>
							<td align="center">
							<c:choose>
								<c:when test="${id.equals(i.leader_id)}">
									<a href="/to_register_modify_form.mercenary?code=${i.code}&ctPage=${ctPage}"><input type="button" class="btn btn-outline-primary btn-sm" value="수정"></a>
									<button type="button" class="btn btn-outline-primary btn-sm" onclick="delete_mercenary_register(${i.code})">삭제</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-primary btn-sm"
									onclick="valid_same_team(${i.code},${i.team_code});valid_apply(${i.code},${i.competition_result_code},${ctPage})">신청</button>
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
					<tr height="20">
						<td align="center" colspan="7">${navi}</td>
					</tr>
					<tr>
						<td align="center" colspan="7">
							<form action="/to_register_list.mercenary">
								<input type="hidden" name="cpage" value="1">
								
								<select name="searchOption">
									<option value='team_name'>팀명</option>
								</select>
								<input type="text" name="searchWord" style="width: 300px" placeholder="검색해주세요">
								<button class="btn btn-primary btn-sm">검색</button>
							</form>
						</td>
					</tr>
					<tr>
						<td colspan=7 align=center><a href="/index.jsp"><input
								type="button" value="뒤로가기" class="btn btn-primary"></a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<script>
	// 수정 버튼 눌렀을 때
	function modify_mercenary_register(code){
		
	}
	
	// 삭제 버튼 눌렀을 때
	function delete_mercenary_register(code){
		$.ajax({
			url:"/delete_mercenary_register_ajax.mercenary",
			async: false,
			type:"post",
			dataType: "json",
			data:{
				code:code
			}
		}).done(function(resp) {
			console.log(resp);
			if(resp == 1){
				alert("삭제 완료!");
				location.reload();
			}
		})
	}
	
	var flag = true;
	
	// 로그인 ID의 팀 코드와 신청하려는 팀 코드가 같은지 검사
	function valid_same_team(code,team_code){
			$.ajax({
				url:"/apply_same_team_ajax.mercenary",
				async: false,
				type:"post",
				dataType: "json",
				data:{
					team_code:team_code
				}
			}).done(function(resp) {
				if(resp){
					console.log(resp);
					alert("같은 팀에는 용병 신청을 하실 수 없습니다!");
					location.reload();
					flag = false;
					return false;
				}
			})
	}
	
	// 로그인 ID의 팀 코드와 신청하려는 팀 코드가 같은지 검사
	function valid_apply(code,competition_result_code,ctPage){
		if(!flag){
			return false;
		}
		$.ajax({
			url:"/apply_btn_ajax.mercenary",
			async: false,
			type:"post",
			dataType: "json",
			data:{
				competition_result_code:competition_result_code
			}
		}).done(function(resp) {
			console.log(resp);
			if(resp){
				alert("이미 선택하신 매치에 용병 신청을 하셨습니다!");
				location.reload();
				return false;
			}else{
				window.location.href = "/to_apply_form.mercenary?code="+code+"&cpage="+ctPage;
			}
		})
	}
	
	
	</script>
</body>
</html>