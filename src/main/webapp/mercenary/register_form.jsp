<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegisterForm</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
    crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
    <style>
        div{border:1px solid black;}
        .header2>div{float:left;}
        .box>div{float:left;}
    </style>
</head>
<body>
	<div class="container fluid">
        
        <div class="row header1">
            <div><button type="button" id="teamSelect">팀 선택</button></div>
        </div>
        <div class="row header2">
            <div class="col-xs-12 col-md-4 col-xl-4 text-center">
                <div id="team_logo">img</div>
            </div>
            <div class="col-xs-12 col-md-8 col-xl-8">
                <div>팀명 <input type="text" id="team_name" readonly></div>
                <div class="box">
                    <div class="col-12 col-md-6 col-xl-6">팀장 <input type="text" id="name" readonly></div>
                    <div class="col-12 col-md-6 col-xl-6">연락처 <input type="text" id="phone" readonly></div>
                </div>
            </div>
        </div>
        <br>
        <div class="row body1">
            <div><button type="button" id="matchSelect">경기 선택</button></div>
            <div class="box">
                <div class="col-12 col-md-6 col-xl-6">장소 <input type="text" placeholder="장소"></div>
                <div class="col-12 col-md-6 col-xl-6">일시 <input type="text" placeholder="일시"></div>
            </div>
        </div>
        <br>
        <div class="row body2">
            <div class="box">
                <div class="col-12 col-md-6 col-xl-6 text-center">
                    실력 <select class="form-select" aria-label="Default select example" name="ability">
						<option value="" selected>-- 선택해주세요 --</option>
						<option value="good">상</option>
						<option value="fair">중</option>
						<option value="poor">하</option>
				</select>
                </div>
                <div class="col-12 col-md-6 col-xl-6 text-center">
                    인원수 <select class="form-select" aria-label="Default select example" name="people">
						<option value="" selected>-- 선택해주세요 --</option>
						<option value="one">1</option>
						<option value="two">2</option>
				</select>
                </div>
            </div>
        </div>
        <br>
        <div class="footer">
            <div class="col-xl-12 col-md-12 col-xs-12 text-center">
                <a><input type="button" value="등록"></a>
				<a href="/index.jsp"><input type="button" value="취소"></a>
            </div>
        </div>
      </div>
      <script>
      	function setTeamInfo(tc,tl,tn,n,p){
      		document.getElementById("team_logo").innerHTML = tl;
      		document.getElementById("team_name").value = tn;
      		document.getElementById("name").value = n;
      		document.getElementById("phone").value = p;
      	}
      
      	$("#teamSelect").on("click", function(){
      		window.open("/teamCheck.mercenary","","width=350px,height=250px");
      	})
      	$("#matchSelect").on("click", function(){
      		window.open("/matchCheck.mercenary","","width=350px,height=250px");
      	})
      </script>
</body>
</html>