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
<script src="/ckeditor5/build/ckeditor.js"></script>
<style>
        .ck-editor__editable {
            min-height: 400px;
        }
    </style>
</head>
<body>
    <div class="container">
    	<form class="row g-3" action="/insert.board" method="post">
        <div class="row header">
            <div class="col-12" style="padding-top:50px">
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
            <div class="col-12 col-md-8 p-1 p-md-2" style="padding-top:0">
                <select class="form-select" aria-label="Default select example" name="board" id="board" onchange="boardKindChange(this)">
                    <option value="default" selected>게시판 선택</option> 
                     <c:forEach var="board" items="${board_list}">
                     	<option value="${board}">${board}</option>
                     </c:forEach>                    
                </select>
            </div>
            <div class="col-12 col-md-4 p-1 p-md-2" style="padding-top:0">
                <select class="form-select" aria-label="Default select example" name="headline" id="headline" disabled>
                     <option value="headline" selected>카테고리 선택</option> 
                </select>
            </div>
            <div class="col-12 p-2">
                <input type="text" placeholder="제목" style="width:100%" name="title">
            </div>
            <div class="col-12 p-2">
                <textarea id="editor" name="content"></textarea>
            </div>
        </div>
        <div class="row footer p-2">
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
    	<c:forEach var="board" items="${board_list}">
    		var ${board} = [];
    			<c:forEach var="head" items="${headline_list}">
    				<c:if test="${head.board_name==board}">
    					${board}.push("${head.name}");
    				</c:if>
    			</c:forEach>
    	</c:forEach>

        var target = document.getElementById("headline");

        $("#headline").attr("disabled",false);
        if(e.value=="default") {$("#headline").attr("disabled",true);var d=["카테고리 선택"]}
        <c:forEach var="board" items="${board_list}">
        else if(e.value=="${board}") var d = ${board};
        </c:forEach>


        target.options.length = 0;

        for(x in d){
            var opt = document.createElement("option");
            opt.value = d[x];
            opt.innerHTML = d[x];
            target.appendChild(opt);
        }
    };
    
    ClassicEditor
    	.create(document.querySelector('#editor'), {
        	language: 'ko'
    	})
    	.catch(error => {
        	console.error(error);
    	});
    
    $("#cancel").on("click",function(){
    	history.back();
    });
      </script>
</body>
</html>