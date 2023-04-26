<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>
	<c:choose>
		<c:when test="${result}">
			<!-- 사용할 수 없다 -->
			<table border=1>
				<tr>
					<th>중복 검사 결과</th>
				</tr>
				<tr>
					<td>이미 시용중인 팀명 입니다.</td>
				</tr>
				<tr>
					<td><button id="close">닫기</button></td>
				</tr>
				<script>
					$("#close").on("click", function() {
						opener.document.getElementById("team_name").value = "";
						window.close();
					})
					</script>
			</table>
		</c:when>
		<c:otherwise>
			<!-- 사용 가능한 ID -->
			<table border=1>
				<tr>
					<th colspan=2>중복 검사 결과</th>
				</tr>
				<tr>
					<td colspan=2>사용 가능한 팀명 입니다<br> 이 팀명을 사용하겠습니까?
					</td>
				</tr>
				<tr align="center">
					<td><button id="use">사용</button></td>
					<td><button id="cancel">취소</button></td>
				</tr>
				<script>
					$("#use").on("click", function() {
						opener.idValidFlag = true;
						window.close();
					})
					$("#cancel").on("click", function() {
						opener.document.getElementById("team_name").value = "";
						window.close();
					})
				</script>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>