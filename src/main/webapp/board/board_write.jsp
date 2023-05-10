<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="/ckeditor5/editor/ckeditor.js"></script>

<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<!-- awesome font -icon--->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Bootstrap - icon -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
   rel="stylesheet">
<style>
body{
	background: #f8f9fd;
}
div {
	font-family: 'NanumSquareNeoBold';
}
.container-fluid{
	padding:0;
	padding-right: calc(var(--bs-gutter-x) * .5);
    padding-left: calc(var(--bs-gutter-x) * .5);
}

.container {
	padding-top: 70px;
}

.ck-editor__editable {
	min-height: 400px;
}

#count_message {
	background-color: smoke;
	margin-top: -20px;
	margin-right: 5px;
}

</style>
<!-- gbn css -->
<link href="/commons/css/gnb.css" rel="stylesheet" type="text/css">
</head>

<body>
	<c:import url="/commons/gnb.jsp">
	</c:import>

	<div class="container">
		<form class="row g-3" action="/insert.board" method="post" id="formID">
			<div class="row header">
				<div class="col-12" style="padding-top: 50px">
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
				<div class="col-12 col-md-8 p-1 p-md-2" style="padding-top: 0">
					<select class="form-select" aria-label="Default select example"
						name="board" id="board" onchange="boardKindChange(this)" required>
						<option value="" selected>게시판 선택</option>
						<c:forEach var="board" items="${board_list}">
							<option value="${board}">${board}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-12 col-md-4 p-1 p-md-2" style="padding-top: 0">
					<select class="form-select" aria-label="Default select example"
						name="headline" id="headline" disabled required>
						<option value="" selected>카테고리 선택</option>
					</select>
				</div>
				<div class="col-12 p-2">
					<input type="text" placeholder="제목" style="width: 100%"
						name="title" required id="title">
				</div>
				<div class="col-12 p-2" id="editorBox">
					<textarea id="editor" name="content" placeholder="1300자 이내로 작성해주세요"></textarea>
				</div>
				<div>
					<strong id="word_count"></strong> <small id="limit_check"></small>
				</div>

			</div>
			<div class="row footer p-3 pb-5">
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
				window.onload = function(){
					
					$("#board").val("${board_kind_name}").prop("selected",true);
					
					<c:forEach var="board" items="${board_list}">
					var ${board} = [];
					<c:forEach var="head" items="${headline_list}">
						<c:if test="${head.board_name==board}">
							${board}.push("${head.name}");
						</c:if>
					</c:forEach>
				</c:forEach>

				var target = document.getElementById("headline");

				$("#headline").attr("disabled", false);
				if ($("#board").val() == "default") { $("#headline").attr("disabled", true); var d = ["카테고리 선택"] }
				<c:forEach var="board" items="${board_list}">
					else if($("#board").val()=="${board}") var d = ${board};
				</c:forEach>

				target.options.length = 0;

				for (x in d) {
					var opt = document.createElement("option");
					opt.value = d[x];
					opt.innerHTML = d[x];
					target.appendChild(opt);
				}
				
				};
			
				function boardKindChange(e) {
					//board이름 = [headline]이 담긴 배열 생성
					<c:forEach var="board" items="${board_list}">
						var ${board} = [];
						<c:forEach var="head" items="${headline_list}">
							<c:if test="${head.board_name==board}">
								${board}.push("${head.name}");
							</c:if>
						</c:forEach>
					</c:forEach>

					var target = document.getElementById("headline");

					$("#headline").attr("disabled", false);
					if (e.value == "default") { $("#headline").attr("disabled", true); var d = ["카테고리 선택"] }
					<c:forEach var="board" items="${board_list}">
						else if(e.value=="${board}") var d = ${board};
					</c:forEach>


					target.options.length = 0;

					for (x in d) {
						var opt = document.createElement("option");
						opt.value = d[x];
						opt.innerHTML = d[x];
						target.appendChild(opt);
					}
					
				};

				
				//max 4000하고 한글은 3글자씩 세고싶은데 설정 모르겠음
				const maxCharacters = 1300;
				const container = document.querySelector( '#editor' );
				const charactersBox = document.querySelector( '#word_count' );
				const sendButton = document.querySelector('#post');
				
        //에디터 설정
		
				ClassicEditor
					.create(document.querySelector('#editor'), {
						language: 'ko',
						wordCount: {
							 displayWords:false,
							 displayCharacters:false,
					            onUpdate: stats => {
					            	charactersBox.textContent = stats.characters + ' / ' + maxCharacters;
					                const isLimitExceeded = stats.characters > maxCharacters;
									const msg = "1300자 이내로 입력해 주세요";
									// 글자수 제한을 넘기면 등록버튼을 누를 수 없음
									$("#limit_check").html("");
									sendButton.toggleAttribute( 'disabled', isLimitExceeded );
					                // 글자수 제한 넘어가면 입력도 안되게 하고싶은데 방법을 잘 모르겠음.. 작동안함
					                if ( isLimitExceeded ) {
										// stats.textContent = stats.textContent.slice(0, maxCharacters);
										$("#limit_check").html(msg).css("color","red");
									}
					            }
					    },
						simpleUpload: {
                    		uploadUrl: "http://localhost/to_write_form.board",
                    		withCredentials: true,
                        	headers: {
                          		'X-CSRF-TOKEN': 'CSRF-Token',
                          		Authorization: 'Bearer <JSON Web Token>'
                        	},
                		},
					})
					.then(editor => {
					 	const wordCountPlugin = editor.plugins.get('WordCount');
					 	const wordCountWrapper = document.getElementById('word_count');
					 	
					 	wordCountWrapper.appendChild(wordCountPlugin.wordCountContainer);
					 })
					.catch(error => {
						console.log(error);
					});
				
				$("#post").on("click",function(){
					if($("#board").val()==""||$("#headline").val()==""||$("#title").val()==""||$(".ck-content").html()==""){
						alert("내용을 모두 입력해주세요.");
						return false;
					}
					else{
						alert("등록되었습니다.");
					}
				});
				
				$("#cancel").on("click", function () {
					history.back();
				});
			</script>
</body>

</html>