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
</style>
</head>
<body>

	<c:import url="/commons/gnb.jsp">
	</c:import>
	
	<div class="container">
		<div class="row header" style="border-bottom: 1px solid #d2d4d6;">
			<div class="col-12" id="title">
				<h2>문의하기</h2>
			</div>
			<div class="col-12">
				문의, 건의, 버그 제보를 위한 게시판입니다.
			</div>
			<div class="form-check form-switch d-flex justify-content-end pt-0">
  				<input class="form-check-input float-right mx-2" type="checkbox" role="switch" id="flexSwitchCheckDefault">
  				<label class="form-check-label" for="flexSwitchCheckDefault">처리완료된 글 숨기기</label>
			</div>
			<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
  				<input type="radio" class="btn-check" name="report_kind" id="btnradio1" autocomplete="off" value="1007">
  				<label class="btn btn-outline-primary" for="btnradio1">문의</label>

  				<input type="radio" class="btn-check" name="report_kind" id="btnradio2" autocomplete="off" value="1008">
  				<label class="btn btn-outline-primary" for="btnradio2">건의</label>

  				<input type="radio" class="btn-check" name="report_kind" id="btnradio3" autocomplete="off" value="1009">
  				<label class="btn btn-outline-primary" for="btnradio3">버그제보</label>
			</div>
		</div>
		<div class="row body" style="border-bottom: 1px solid #d2d4d6;">
			<div class="list-group" style="border-radius: 0;">
				<a href="/select.inquire?c=&cpage=" class="inquire list-group-item list-group-item-action list-group-item-primary p-0">
					<input type="hidden" class="code" value="">
					<div class="col-12">
						<div class="col title_box pb-0">
							<span class="status">[공지사항]</span><span class="report_kind">문의와 관련된 공지사항?</span>
							<span class="nickname" style="font-size: small;">작성자</span> · <span class="date" style="font-size: small;">작성일</span>
						</div>
						<div class="col content pt-0">샘플 공지 내용 ㄱㄴㄷㄹㅁㅂㅅㅇㅈㅊㅋㅌㅍㅎㅏㅑㅓㅕㅗㅛㅜㅠㅡㅣ</div>
					</div>
				</a>
				<c:forEach var="inquire" items="${list}">
					<a href="/select.inquire?c=${inquire.code}&cpage=${cpage}" class="inquire list-group-item list-group-item-action p-0">
						<input type="hidden" class="code" value="${inquire.code}">
						<div class="col-12">
						<div class="col title_box pb-0">
							<span class="status">[${inquire.status_name}] </span><span class="inquire_kind"> ${inquire.report_kind_name}</span>
							<span class="nickname" style="font-size: small;">${inquire.member_nickname}</span> · <span class="date" style="font-size: small;">${inquire.calculated_date}</span>
						</div>
						<div class="col content pt-0">${inquire.content}</div>
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
			<form class="d-flex p-0" action="/list.inquire" method="post">
				<div class="col-3">
					<input type="hidden" name="cpage" value="1"> <input
						type="hidden" name="b_c" value="${b_c}"> <select
						class="form-select search_option" aria-label=".form-select-sm example"
						name="search_option">
						<option value="content">내용</option>
						<option value="nickname">작성자</option>
					</select>
				</div>
				<div class="col-7">
					<input type="text" class="form-control search_word" placeholder=""
						aria-label="Username" aria-describedby="basic-addon1"
						name="search_word">
				</div>
				<div class="col-2 d-grid">
					<button type="submit" class="btn btn-secondary">검색</button>
				</div>
			</form>
		</div>
		<c:if test="${sessionScope.code ne null}">
			<div class="col-12 d-grid justify-content-end">
				<a class="btn btn-primary"
					href="/to_write_form.inquire?b_c=1005&cpage=${cpage}" role="button">글쓰기</a>
			</div>
		</c:if>
		</div>
	</div>
</body>
</html>