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
<style>
div {
	border: 1px solid black;
	padding: 10px;
	box-sizing: border-box;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row header">
			<div class="col-12">
				<h2>공지사항</h2>
			</div>
			<div class="col-12">전체 공지사항 게시판입니다</div>
		</div>
		<div class="row body">
			<div class="list-group" style="border-radius: 0;">
				<a href="/board/board_view.jsp"
					class="list-group-item list-group-item-action list-group-item-primary">
					<div class="col-12">
						<div class="col">
							[말머리] 필독 공지사항 <span class="badge rounded-pill text-bg-light">💬댓글수</span>
						</div>
						<div class="col" style="font-size: small;">
							아이디 작성일 조회수 <span class="badge rounded-pill text-bg-success">👍🏻추천수</span>
						</div>
					</div>
				</a> <a href="#" class="list-group-item list-group-item-action">
					<div class="col-12">
						<div class="col">
							[말머리] 제목 <span class="badge rounded-pill text-bg-light">💬댓글수</span>
						</div>
						<div class="col" style="font-size: small;">
							아이디 작성일 조회수 <span class="badge rounded-pill text-bg-success">👍🏻추천수</span>
						</div>
					</div>
				</a>
			</div>
			<div class="col-12">
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm justify-content-center">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<div class="row footer">
			<form action="/search.board" method="get">
				<div class="col-3">
					<select class="form-select" aria-label=".form-select-sm example">
						<option value="1" selected>제목</option>
						<option value="2">내용</option>
						<option value="3">작성자</option>
					</select>
				</div>
				<div class="col-7">
					<input type="text" class="form-control" placeholder=""
						aria-label="Username" aria-describedby="basic-addon1">
				</div>
				<div class="col-2 d-grid">
					<button type="button" class="btn btn-secondary">검색</button>
				</div>
			</form>
		</div>
		<div class="col-12 d-grid justify-content-end">
			<a class="btn btn-primary" href="/board/board_write.jsp"
				role="button">글쓰기</a>
		</div>
	</div>
	</div>
</body>
</html>