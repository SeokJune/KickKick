<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/foundation.css">

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d92e049e6ae066afdf07afe8fdf8877&libraries=services"></script>


<style>
* {
	box-sizing: border-box;
	text-align: center;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
</style>
</head>
<body>

	<form action="/send.competition" method="get"
		enctype="multipart/form-data">
		<div class="container-fluid ">

			<div class="row header">


				<div class="col-xs-12 col-md-1 " id="h1"></div>


				<div class="col-xs-12 col-md-3 " id="h2">
					<div class="row h-100">
						<div class="col-xs-12 col-md-12 h-25 ">



							<select size="1" class="w-100 h-100 ajax_team_name">
								<option selected>팀명선택</option>


								<c:forEach var="t" items="${teamname}">
									<option value="${t.name}">${t.name}</option>
								</c:forEach>





							</select>




						</div>
						<div class="col-xs-12 col-md-12  h-75">
							<img src="/image/competition_img/team_logo.png" class="h-100">
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-md-2 " id="h3"></div>

				<div class="col-xs-12 col-md-3 " id="h4">
				
					<div class="row h-100 ">
					
						<div class="col-xs-12 " >
							<input type="text" style="border: 1px solid black;" value=" ${team.name}" readonly>
						</div>
						
						<div class="col-xs-12 " >
							<input type="text" style="border: 1px solid black;" value=" ${team.member_name}" readonly>
						</div>
						
						
						<div class="col-xs-12 " >
							<input type="text" style="border: 1px solid black;" value="${team.member_phone}" readonly>
						</div>
						
					
					</div>
				</div>

				<div class="col-xs-12 col-md-4" id="h5"></div>

			</div>

			<div class="row body">


				<div class="h-75" id="b1">
					<div class="row">

						<div class="col-xs-1 col-md-1">

							<div class="row"></div>
						</div>



						<div class="col-xs-12 col-md-6">
							<div class="map_wrap">
								<div id="map"
									style="width: 100%; height: 100%; position: relative; overflow: hidden; border: 1px solid black;"></div>

								<div id="menu_wrap" class="bg_white">
									<div class="option">
										<div>
											<form onsubmit="searchPlaces(); return false;">
												키워드 : <input type="text" value="서울경기장" id="keyword"
													size="15">
												<button type="submit">검색하기</button>
											</form>
										</div>
									</div>
									<hr>
									<ul id="placesList"></ul>
									<div id="pagination"></div>
								</div>
							</div>


							<script>
								// 마커를 담을 배열입니다
								var markers = [];

								var mapContainer = document
										.getElementById('map'), // 지도를 표시할 div 
								mapOption = {
									center : new kakao.maps.LatLng(37.566826,
											126.9786567), // 지도의 중심좌표
									level : 3
								// 지도의 확대 레벨
								};

								// 지도를 생성합니다    
								var map = new kakao.maps.Map(mapContainer,
										mapOption);

								// 장소 검색 객체를 생성합니다
								var ps = new kakao.maps.services.Places();

								// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
								var infowindow = new kakao.maps.InfoWindow({
									zIndex : 1
								});

								// 키워드로 장소를 검색합니다
								searchPlaces();

								// 키워드 검색을 요청하는 함수입니다
								function searchPlaces() {

									var keyword = document
											.getElementById('keyword').value;

									if (!keyword.replace(/^\s+|\s+$/g, '')) {
										alert('키워드를 입력해주세요!');
										return false;
									}

									// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
									ps.keywordSearch(keyword, placesSearchCB);
								}

								// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
								function placesSearchCB(data, status,
										pagination) {
									if (status === kakao.maps.services.Status.OK) {

										// 정상적으로 검색이 완료됐으면
										// 검색 목록과 마커를 표출합니다
										displayPlaces(data);

										// 페이지 번호를 표출합니다
										//displayPagination(pagination);

									} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

										alert('검색 결과가 존재하지 않습니다.');
										return;

									} else if (status === kakao.maps.services.Status.ERROR) {

										alert('검색 결과 중 오류가 발생했습니다.');
										return;

									}
								}

								// 검색 결과 목록과 마커를 표출하는 함수입니다
								function displayPlaces(places) {

									var listEl = document
											.getElementById('placesList'), menuEl = document
											.getElementById('menu_wrap'), fragment = document
											.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

									// 검색 결과 목록에 추가된 항목들을 제거합니다
									removeAllChildNods(listEl);

									// 지도에 표시되고 있는 마커를 제거합니다
									removeMarker();

									for (var i = 0; i < places.length; i++) {

										// 마커를 생성하고 지도에 표시합니다
										var placePosition = new kakao.maps.LatLng(
												places[i].y, places[i].x), marker = addMarker(
												placePosition, i), itemEl = getListItem(
												i, places[i]); // 검색 결과 항목 Element를 생성합니다

										// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
										// LatLngBounds 객체에 좌표를 추가합니다
										bounds.extend(placePosition);

										// 마커와 검색결과 항목에 mouseover 했을때
										// 해당 장소에 인포윈도우에 장소명을 표시합니다
										// mouseout 했을 때는 인포윈도우를 닫습니다
										(function(marker, title) {
											kakao.maps.event.addListener(
													marker, 'mouseover',
													function() {
														displayInfowindow(
																marker, title);
													});

											kakao.maps.event.addListener(
													marker, 'mouseout',
													function() {
														infowindow.close();
													});

											itemEl.onmouseover = function() {
												displayInfowindow(marker, title);
											};

											itemEl.onmouseout = function() {
												infowindow.close();
											};
										})(marker, places[i].place_name);

										fragment.appendChild(itemEl);
									}

									// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
									listEl.appendChild(fragment);
									menuEl.scrollTop = 0;

									// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
									map.setBounds(bounds);
								}

								// 검색결과 항목을 Element로 반환하는 함수입니다
								function getListItem(index, places) {

									var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
											+ (index + 1)
											+ '"></span>'
											+ '<div class="info">'
											+ '   <h5>'
											+ places.place_name + '</h5>';

									if (places.road_address_name) {
										itemStr += '    <span>'
												+ places.road_address_name
												+ '</span>'
												+ '   <span class="jibun gray">'
												+ places.address_name
												+ '</span>';
									} else {
										itemStr += '    <span>'
												+ places.address_name
												+ '</span>';
									}

									itemStr += '  <span class="tel">'
											+ places.phone + '</span>'
											+ '</div>';

									el.innerHTML = itemStr;
									el.className = 'item';

									return el;
								}

								// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
								function addMarker(position, idx, title) {
									var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
									imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
									imgOptions = {
										spriteSize : new kakao.maps.Size(36,
												691), // 스프라이트 이미지의 크기
										spriteOrigin : new kakao.maps.Point(0,
												(idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
										offset : new kakao.maps.Point(13, 37)
									// 마커 좌표에 일치시킬 이미지 내에서의 좌표
									}, markerImage = new kakao.maps.MarkerImage(
											imageSrc, imageSize, imgOptions), marker = new kakao.maps.Marker(
											{
												position : position, // 마커의 위치
												image : markerImage
											});

									marker.setMap(map); // 지도 위에 마커를 표출합니다
									markers.push(marker); // 배열에 생성된 마커를 추가합니다

									return marker;
								}

								// 지도 위에 표시되고 있는 마커를 모두 제거합니다
								function removeMarker() {
									for (var i = 0; i < markers.length; i++) {
										markers[i].setMap(null);
									}
									markers = [];
								}

								// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
								// 인포윈도우에 장소명을 표시합니다
								function displayInfowindow(marker, title) {
									var content = '<div style="padding:5px;z-index:1;">'
											+ title + '</div>';

									infowindow.setContent(content);
									infowindow.open(map, marker);
								}

								// 검색결과 목록의 자식 Element를 제거하는 함수입니다
								function removeAllChildNods(el) {
									while (el.hasChildNodes()) {
										el.removeChild(el.lastChild);
									}
								}

								/*     var marker = new kakao.maps.Marker({
								        position: new kakao.maps.LatLng(37.54699, 127.09598),
								        clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
								    });
								 */

								marker.setMap(map);

								kakao.maps.event
										.addListener(
												marker,
												'click',
												function() {

													var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
													imageSize = new kakao.maps.Size(
															64, 69), // 마커이미지의 크기입니다
													imageOption = {
														offset : new kakao.maps.Point(
																27, 69)
													}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

													// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
													var markerImage = new kakao.maps.MarkerImage(
															imageSrc,
															imageSize,
															imageOption), markerPosition = new kakao.maps.LatLng(
															37.54699, 127.09598); // 마커가 표시될 위치입니다

													// 마커를 생성합니다

													// 마커가 지도 위에 표시되도록 설정합니다
													marker.setMap(map);

													var marker = new kakao.maps.Marker(
															{
																position : markerPosition,
																image : markerImage
															// 마커이미지 설정 
															});
												});
							</script>

						</div>

						<div class="col-xs-12 col-md-5">

							<div class="row">
								<div class="col-12 ">
									<select size="1" class="w-50 ">
										<option selected>지역선택</option>
										<c:forEach var="h" items="${hometown}">
											<option>${h.name}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-12 ">
									<div class="row">
										<div class="col-4">
											<div class="col-12 "
												style="align-self: center; border: 1px solid black;">경기종류</div>
										</div>
										<div class="col-8">
											<input class="w-100" type="text"
												placeholder="경기할 시간 입력하십시오 ex)00시 00분">
										</div>
									</div>
								</div>

							</div>
						</div>


					</div>

				</div>

				<div class="h-25" id="b2">
					<div class="row">


						<div class="col-xs-12 col-md-1"></div>

						<div class="col-xs-12 col-md-3 " style="border: 1px solid red;">
							${status[0].name}</div>



						<div class="col-xs-12 col-md-2">
							<select name="kind" size="1" class="w-100 h-100">
								<option selected>경기 종류</option>
								<option value="${kind[0].code}">${kind[0].name}</option>
								<option value="${kind[3].code}">${kind[3].name}</option>
							</select>
						</div>

						<div class="col-xs-12 col-md-2">
							<select name="person" size="1" class="w-100 h-100">
								<option selected>인원</option>
								<c:forEach var="ki" items="${kind}">
									<option value="${ki.code}">${ki.headcount}</option>
								</c:forEach>
							</select>
						</div>



						<div class="col-xs-12 col-md-3">

							<select name="ability" size="1" class="w-100 h-100">
								<option selected>실력(상/중/하)</option>

								<c:forEach var="ab" items="${ability}">
									<option value="${ab.code}">${ab.name}</option>
								</c:forEach>



							</select>

						</div>




						<div class="col-xs-12 col-md-1"></div>

					</div>
				</div>


			</div>


			<div class="row footer">
				<div class="col-12" id="f1">
					<textarea name="write" style="width: 75%; height: 400px;"
						placeholder="소개글(선택사항)"></textarea>
				</div>

				<div class="col-12" id="f2">
					<div class="row">
						<div class="col-6">
							<button id="request" style="float: right;">등록</button>
						</div>
						<div class="col-6 ">
							<button type="button" style="float: left;">취소</button>
						</div>
					</div>
				</div>
			</div>


		</div>


		<script>
								
							
			//팀명이름 비동기통신으로 파라미터를 넘긴다
			$(".ajax_team_name").on("change",function(){									
				let name = $(".ajax_team_name option:selected").val();
				
				$.ajax({
					url: "/choose.competition",
					type: "get",
					data: {
						teamname : name 
					}	
				})		
			});
			
	</script>
</body>
</html>