<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="commons.XSSUtils" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>KickKick</title>
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
body{
	background: #f8f9fd;
}
div {
	padding: 10px;
	font-family: 'NanumSquareNeoBold';
	/* border:1px dotted pink; */
}
.container-fluid{
	padding:0;
	padding-right: calc(var(--bs-gutter-x) * .5);
    padding-left: calc(var(--bs-gutter-x) * .5);
}
.r_nickname{
	font-family: 'NanumSquareNeoExtraBold';
}
.reply_box{
	border-bottom: 1px solid #d2d4d6;
}
.r_update_box{
	border-bottom: 1px solid #d2d4d6;
}

.container {
	margin-top: 70px;
	/* border:1px solid #d2d4d6; */
}

.dropdown-toggle {
	height: 30px;
	background-color: #a7a7a7;
}

#title {
	font-family: 'NanumSquareNeoExtraBold';
}

.dropdown-menu>li {
	cursor: pointer;
}
.r_content{
	height:auto;
}
.reply_like{

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
				<h2>[${board.board_headline_name}] ${board.title}</h2>
			</div>
			<div class="col-12">${board.member_nickname}
				· ${board.calculated_date}<c:if test="${board.mod_date ne null}">(수정됨)</c:if> · 👀 ${board.view_count} · <span
					class="badge rounded-pill text-bg-success" id="like">👍🏻${board.like_count}</span>
			</div>
		</div>
		<div class="row body" style="border-bottom: 1px solid #d2d4d6;">
			<div class="col-12 pb-4" style="height: auto;min-height:500px;">${board.content}</div>
			<div class="col text-center">
				<c:if test="${sessionScope.code ne null and sessionScope.nickname ne board.member_nickname}">
				<button type="button" class="btn btn-primary" id="board_like">좋아요</button>
				<button type="button" class="btn btn-danger" id="to_report">신고</button>
				</c:if>
			</div>
			<c:if test="${sessionScope.nickname eq board.member_nickname}">
			<div class="col-12 gap-2 d-flex justify-content-end">
				<button type="button" class="btn btn-dark" id="to_update">수정</button>
				<button type="button" class="btn btn-secondary" id="delete">삭제</button>
			</div>
			</c:if>
		</div>
		<div class="row footer">
			<div>
				<b id="reply_count">댓글 ${reply_list.size()}개</b>
			</div>
			<div id="sample_box" style="display:none;">
			<div class="row reply_box">
						<input type="hidden" class="r_code" value="">
						<div class="col-12 d-flex justify-content-between p-0 info">
							<div class="col left d-block d-md-flex p-1">
								<div class="nickname p-0 align-self-center"
									style="margin-left: 5px">
									<b class="r_nickname"></b>
								</div>
								<div class="counts p-0 align-self-center"
									style="margin-left: 5px">
									<small><span class="r_date"></span>
									<span class="badge rounded-pill text-bg-success r_like">👍🏻${reply.like_count}</span></small>
								</div>
							</div>
							<div class="right d-flex p-0">
								<div class="p-0" style="margin-right: 5px">
									<button type="button" class="btn btn-secondary btn-sm reply_add"><small>답글달기</small></button>
								</div>
								<div class="p-0" style="margin-right: 5px">
								<button type="button" class="btn btn-primary btn-sm reply_like"><small>👍추천</small></button>
									
								</div>
								<div class="btn-group p-0">
									<button class="btn btn-secondary btn-sm dropdown-toggle"
										type="button" data-bs-toggle="dropdown" aria-expanded="false">
									</button>
									<ul class="dropdown-menu p-0">
										<li><small><a class="dropdown-item reply_update">수정</a></small></li>
										<li><small><a class="dropdown-item reply_delete">삭제</a></small></li>
										<li><small><a class="dropdown-item reply_report">신고하기</a></small></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-12 r_content"></div>
					</div>
					<div class="row r_update_box" style="display: none;">
						<input type="hidden" class="r_code" value="${reply.code}">
						<div class="col-12 d-flex justify-content-between p-0 info">
							<div class="col left d-block d-md-flex p-1">
								<div class="nickname p-0 align-self-center"
									style="margin-left: 5px">
									<b class="r_nickname">${reply.member_nickname}</b>
								</div>
							</div>
							<div class="right d-flex p-0">
								<div class="p-0" style="margin-right: 5px">
									<button type="button" class="btn btn-secondary r_update_cancel">취소</button>
								</div>
							</div>
						</div>
						<div class="row m-0" style="padding:10px 0px;">
							<div class="col-10" style="padding:0; padding-right:10px">
								<input type="text" class="form-control r_update_content" placeholder="댓글수정"
									value="${reply.content}">
							</div>
							<div class="col-2 d-grid gap-2 p-0">
								<button type="button" class="btn btn-primary r_update_btn">수정</button>
							</div>
						</div>
					</div>
					</div>
			<div class="col-12" id="replies_box">
				<c:forEach var="reply" items="${reply_list}">
					<div class="row reply_box">
						<input type="hidden" class="r_code" value="${reply.code}">
						<div class="col-12 d-flex justify-content-between p-0 info">
							<div class="col left d-block d-md-flex p-1">
								<div class="nickname p-0 align-self-center"
									style="margin-left: 5px">
									<b class="r_nickname">${reply.member_nickname}</b>
								</div>
								<div class="counts p-0 align-self-center"
									style="margin-left: 5px">
									<small><span class="r_date">${reply.calculated_date}</span>
										<c:if test="${reply.mod_date ne null}">(수정됨) · </c:if><span class="badge rounded-pill text-bg-success r_like">👍🏻${reply.like_count}</span></small>
								</div>
							</div>
							<c:if test="${sessionScope.code ne null}">
							<div class="right d-flex p-0">
								<div class="p-0" style="margin-right: 5px">
									<button type="button" class="btn btn-secondary btn-sm reply_add"><small>답글달기</small></button>
								</div>
								<div class="p-0" style="margin-right: 5px">
									<button type="button" class="btn btn-primary btn-sm reply_like"><small>👍추천</small></button>
								</div>
								<div class="btn-group p-0">
									<button class="btn btn-secondary btn-sm dropdown-toggle"
										type="button" data-bs-toggle="dropdown" aria-expanded="false">
									</button>
									<ul class="dropdown-menu p-0">
										<c:choose>
											<c:when test="${sessionScope.nickname eq reply.member_nickname}">
										<li><small><a class="dropdown-item reply_update">수정</a></small></li>
										<li><small><a class="dropdown-item reply_delete">삭제</a></small></li>
										</c:when>
										<c:otherwise>
										<li><small><a class="dropdown-item reply_report">신고하기</a></small></li>
										</c:otherwise>
										</c:choose>
									</ul>
								</div>
							</div>
							</c:if>
						</div>
						<div class="col-12 r_content">${XSSUtils.xssFilter(reply.content)}</div>
					</div>
					<div class="row r_update_box" style="display: none;">
						<input type="hidden" class="r_code" value="${reply.code}">
						<div class="col-12 d-flex justify-content-between p-0 info">
							<div class="col left d-block d-md-flex p-1">
								<div class="nickname p-0 align-self-center"
									style="margin-left: 5px">
									<b class="r_nickname">${reply.member_nickname}</b>
								</div>
							</div>
							<div class="right d-flex p-0">
								<div class="p-0" style="margin-right: 5px">
									<button type="button" class="btn btn-secondary r_update_cancel">취소</button>
								</div>
							</div>
						</div>
						<div class="row m-0" style="padding:10px 0px;">
							<div class="col-10" style="padding:0; padding-right:10px">
								<input type="text" class="form-control r_update_content" placeholder="댓글수정"
									value="${reply.content}">
							</div>
							<div class="col-2 d-grid gap-2 p-0">
								<button type="button" class="btn btn-primary r_update_btn">수정</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<c:if test="${sessionScope.code ne null}">
			<div class="col pt-0" style="border-bottom: 1px solid #d2d4d6;">
				<div class="row">
					<div class="col-9" style="padding:0; padding-right:10px">
						<input type="text" class="form-control mr-2" placeholder="댓글입력"
							id="input_reply">
					</div>
					<div class="col-3 d-grid gap-2 p-0">
						<button type="button" class="btn btn-primary" id="reply_submit">등록</button>
					</div>
				</div>
			</div>
			</c:if>
			<div class="col-12 p-4 gap-2 d-flex justify-content-center">
				<button type="button" class="btn btn-primary" id="to_prev">◁이전글</button>
				<button type="button" class="btn btn-primary" id="to_list">목록으로</button>
				<button type="button" class="btn btn-primary" id="to_next">다음글▷</button>
			</div>
		</div>
	</div>

	<script>
				$("#to_prev").on("click", function () {
					if (${ code_list[1] == 0 }){
					alert("이전글이 없습니다.");
				}
    				else {
					location.href = "/select_post.board?b_c=${b_c}&c=${code_list[1]}&cpage=${cpage}";
				}
    			});

				$("#to_list").on("click", function () {
					location.href = "/list.board?b_c=${b_c}&cpage=${cpage}";
				});

				$("#to_next").on("click", function () {
					if (${ code_list[2] == 0 }){
					alert("다음글이 없습니다.");
				}
        			else {
					location.href = "/select_post.board?b_c=${b_c}&c=${code_list[2]}&cpage=${cpage}";
				}
        		});

				$("#to_update").on("click", function () {
					location.href = "/to_update_form.board?b_c=${b_c}&code=${board.code}&cpage=${cpage}";
				});

				$("#delete").on("click", function () {
					if (confirm("해당 글을 삭제하시겠습니까?")) {
						location.href = "/delete.board?b_c=${b_c}&code=${board.code}"
					}
				});

				function calculateTime(reg_date) {
					const SEC = 60;
					const MIN = 60;
					const HOUR = 24;
					const DAY = 30;
					const MONTH = 12;

					let curTime = new Date();
					let writeTime = new Date(reg_date);
					let diffTime = (curTime - writeTime) / 1000;

					let msg = null;
					if (diffTime < SEC) {
						// sec
						msg = Math.ceil(diffTime) + "초전";
					}
					else if ((diffTime /= SEC) < MIN) {
						// min
						msg = Math.ceil(diffTime) + "분전";
					}
					else if ((diffTime /= MIN) < HOUR) {
						// hour
						msg = Math.ceil(diffTime) + "시간전";
					}
					//				    else if ((diffTime /= HOUR) < DAY) {
					//				        // day
					//				        msg = (diffTime ) + "일전";
					//				    } else if ((diffTime /= DAY) < MONTH) {
					//				        // day
					//				        msg = (diffTime ) + "달전";
					//				    } 
					else {
						msg = (writeTime.getFullYear() - 2000) + "/" + (writeTime.getMonth() + 1) + "/" + (writeTime.getDate());
					}
					return msg;
				};

				function ConvertSystemSourcetoHtml(str){
					 str = str.replace(/</g,"&lt;");
					 str = str.replace(/>/g,"&gt;");
					 str = str.replace(/\"/g,"&quot;");
					 str = str.replace(/\'/g,"&#39;");
					 str = str.replace(/\n/g,"<br />");
					 return str;
					}
				
				$("#reply_submit").on("click", function () {
					if ($("#input_reply").val().trim() == "") {
						alert("내용을 입력해주세요.");
					}
					else {
						
						$.ajax({
							url: "/insert.reply",
							type: "post",
							dataType: "html",
							data: {
								b_c: ${ b_c },
								code: ${ board.code },
								content: $("#input_reply").val(),
							},
				}).done(function (resp) {
					resp = JSON.parse(resp);
					console.log(resp);
					$("#input_reply").val("");
					$("#reply_count").text("댓글 " + resp.length + "개");
					$("#replies_box").html("");
					for (let i = 0; i < resp.length; i++) {
						let reply_box = $("#sample_box").children().clone();
						$("#replies_box").append(reply_box);
						reply_box.find(".r_code").val(resp[i].code);
						reply_box.find(".r_nickname").text(resp[i].member_nickname);
						reply_box.find(".r_date").text(calculateTime(resp[i].reg_date));
						if(resp[i].mod_date){
							reply_box.find(".r_date").append("(수정됨) · ");
						};
						reply_box.find(".r_like").text("👍🏻" + resp[i].like_count);
						if(${sessionScope.code eq null}){
							$(".right").last().remove();
						}
						else{
							let session_nickname = "${sessionScope.nickname}";
							let nickname = resp[i].member_nickname;
							if(session_nickname==nickname){
								$(".reply_report").last().remove();
							}
							else{
								$(".reply_update").last().remove();
								$(".reply_delete").last().remove();
							}
						};
						var content = resp[i].content;
						content = ConvertSystemSourcetoHtml(content);
						reply_box.find(".r_content").html(content);
					}
				});	
			};
		});

				$("#replies_box").on("click", ".reply_delete", function () {
					let reply_box = $(this).closest(".reply_box");
					let update_box = $(this).closest(".reply_box").next(".r_update_box");
					console.log(reply_box);
					console.log(update_box);
					if (confirm("해당 댓글을 삭제하시겠습니까?")) {
						let r_code = $(this).closest(".reply_box").find(".r_code").val();
						$.ajax({
							url: "/delete.reply",
							type: "post",
							dataType: "json",
							data: {
								b_c: ${ b_c },
							code: r_code,
							board_code: ${ board.code },
							cpage: ${ cpage }
							},
				}).done(function (resp) {
					$("#reply_count").text("댓글 " + resp + "개");
					update_box.remove();
					reply_box.remove();
				});
					}
				});

				$("#replies_box").on("click", ".reply_update", function () {
					let content = $(this).closest(".reply_box").find(".r_content").html();
					$(this).closest(".reply_box").css("display", "none");
					$(this).closest(".reply_box").next(".r_update_box").css("display", "block");
					$(this).closest(".reply_box").next(".r_update_box").find(".r_update_content").val(content);
					
				});

				$("#replies_box").on("click", ".r_update_cancel", function () {
					$(this).closest(".r_update_box").prev(".reply_box").css("display", "block");
					$(this).closest(".r_update_box").css("display", "none");
				});

				$("#replies_box").on("click", ".r_update_btn", function () {
					let r_code = $(this).closest(".r_update_box").prev(".reply_box").find(".r_code").val();
					let r_content = $(this).closest(".r_update_box").find(".r_update_content").val();
					let reply_box = $(this).closest(".r_update_box").prev(".reply_box");
					let update_box = $(this).closest(".r_update_box");
					$.ajax({
						url: "/update.reply",
						type:"post",
						dataType:"json",
						data:{
							b_c:${b_c},
							code:r_code,
							content:r_content,
							board_code: ${board.code},
							cpage: ${cpage}
						},
					}).done(function (resp) {
						if(resp==1){
						reply_box.css("display", "block");
						reply_box.find(".r_content").html(r_content);
						reply_box.find(".r_date").append("(수정됨) · ");
						update_box.css("display", "none");
						}
					});
				});
				
				$("#to_report").on("click",function(){
					window.open("/to_report_form.report?b_c=${b_c}&board_code=${board.code}","","width=500px,height=750px");
				});
				$("#replies_box").on("click", ".reply_report", function () {
					let r_code = $(this).closest(".reply_box").find(".r_code").val();
					window.open("/to_report_form.report?b_c=${b_c}&reply_code="+r_code,"","width=500px,height=750px");
				});
				
				$("#board_like").on("click",function(){
					$.ajax({
						url:"/like.board",
						type:"post",
						data:{
							b_c:${b_c},
							code:${board.code},
						},
						dataType:"json",
					}).done(function(resp){
						$("#like").text("👍🏻"+resp);
					});
				});
				
				$("#replies_box").on("click", ".reply_like", function () {
					let reply_code = $(this).closest(".reply_box").find(".r_code").val();
					let like_box = $(this).closest(".reply_box").find(".r_like");
					$.ajax({
						url:"/like.reply",
						type:"post",
						data:{
							b_c:${b_c},
							code:reply_code,
						},
						dataType:"json",
					}).done(function(resp){
						like_box.text("👍🏻"+resp);
					})
				});
				
				$("#replies_box").on("click", ".reply_add", function () {
					alert("미구현 기능입니다.");
				});
			</script>
</body>

</html>