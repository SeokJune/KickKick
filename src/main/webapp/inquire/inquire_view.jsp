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
.icons{
	padding-right:5px;
}
</style>
</head>
<body>
	<c:import url="/commons/gnb.jsp">
	</c:import>
	
	<div class="container">
		<div class="row header" style="border-bottom: 1px solid #d2d4d6;">
			<div class="col-12" id="title">
				<h2>[${inquire.status_name}] [${inquire.report_kind_name}]</h2>
			</div>
			<div class="col-12">
				${inquire.member_nickname}· ${inquire.calculated_date}<c:if test="${inquire.mod_date ne null}">(수정됨)</c:if> 
			</div>
		</div>
		<div class="row body" style="border-bottom: 1px solid #d2d4d6;">
			<div class="col-12 pb-4" style="height: auto;min-height:400px;">
			<i class="icons fa-solid fa-q fs-1" style="color: #198754;"></i>
				${inquire.content}
			</div>
			<div class="col text-center">
				<c:if test="${sessionScope.nickname ne inquire.member_nickname && sessionScope.auth_grade ne null}">
				<button type="button" class="btn btn-primary">답변등록</button>
				</c:if>
			</div>
			<c:if test="${sessionScope.nickname eq inquire.member_nickname}">
			<div class="col-12 gap-2 d-flex justify-content-end">
				<button type="button" class="btn btn-dark" id="to_update">수정</button>
				<button type="button" class="btn btn-secondary" id="delete">삭제</button>
			</div>
			</c:if>
		</div>
		<div class="row footer pb-4">
			<div>
				<i class="icons fa-solid fa-a fs-1" style="color: #0d6efd;"></i>
				<b id="answer_count">답변 ${answer_list.size()}개</b>
			</div>
			<div class="col-12" id="answers_box">
				<c:forEach var="answer" items="${answer_list}">
					<div class="row answer_box">
						<input type="hidden" class="a_code" value="${answer.code}">
						<div class="col-12 a_content">${answer.content}</div>
						<div class="col-12 fs-6 a_date">${answer.calculated_date}</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-12 p-4 gap-2 d-flex justify-content-center">
				<button type="button" class="btn btn-primary" id="to_prev">◁이전글</button>
				<button type="button" class="btn btn-primary" id="to_list">목록으로</button>
				<button type="button" class="btn btn-primary" id="to_next">다음글▷</button>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$("#to_prev").on("click", function () {
		if (${ code_list[1] == 0 }){
		alert("이전글이 없습니다.");
	}
		else {
		location.href = "/select.inquire?c=${code_list[1]}&cpage=${cpage}";
	}
	});

	$("#to_list").on("click", function () {
		location.href = "/list.inquire?cpage=${cpage}";
	});

	$("#to_next").on("click", function () {
		if (${ code_list[2] == 0 }){
		alert("다음글이 없습니다.");
	}
		else {
		location.href = "/select.inquire?c=${code_list[2]}&cpage=${cpage}";
	}
	});
	</script>
</body>
</html>