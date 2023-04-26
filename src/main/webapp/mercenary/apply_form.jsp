<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplyForm</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
div {
	border: 1px solid black;
}

.header>div {
	float: left;
}

.box>div {
	float: left;
}
</style>
</head>
<body>
	<div class="container fluid">

        <div class="row header">
            <div class="col-xs-12 col-md-4 col-xl-4 text-center">
                <div>logo.img</div>
            </div>
            <div class="col-xs-12 col-md-8 col-xl-8">
                <div>팀명 <input type="text" placeholder="팀명"></div>
                <div class="box">
                    <div class="col-12 col-md-6 col-xl-6">팀장 <input type="text" placeholder="팀장명"></div>
                    <div class="col-12 col-md-6 col-xl-6">연락처 <input type="text" placeholder="연락처"></div>
                </div>
            </div>
        </div>
        <br>
        <div class="row body1">
            <div class="col-12 col-md-12 col-xl-12">상대팀 <input type="text" placeholder="상대팀"></div>
            <div class="box">
                <div class="col-12 col-md-6 col-xl-4">날짜 <input type="text" placeholder="날짜"></div>
                <div class="col-12 col-md-6 col-xl-6">시간 <input type="text" placeholder="시간"></div>
            </div>
        </div>
        <br>
        <div class="row body2">
            <div class="col-12 col-md-12 col-xl-12">
                실력 <select class="form-select" aria-label="Default select example" name="ability">
                    <option value="" selected>-- 선택해주세요 --</option>
                    <option value="good">상</option>
                    <option value="fair">중</option>
                    <option value="poor">하</option>
            </select>
            </div>
        </div>
        <br>
        <div class="row body3">
            <div class="col-12 col-md-12 col-xl-12">
                <textarea class="form-control" name="contents" id="contents" placeholder="간단한 소개를 적어주세요."></textarea>
            </div>
        </div>
        <br>
        <div class="footer">
            <div class="col-xl-12 col-md-12 col-xs-12 text-center">
                <a><input type="button" value="신청"></a>
                <a href="용병 등록 리스트로"><input type="button" value="취소"></a>
            </div>
        </div>
    </div>
</body>
</html>