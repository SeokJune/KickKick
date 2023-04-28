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
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
    <style>
        div {
            border: 1px solid black;
            padding: 10px;
            font-family: 'NanumSquareNeoBold';
        }
        .dropdown-toggle{
        	height:30px;
        	background-color:#a7a7a7;
        }
        #title{
        	font-family: 'NanumSquareNeoExtraBold';
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row header">
            <div class="col-12" id="title">
                <h2>[${board.board_headline_name}] ${board.title}</h2>
            </div>
            <div class="col-12">${board.member_nickname} · ${board.calculated_date} · 👀 ${board.view_count} · <span class="badge rounded-pill text-bg-success">👍🏻${board.like_count}</span></div>
        </div>
        <div class="row body">
            <div class="col-12" style="height: 500px;">${board.content}</div>
            <div class="col text-center">
                <button type="button" class="btn btn-primary">좋아요</button>
                <button type="button" class="btn btn-danger">신고</button>
            </div>
            <div class="col-12 gap-2 d-flex justify-content-end">
                <button type="button" class="btn btn-dark">수정</button>
                <button type="button" class="btn btn-secondary">삭제</button>
            </div>
        </div>
        <div class="row footer">
            <div class="col-12">
                <p><b>댓글 ${reply_list.size()}개</b></p>
                
                <c:forEach var="reply" items="${reply_list}">
                <div class="row">
                	<div class="col-12 d-flex justify-content-between p-0 info">
                		<div class="col left d-block d-md-flex p-1">
                			<div class="nickname p-0 align-self-center" style="margin-left:5px"><b>${reply.member_nickname}</b></div>
                			<div class="counts p-0 align-self-center" style="margin-left:5px"><small>${reply.calculated_date} · <span class="badge rounded-pill text-bg-success">👍🏻${reply.like_count}</span></small></div>
                		</div>
                		<div class="right d-flex p-0">
                			<div class="p-0" style="margin-right:5px"><small>답글달기</small></div>
                			<div class="p-0" style="margin-right:5px"><small>👍추천</small></div>
                			<div class="btn-group p-0">
                            <button class="btn btn-secondary btn-sm dropdown-toggle" type="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                
                            </button>
                            <ul class="dropdown-menu p-0">
                                <li><small><a class="dropdown-item" href="#">신고하기</a></small></li>
                                <li><small><a class="dropdown-item" href="#">수정</a></small></li>
                                <li><small><a class="dropdown-item" href="#">삭제</a></small></li>
                            </ul>
                        	</div>
                		</div>
                 	</div>
                    <div class="col-12">${reply.content}</div>
                </div>
                </c:forEach>
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
                <button type="button" class="btn btn-primary" id="to_prev">◁이전글</button>
                <button type="button" class="btn btn-primary" id="to_list">목록으로</button>
                <button type="button" class="btn btn-primary" id="to_next">다음글▷</button>
            </div>
        </div>
    </div>
    
    <script>
    	$("#to_prev").on("click",function(){
    		//location.href="/select_post.board?b_c=${b_c}&c=${board.code-1}&cpage=${cpage}";
    	});
    	$("#to_list").on("click",function(){
    		location.href="/list.board?b_c=${b_c}&cpage=${cpage}";
    	});
    	$("#to_next").on("click",function(){
    		//location.href="/select_post.board?b_c=${b_c}&c=${board.code+1}&cpage=${cpage}";
    	});
    </script>
</body>
</html>