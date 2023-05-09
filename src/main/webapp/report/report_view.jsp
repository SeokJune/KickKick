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
<style type="text/css">
	div {
		padding: 10px;
		font-family: 'NanumSquareNeoBold';
		box-sizing: border-box;
	}
	.container {
		padding-top: 70px;
	}
	.container-fluid{
	padding:0;
	padding-right: calc(var(--bs-gutter-x) * .5);
    padding-left: calc(var(--bs-gutter-x) * .5);
}
	.target_box{
		border: 1px solid #d2d4d6;
		margin:10px;
		margin-bottom:0;

	}
	.btn_box{
		text-align:center;
	}
</style>
</head>
<body>
	<c:import url="/commons/gnb.jsp">
	</c:import>
	<div class="container">
		<div class="row header" style="border-bottom: 1px solid #d2d4d6;">
			<div class="col-12 text-center" id="title">
				<h2 style="font-family: 'NanumSquareNeoExtraBold';">신고 처리</h2>
			</div>
			<div class="pb-0">신고번호 : ${report.code}</div>
			<div class="pb-0">신고자 : ${report.member_id}</div>
			<div>신고일 : ${report.reg_date}</div>
		</div>
		<div class="row body" style="border-bottom: 1px solid #d2d4d6;">
			<div class="pb-0">신고대상<button type="button" class="btn btn-secondary btn-sm mx-1" id="see_more">해당글이동</button></div>
			<div class="target_box">
				<div class="pb-0">타입 : 게시글/댓글</div>
				<div class="pb-0">닉네임 : ${target.member_nickname}</div>
				<div class="target_content">내용 : ${target.content}</div>
			</div>
			<div class="pb-0">신고사유 : ${report.report_kind}</div>
			<div>상세내용 : ${report.content}</div>
		</div>
		<div class="row footer pb-5">
		<div class="pb-0"><h4 class="m-0">처리하기</h4></div>
		<form action="/handle.report" method="post">
		<div class="row pt-0" style="border-bottom: 1px solid #d2d4d6;">
			<div class="col-6">
			<select class="form-select" aria-label="Default select example" name="wide_option" id="wide_option" onchange="selectOptionChange(this)" required>
				<option value="" selected>처리 방법 선택</option>
				<option value="release">처분 없음</option>
				<option value="stop_activity">활동 정지</option>
			</select>
			</div>
			<div  class="col-6">
			<select class="form-select" aria-label="Default select example" name="narrow_option" id="narrow_option" required>
				<option value="" selected>세부 선택</option>
			</select>
			</div>
		</div>
			<div>해당 신고를 처리 하시겠습니까?</div>
			<div class="btn_box">
			<button type="submit" class="btn btn-primary" id="stop">확인</button>
			<button type="button" class="btn btn-secondary" id="cancel">목록으로</button>
			</div>
		</form>
		</div>
	</div>
	<script>
	function selectOptionChange(e) {
		var 처분없음 = ['처분없음'];
		var 활동정지 = ['1일','3일','7일','14일','30일','무기한'];

	var target = document.getElementById("narrow_option");

	if(e.value=="release")  var d =  처분없음;
	else if(e.value=="stop_activity") var d = 활동정지;

	target.options.length = 0;

	for (x in d) {
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}
};

$("#cancel").on("click",function(){
	location.href="/list.report?b_c=1003&cpage=1";
});
	</script>
</body>
</html>