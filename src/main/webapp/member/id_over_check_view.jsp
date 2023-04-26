<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KickKick - 아이디 중복 확인</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
body{
background-color:#88B6F2;
}

#container{
background-color:white;
text-align: center;
width:200px;
height:100px;
position:relative;
left: 70px;
}
</style>
</head>
<body>

<!-- 아이디 중복확인 비동기로 수정하면 삭제할 예정인 jsp -->
	<c:choose>
		<c:when test="${over_check}">
			<div id="container">
				<p>이미 사용중인 ID 입니다.</p>
				<p>다시 입력해주세요.</p>
			</div>
				<button id="close">닫기</button>
				<script>
				
				$("#close").on("click",function(){
					opener.document.getElementById("member_id").value="";
					window.close();
				})
				</script>
		</c:when>

		<c:otherwise>
			<div id="container">
				<p>사용 가능한 ID입니다.</p>
				<p>사용하시겠습니까?</p>
			</div>
				<button id="yes">Yes</button>
				<button id="no">No</button>
			
				<script>
					$("#yes").on("click",function(){
						opener.id_valid_flag = true;
						window.close();
					});
					$("#no").on("click",function(){
						opener.document.getElementById("member_id").value="";
						window.close();
					});
				</script>
		</c:otherwise>

	</c:choose>





</body>
</html>