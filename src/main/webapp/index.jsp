<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>KickKick</title>
</head>
<body>
	<button type="button" link="/aaa.aaa1" onclick="link(this);">1</button>
	<button type="button" link="/aaa.aaa2" onclick="link(this);">2</button>
	<button type="button" link="/aaa.aaa3" onclick="link(this);">3</button>
	<button type="button" link="/aaa.aaa4" onclick="link(this);">4</button>
	<button type="button" link="/aaa.aaa5" onclick="link(this);">5</button>
	<button type="button" link="/aaa.aaa6" onclick="link(this);">6</button>
	<button type="button" link="/aaa.aaa7" onclick="link(this);">7</button>
	<script type="text/javascript">
	function link(evt) {
		location.href = evt.getAttribute('link');
	}
	</script>
</body>
</html>