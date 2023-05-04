<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
				crossorigin="anonymous">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
				crossorigin="anonymous"></script>
			<script src="http://code.jquery.com/jquery-latest.min.js"></script>
			<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">


			<style>
				div {
					padding: 10px;
					font-family: 'NanumSquareNeoBold';
					box-sizing: border-box;
				}

				.container {
					padding: 0;
					overflow-x: hidden;
				}

				#content_box {
					display: flex;
					overflow: hidden;
				}

				#content {
					display: block;
					white-space: nowrap;
					overflow: hidden;
					text-overflow: ellipsis;
				}
			</style>
		</head>

		<body>


			<div class="container">
				<form>
					<div class="row header" style="border-bottom:1px solid #d2d4d6">
						<div class="col-12 text-center" id="title">
							<h2 style="font-family: 'NanumSquareNeoExtraBold';">신고하기</h2>
						</div>
					</div>
					<div class="row body" style="border-bottom:1px solid #d2d4d6">

						<div class="col-12 target_box">
							<h4>신고 대상</h4>
							<div class="row contents_box p-0 m-1" style="border:1px solid #d2d4d6">
								<input type="hidden" value="${target.code}" name="target_code">
								<div class="col-12">작성자 : ${target.member_nickname}</div>
								<div class="col-12" id="content_box">내용 : <span style="padding-left:5px;" id="content">${target.content}</span></div>
							</div>
						</div>
						<div class="col-12 reason_box">
							<h4>신고 사유</h4>
							<ul class="list-group">
								<li class="list-group-item">
									<input class="form-check-input me-1" type="radio" name="listGroupRadio" value=""
										id="firstRadio" checked>
									<label class="form-check-label" for="firstRadio">스팸홍보/도배글입니다.</label>
								</li>
								<li class="list-group-item">
									<input class="form-check-input me-1" type="radio" name="listGroupRadio" value=""
										id="secondRadio">
									<label class="form-check-label" for="secondRadio">불법정보를 포함하고 있습니다.</label>
								</li>
								<li class="list-group-item">
									<input class="form-check-input me-1" type="radio" name="listGroupRadio" value=""
										id="thirdRadio">
									<label class="form-check-label" for="thirdRadio">음란물입니다.</label>
								</li>
								<li class="list-group-item">
									<input class="form-check-input me-1" type="radio" name="listGroupRadio" value=""
										id="thirdRadio">
									<label class="form-check-label" for="thirdRadio">불쾌한 표현이 있습니다.</label>
								</li>
								<li class="list-group-item">
									<input class="form-check-input me-1" type="radio" name="listGroupRadio" value=""
										id="thirdRadio">
									<label class="form-check-label" for="thirdRadio">기타</label>
									<input type="text" name="reason_etc" placeholder="신고사유를 입력해주세요">
								</li>
							</ul>
						</div>
					</div>
					<div class="row footer">
						<div class="col-6 d-grid">
							<button type="submit" class="btn btn-primary" id="report">신고</button>
						</div>
						<div class="col-6 d-grid">
							<button type="button" class="btn btn-secondary" id="cancel">취소</button>
						</div>
					</div>

				</form>
			</div>
		</body>

		</html>