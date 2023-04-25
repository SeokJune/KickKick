<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">신청인</th>
				<th scope="col">소개글</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>은지</td>
				<td>
					<div class="col-12 col-md-12 col-xl-12">
						<textarea class="form-control" name="contents" id="contents"
							placeholder="소개글" readonly></textarea>
					</div>
				</td>
				<td>
					<button>수락</button>
					<button>거절</button>
				</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td>금지</td>
				<td>
					<div class="col-12 col-md-12 col-xl-12">
						<textarea class="form-control" name="contents" id="contents"
							placeholder="소개글입니다" readonly></textarea>
					</div>
				</td>
				<td>
					<button>수락</button>
					<button>거절</button>
				</td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td>동지</td>
				<td>
					<div class="col-12 col-md-12 col-xl-12">
						<textarea class="form-control" name="contents" id="contents"
							placeholder="소개글이에요" readonly></textarea>
					</div>
				</td>
				<td>
					<button>수락</button>
					<button>거절</button>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>