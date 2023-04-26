<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post View</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
        div {
            border: 1px solid black;
            padding: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row header">
            <div class="col-12">
                <h2>[말머리] 제목</h2>
            </div>
            <div class="col-12">아이디 작성일 조회수 추천수</div>
        </div>
        <div class="row body">
            <div class="col-12" style="height: 500px;">글내용</div>
            <div class="col text-center">
                <button type="button" class="btn btn-primary">좋아요</button>
                <button type="button" class="btn btn-danger">신고</button>
            </div>
            <div class="col-12 gap-2 d-md-flex justify-content-md-end">
                <button type="button" class="btn btn-dark">수정</button>
                <button type="button" class="btn btn-secondary">삭제</button>
            </div>
        </div>
        <div class="row footer">
            <div class="col-12">
                <p>댓글수</p>
                <div class="row">
                    <div class="col-10">아이디 작성일 추천수</div>
                    <div class="col-2 d-grid d-md-flex justify-content-md-end">
                        <div class="btn-group p-0">
                            <button class="btn btn-secondary btn-sm dropdown-toggle" type="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                .
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">신고하기</a></li>
                                <li><a class="dropdown-item" href="#">수정</a></li>
                                <li><a class="dropdown-item" href="#">삭제</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col">댓글내용</div>
                </div>
                <div class="row">
                    <div class="col-9">
                        <input type="text" class="form-control" placeholder="댓글입력">
                    </div>
                    <div class="col-3 d-grid gap-2">
                        <button type="button" class="btn btn-primary">등록</button>
                    </div>
                </div>
            </div>
            <div class="col-12 gap-2 d-flex justify-content-center">
                <button type="button" class="btn btn-primary">◁이전글</button>
                <button type="button" class="btn btn-primary">목록으로</button>
                <button type="button" class="btn btn-primary">다음글▷</button>
            </div>
        </div>
    </div>
</body>
</html>