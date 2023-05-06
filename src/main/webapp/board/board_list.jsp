<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<!-- awesome font -icon--->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Bootstrap - icon -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
	rel="stylesheet">
<style>
div {
	/* border: 1px solid black; */
	padding: 10px;
	box-sizing: border-box;
	font-family: 'NanumSquareNeoBold';
}

.container {
	padding-top: 70px;
}

.container-fluid {
	padding-top:0px;
}

.list-group {
	padding: 10px;
}

#title {
	font-family: 'NanumSquareNeoExtraBold';
}

.title_box {
	font-family: 'NanumSquareNeoExtraBold';
	display: flex;
	overflow: hidden;
}

.title {
	display: block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
<!-- gbn css -->
<link href="/commons/css/gnb.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/commons/gnb.jsp">
	</c:import>

	<div class="container">
		<div class="row header" style="border-bottom: 1px solid #d2d4d6;">
			<div class="col-12" id="title">
				<h2>${board_kind_name}</h2>
			</div>
			<div class="col-12">
				<c:choose>
					<c:when test="${board_kind_name=='공지사항'}">
						전체 공지사항 게시판 입니다
					</c:when>
					<c:otherwise>
						게시판 설명글을 적어주세요
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="row body" style="border-bottom: 1px solid #d2d4d6;">
			<div class="list-group" style="border-radius: 0;">
				<a href="#"
					class="list-group-item list-group-item-action list-group-item-primary p-0">
					<div class="col-12">
						<div class="col title_box">
							<span class="title"><b>[말머리]</b>필독 제목 공지사항 샘플</span> <span
								class="badge rounded-pill text-bg-light align-self-center p-1">💬댓글수</span>
						</div>
						<div class="col" style="font-size: small;">
							작성자 · 작성일 · 조회수 · <span
								class="badge rounded-pill text-bg-success">👍🏻추천수</span>
						</div>
					</div>
				</a>
				<c:forEach var="post" items="${list}">
					<a
						href="/select_post.board?b_c=${b_c}&c=${post.code}&cpage=${cpage}"
						class="list-group-item list-group-item-action p-0">
						<div class="col-12">
							<div class="col title_box">
								<span class="title"><b>[${post.board_headline_name}]
								</b> ${post.title}</span> <span
									class="badge rounded-pill text-bg-light align-self-center p-1">💬${post.reply_count}</span>
							</div>
							<div class="col" style="font-size: small;">
								${post.member_nickname} · ${post.calculated_date} · 👀
								${post.view_count} · <span
									class="badge rounded-pill text-bg-success">👍🏻${post.like_count}</span>
							</div>
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
			<form class="d-flex p-0" action="/list.board" method="post">
				<div class="col-3">
					<input type="hidden" name="cpage" value="1"> <input
						type="hidden" name="b_c" value="${b_c}"> <select
						class="form-select search_option" aria-label=".form-select-sm example"
						name="search_option">
						<option value="title" selected>제목</option>
						<option value="content">내용</option>
						<option value="member_nickname">작성자</option>
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
					href="/to_write_form.board?b_n=${board_kind_name}" role="button">글쓰기</a>
			</div>
		</c:if>
	</div>
	<script type="text/javascript">
	window.onload = function(){
		$(".search_option").val("${search_option}").prop("selected",true);
		$(".search_word").val("${search_word}");
	};
	</script>
</body>
</html>