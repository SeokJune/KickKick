<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Post Writing</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<style>
        div {
            /* border: 1px solid black; */
            padding: 10px;
        }
    </style>
    <script>
        tinymce.init({
            language: "ko_KR", //한글판으로 변경
            selector: '#editor',
            height: 500,
            // menubar: false,
        });

    </script>
</head>
<body>
    <div class="container">
    	<form class="row g-3" action="/insert.board" method="post">
        <div class="row header">
            <div class="col-12">
                <h2>글쓰기</h2>
            </div>
<!--        <div class="col-12" style="text-align: right; padding-bottom: 0;">
                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                <label class="form-check-label" for="flexCheckDefault">
                    비밀글 쓰기
                </label>
            </div> -->
        </div>
        <div class="row body">
            <div class="col-12 col-md-8" style="padding-top:0">
                <select class="form-select" aria-label="Default select example" name="board" id="board" onchange="boardKindChange(this)">
                    <option value="default" selected>게시판 선택</option> 
                     <option value="공지사항">공지사항</option>
                    <option value="자유게시판">자유게시판</option>
                     <option value="홍보게시판">홍보게시판</option> 
                    <option value="문의하기">문의하기</option>
                </select>
            </div>
            <div class="col-12 col-md-4" style="padding-top:0">
                <select class="form-select" aria-label="Default select example" name="headline" id="headline" disabled>
                     <option value="headline" selected>카테고리 선택</option> 
                </select>
            </div>
            <div class="col-12">
                <input type="text" placeholder="제목" style="width:100%" name="title">
            </div>
            <div class="col-12">
                <textarea id="editor" name="content"></textarea>
            </div>
        </div>
        <div class="row footer">
            <div class="col-6 d-grid">
                <button type="submit" class="btn btn-primary" id="post">등록</button>
            </div>
            <div class="col-6 d-grid">
                <button type="button" class="btn btn-secondary" id="cancel">취소</button>
            </div>
        </div>
        </form>
    </div>

    <script>
    function boardKindChange(e){
        var announcement = ["공지"];
        var free = ["축구","일상","정보"];
        var promotion = ["홍보"];
        var inquire = ["문의","건의","버그제보"];
        var target = document.getElementById("headline");

        $("#headline").attr("disabled",false);
        if(e.value=="default") {$("#headline").attr("disabled",true);var d=["카테고리 선택"]}
        else if(e.value=="공지사항") var d = announcement;
        else if(e.value=="자유게시판") var d = free;
        else if(e.value=="홍보게시판") var d = promotion;
        else if(e.value=="문의하기") var d = inquire;

        target.options.length = 0;

        for(x in d){
            var opt = document.createElement("option");
            opt.value = d[x];
            opt.innerHTML = d[x];
            target.appendChild(opt);
        }
    };
    
    $("#cancel").on("click",function(){
    	history.back();
    });
      </script>
</body>
</html>