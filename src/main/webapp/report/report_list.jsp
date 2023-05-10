<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KickKick</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<!-- awesome font -icon--->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Bootstrap - icon -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
   rel="stylesheet">
<!-- gbn css -->
<link href="/commons/css/gnb.css" rel="stylesheet" type="text/css">
<style>
div {
	padding: 10px;
	font-family: 'NanumSquareNeoBold';
	/* border:1px dotted pink; */
}
.container {
	padding-top: 70px;
}
.container-fluid{
	padding:0;
	padding-right: calc(var(--bs-gutter-x) * .5);
    padding-left: calc(var(--bs-gutter-x) * .5);
}
.title_box,.content{
	display: block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.content{
	font-family: 'NanumSquareNeo';
}
.report:hover{
	cursor:pointer;
}
</style>
</head>
<body>
	<c:import url="/commons/gnb.jsp">
	</c:import>
	<div class="container">
		<div class="row header" style="border-bottom: 1px solid #d2d4d6;">
			<div class="col-12" id="title">
				<h2>신고내역</h2>
			</div>
			<div class="col-12">
				신고된 유저 목록
			</div>
			<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
  				<input type="radio" class="btn-check" name="b_c" id="btnradio1" autocomplete="off" value="1003" checked>
  				<label class="btn btn-outline-primary" for="btnradio1">자유게시판</label>

  				<input type="radio" class="btn-check" name="b_c" id="btnradio2" autocomplete="off" value="1004">
  				<label class="btn btn-outline-primary" for="btnradio2">홍보게시판</label>

  				<input type="radio" class="btn-check" name="b_c" id="btnradio3" autocomplete="off" value="1001">
  				<label class="btn btn-outline-primary" for="btnradio3">팀게시판</label>
  				
  				<input type="radio" class="btn-check" name="b_c" id="btnradio4" autocomplete="off" value="1002">
  				<label class="btn btn-outline-primary" for="btnradio4">공지사항</label>
			</div>
		</div>
		<div class="row body" style="border-bottom: 1px solid #d2d4d6;">
			<div class="list-group" style="border-radius: 0;">
				<a href="/select.report?c=&cpage=" class="report list-group-item list-group-item-action list-group-item-primary p-0">
					<input type="hidden" class="code" value="">
					<div class="col-12">
						<div class="col title_box pb-0">
							<span class="status">[신고접수]</span><span class="report_kind">신고사유</span>
							<span class="nickname" style="font-size: small;">작성자</span> · <span class="date" style="font-size: small;">작성일</span>
						</div>
						<div class="col content pt-0">샘플 신고대상 내용 ㄱㄴㄷㄹㅁㅂㅅㅇㅈㅊㅋㅌㅍㅎ</div>
					</div>
				</a>
				<c:forEach var="report" items="${list}">
					<a href="/select.report?c=${report.code}&cpage=${cpage}" class="report list-group-item list-group-item-action p-0">
						<input type="hidden" class="code" value="${report.code}">
						<div class="col-12">
						<div class="col title_box pb-0">
							<span class="status">[${report.status_name}] </span><span class="report_kind"> ${report.report_kind_name}</span>
							<span class="nickname" style="font-size: small;">${report.member_nickname}</span> · <span class="date" style="font-size: small;">${report.calculated_date}</span>
						</div>
						<div class="col content pt-0">${report.report_board_content}${report.report_reply_content}</div>
					</div>
					</a>
				</c:forEach>
			</div>
			<div class="col-12 pb-0">
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm justify-content-center">
						${navi}
					</ul>
				</nav>
			</div>
		</div>
		<div class="row footer pb-4">
			<form class="d-flex p-0" action="/list.report" method="post">
				<div class="col-3 p-1">
					<input type="hidden" name="cpage" value="1"> 
					<select
						class="form-select search_option" aria-label=".form-select-sm example"
						name="wide_option" id="wide_option" onchange="selectOptionChange(this)">
						<option value="신고대상" selected>신고대상</option>
						<option value="신고사유">신고사유</option>
						<option value="상세설명">상세설명</option>
					</select>
				</div>
				<div class="col-3 p-1">
					<select
						class="form-select search_option" aria-label=".form-select-sm example"
						name="narrow_option" id="narrow_option">
						<option value="아이디" selected>아이디</option>
						<option value="닉네임">닉네임</option>
					</select>
				</div>
				<div class="col-4 p-1">
					<input type="text" class="form-control search_word" placeholder=""
						aria-label="Username" aria-describedby="basic-addon1"
						name="search_word" id="search_word">
				</div>
				<div class="col-2 p-1 d-grid">
					<button type="submit" class="btn btn-secondary">검색</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">

	
	function selectOptionChange(e) {
			var 신고대상 = ['아이디','닉네임'];
			var 신고사유 = ['스팸홍보/도배','불법정보','음란물','불쾌한표현','개인정보노출','기타'];
			var 상세설명 = ['상세설명'];

		var target = document.getElementById("narrow_option");

		if(e.value=="신고대상")  {var d =  신고대상;$("#search_word").attr("disabled",false);}
		else if(e.value=="신고사유") {var d = 신고사유;$("#search_word").attr("disabled",true);}
		else if(e.value=="상세설명") {var d = 상세설명;$("#search_word").attr("disabled",false);}

		target.options.length = 0;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}
	};
	
	
	</script>
</body>
</html>