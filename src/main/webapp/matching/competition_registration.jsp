<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d92e049e6ae066afdf07afe8fdf8877&libraries=services"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- awesome font -icon--->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Bootstrap - icon -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<link rel="stylesheet" href="css/foundation.css">
<link href="/commons/css/gnb.css" rel="stylesheet" type="text/css">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<style>
* {
	box-sizing: border-box;
	text-align: center;
}

div {
	font-family: 'NanumSquareNeoBold';
}

#request, #cancel {
	background-color: #0d6efd;
	border: none;
	border-radius: 5px;
	padding: 1%;
	width: 70px;
	color: #ffffff;
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

#pic {
	width: 200px;
	height: 200px;
	border-radius: 100px;
}

#cf {
	padding-top: 120px;
}
</style>
</head>

<body>
	<header> </header>
	<c:import url="/commons/gnb.jsp">
	</c:import>
	<form action="/send.competition" method="get"
		enctype="multipart/form-data">
		<div id="cf" class="container-fluid  "
			style="background-color: whitesmoke;">
			<div class="row header">

				<div class="col-xs-12 col-md-6">
					<div class="row h-100">



						<div class="col-xs-12 col-md-2">
							<div class="row">
								<div class="col-xs-12 col-md-12 ">
									<input type="hidden" name="status" style="width: 100%;"
										value="${status[0].code}">
								</div>

							</div>
						</div>

						<div class="col-xs-12 col-md-8">
							<div class="row h-100">
								<div class="col-xs-12 col-md-12">

									<select size="1" id="tn" name="teamname"
										class="w-75 h-100 ajax_team_name" style="padding: 2%;">
										<option selected value="">팀명선택</option>


										<c:forEach var="t" items="${teamname}">
											<option value="${t.code}">${t.name}</option>
										</c:forEach>

									</select>

								</div>


								<div class="col-xs-12 col-md-12" style="padding: 1%;">
									<img id="pic" style="border: 1px solid black;"
										src="/image/competition_img/upload.png">
								</div>

							</div>
						</div>

						<div class="col-xs-12 col-md-2"></div>

					</div>
				</div>


				<div class="col-xs-12 col-md-6">
					<div class="row h-100">


						<div class="col-xs-12 col-md-2"></div>

						<div class="col-xs-12 col-md-8">
							<div class="row h-100">


								<div class="col-12 ">
									<input class="w-75" type="text"
										style="border: 1px solid black; padding: 3%;" id="t1"
										value="팀명" readonly>
								</div>
								<div class="col-12 ">
									<input class="w-75" type="text"
										style="border: 1px solid black; padding: 3%;" id="t2"
										value="팀장 이름" readonly>
								</div>
								<div class="col-12">
									<input class="w-75" type="text"
										style="border: 1px solid black; padding: 3%;" id="t3"
										value="팀장 번호" readonly>
								</div>
							</div>
						</div>


						<div class="col-xs-12 col-md-2 "></div>


					</div>
				</div>

			</div>
			<div class="row body">

				<div class="col-12">
					<div class="row">
						<div class="col-xs-12 col-md-6">
							<div class="row">
								<div class="col-xs-12 col-md-2"></div>
								<div class="col-xs-12 col-md-10">


									<br> <input type="hidden" style="width: 300px;"
										name="latlng" id="clickLatlng">


									<div class="map_wrap">
										<div id="map"
											style="width: 100%; height: 100%; position: relative; overflow: hidden;">
										</div>

										<div id="menu_wrap" class="bg_white">
											<div class="option">
												<div>
													키워드 : <input type="text" value="서울올림픽경기장" id="keyword"
														size="15">
													<button id="search" type="button"
														onclick="searchPlaces(); return false;">검색하기</button>

												</div>
											</div>
											<hr>
											<ul id="placesList"></ul>
											<div id="pagination"></div>
										</div>
									</div>


									<script>
                                            
                                            	$(function(){
                                            		$(window).keydown(function(event){
                                            		    if(event.keyCode == 13) {
                                            		      event.preventDefault();
                                            		      return false;
                                            		    }
                                            		});
                                          
                                            	})
                                            	
                                            	$(function(){
                                            		$("#keyword").on("keyup",function(e){
                                            	
                                            			if(e.keyCode == 13){
                                            				searchPlaces(); 
                                                    		return false;
                                            			}
                                            	
                                            		})
                                            	})
                                            	
                                            	
                                            	
                                                // 마커를 담을 배열입니다
                                                var markers = [];


                                                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                                    mapOption = {
                                                        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                                        level: 4 // 지도의 확대 레벨
                                                    };

                                                var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

                                                // 지도를 클릭한 위치에 표출할 마커입니다
                                                var marker = new kakao.maps.Marker({
                                                    // 지도 중심좌표에 마커를 생성합니다 
                                                    position: map.getCenter()
                                                });
                                                // 지도에 마커를 표시합니다
                                                marker.setMap(map);

                                                // 지도에 클릭 이벤트를 등록합니다
                                                // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
                                                kakao.maps.event.addListener(map, 'click', function (mouseEvent) {

                                                    // 클릭한 위도, 경도 정보를 가져옵니다 
                                                    var latlng = mouseEvent.latLng;

                                                    //위도
                                                    var lat = latlng.getLat();

                                                    //경도
                                                    var lng = latlng.getLng();

                                                    // 마커 위치를 클릭한 위치로 옮깁니다
                                                    marker.setPosition(latlng);



                                                    var message = lat + ',' + lng;


                                                   // var resultDiv = document.getElementById('clickLatlng');
                                                  //  resultDiv.innerHTML = message;
                                                    

                                                    $("input[name=latlng]").attr('value',message);

                                                });

                                                // 장소 검색 객체를 생성합니다
                                                var ps = new kakao.maps.services.Places();

                                                // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
                                                var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

                                                // 키워드로 장소를 검색합니다
                                                searchPlaces();

                                                // 키워드 검색을 요청하는 함수입니다
                                                function searchPlaces() {

                                                    var keyword = document.getElementById('keyword').value;

                                                    if (!keyword.replace(/^\s+|\s+$/g, '')) {
                                                        alert('키워드를 입력해주세요!');
                                                        return false;
                                                    }

                                                    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
                                                    ps.keywordSearch(keyword, placesSearchCB);
                                                }

                                                // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
                                                function placesSearchCB(data, status, pagination) {
                                                    if (status === kakao.maps.services.Status.OK) {

                                                        // 정상적으로 검색이 완료됐으면
                                                        // 검색 목록과 마커를 표출합니다
                                                        displayPlaces(data);

                                                        // 페이지 번호를 표출합니다
                                                        displayPagination(pagination);

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

                                                    var listEl = document.getElementById('placesList'),
                                                        menuEl = document.getElementById('menu_wrap'),
                                                        fragment = document.createDocumentFragment(),
                                                        bounds = new kakao.maps.LatLngBounds(),
                                                        listStr = '';

                                                    // 검색 결과 목록에 추가된 항목들을 제거합니다
                                                    removeAllChildNods(listEl);

                                                    // 지도에 표시되고 있는 마커를 제거합니다
                                                    removeMarker();

                                                    for (var i = 0; i < places.length; i++) {

                                                        // 마커를 생성하고 지도에 표시합니다
                                                        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                                                            marker = addMarker(placePosition, i),
                                                            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

                                                        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                                                        // LatLngBounds 객체에 좌표를 추가합니다
                                                        bounds.extend(placePosition);

                                                        // 마커와 검색결과 항목에 mouseover 했을때
                                                        // 해당 장소에 인포윈도우에 장소명을 표시합니다
                                                        // mouseout 했을 때는 인포윈도우를 닫습니다
                                                        (function (marker, title) {
                                                            kakao.maps.event.addListener(marker, 'mouseover', function () {
                                                                displayInfowindow(marker, title);
                                                            });

                                                            kakao.maps.event.addListener(marker, 'mouseout', function () {
                                                                infowindow.close();
                                                            });

                                                            itemEl.onmouseover = function () {
                                                                displayInfowindow(marker, title);
                                                            };

                                                            itemEl.onmouseout = function () {
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

                                                    var el = document.createElement('li'),
                                                        itemStr = '<span class="markerbg marker_' + (index + 1) + '"></span>' +
                                                            '<div class="info">' +
                                                            '   <h5>' + places.place_name + '</h5>';

                                                    if (places.road_address_name) {
                                                        itemStr += '    <span>' + places.road_address_name + '</span>' +
                                                            '   <span class="jibun gray">' + places.address_name + '</span>';
                                                    } else {
                                                        itemStr += '    <span>' + places.address_name + '</span>';
                                                    }

                                                    itemStr += '  <span class="tel">' + places.phone + '</span>' +
                                                        '</div>';

                                                    el.innerHTML = itemStr;
                                                    el.className = 'item';

                                                    return el;
                                                }

                                                // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
                                                function addMarker(position, idx, title) {
                                                    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                                                        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                                                        imgOptions = {
                                                            spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                                                            spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                                                            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                                                        },
                                                        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                                                        marker = new kakao.maps.Marker({
                                                            position: position, // 마커의 위치
                                                            image: markerImage
                                                        });

                                                    marker.setMap(map); // 지도 위에 마커를 표출합니다
                                                    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

                                                    return marker;
                                                }

                                                // 지도 위에 표시되고 있는 마커를 모두 제거합니다
                                                function removeMarker() {
                                                    for (var i = 0; i < markers.length; i++) {
                                                        markers[i].setMap(null);
                                                    }
                                                    markers = [];
                                                }

                                                // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
                                                function displayPagination(pagination) {
                                                    var paginationEl = document.getElementById('pagination'),
                                                        fragment = document.createDocumentFragment(),
                                                        i;

                                                    // 기존에 추가된 페이지번호를 삭제합니다
                                                    while (paginationEl.hasChildNodes()) {
                                                        paginationEl.removeChild(paginationEl.lastChild);
                                                    }

                                                    for (i = 1; i <= pagination.last; i++) {
                                                        var el = document.createElement('a');
                                                        el.href = "#";
                                                        el.innerHTML = i;

                                                        if (i === pagination.current) {
                                                            el.className = 'on';
                                                        } else {
                                                            el.onclick = (function (i) {
                                                                return function () {
                                                                    pagination.gotoPage(i);
                                                                }
                                                            })(i);
                                                        }

                                                        fragment.appendChild(el);
                                                    }
                                                    paginationEl.appendChild(fragment);
                                                }

                                                // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
                                                // 인포윈도우에 장소명을 표시합니다
                                                function displayInfowindow(marker, title) {
                                                    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

                                                    infowindow.setContent(content);
                                                    infowindow.open(map, marker);
                                                }

                                                // 검색결과 목록의 자식 Element를 제거하는 함수입니다
                                                function removeAllChildNods(el) {
                                                    while (el.hasChildNodes()) {
                                                        el.removeChild(el.lastChild);
                                                    }
                                                }
                                            </script>

								</div>

							</div>
						</div>

						<div class="col-xs-12  col-md-6">
							<div class="row">
								<div class="col-xs-12 col-md-2"></div>







								<div class="col-xs-12 col-md-8 ">
									<br> <br> <br> <br>

									<div class="row">


										<div class="col-12">
											<select size="1" name="hometown" id="hometown" class="w-75 "
												style="border: none; border-radius: 10px; height: 40px;">
												<option selected value="">지역선택</option>
												<c:forEach var="h" items="${hometown}">
													<option value="${h.name}">${h.name}</option>
												</c:forEach>
											</select>

										</div>



										<div class="col-12 ">
											<br> <br>
											<div class="h-100 ">
												경기 선택일 <input type="text" id="date">
											</div>
										</div>

										<div class="col-12">
											<br>
											<div class="row w-100">

												<div class="col-4 ">
													<input type="hidden" style="width: 100%;" name="year"
														id="year">
												</div>
												<div class="col-4 ">
													<input type="hidden" style="width: 100%;" name="month"
														id="month">
												</div>
												<div class="col-4 ">
													<input type="hidden" style="width: 100%;" name="day"
														id="day">
												</div>


											</div>
										</div>




										<div class="col-12">
											<br>

											<div class="row w-100">
												<div class="col-5" style="margin-top: 20px;">시간(시) 선택</div>
												<div class="col-7">
													<select size="3" id="hour" name="hour" class="w-75 ">

														<option selected value="">---선택---</option>
														<option value="06">오전 6:00시</option>
														<option value="07">오전 7:00시</option>
														<option value="08">오전 8:00시</option>
														<option value="09">오전 9:00시</option>
														<option value="10">오전 10:00시</option>
														<option value="11">오전 11:00시</option>
														<option value="12">오후 12:00시</option>
														<option value="13">오후 1:00시</option>
														<option value="14">오후 2:00시</option>
														<option value="15">오후 3:00시</option>
														<option value="16">오후 4:00시</option>
														<option value="17">오후 5:00시</option>
														<option value="18">오후 6:00시</option>
														<option value="19">오후 7:00시</option>
														<option value="20">오후 8:00시</option>
														<option value="21">오후 9:00시</option>
														<option value="22">오후 10:00시</option>
														<option value="23">오후 11:00시</option>
														<option value="24">오후 12:00시</option>


													</select>

												</div>
											</div>
										</div>


										<div class="col-12">
											<br>
											<div class="row w-100">
												<div class="col-5" style="margin-top: 20px;">시간(분) 선택</div>
												<div class="col-7">
													<select size="3" id="minute" name="minute" class="w-75 ">

														<option selected value="">---선택---</option>
														<option value="10">10분</option>
														<option value="20">20분</option>
														<option value="30">30분</option>
														<option value="40">40분</option>
														<option value="50">50분</option>
														<option value="00">00분</option>


													</select>

												</div>
											</div>
										</div>





									</div>
								</div>






								<div class="col-xs-12 col-md-2"></div>
							</div>
						</div>
					</div>
				</div>


				<div class="col-12">
					<div class="row">
						<div class="col-xs-12 col-md-1"></div>




						<div class="col-xs-12 col-md-10">
							<br>
							<div class="row">

								<div class="col-12">

									<textarea name="write" style="width: 100%; height: 290px;"
										placeholder="소개글(선택사항)"></textarea>

								</div>

								<div class="col-12">
									<br>
									<div class="row">


										<div class="col-4">

											<select name="kind" id="kind" size="1" class="w-100 "
												style="border: none; border-radius: 10px; height: 40px;">
												<option selected value="">경기 종류</option>
												<option value="${kind[0].code}">${kind[0].name}</option>
												<option value="${kind[3].code}">${kind[3].name}</option>
											</select>

										</div>
										<div class="col-4">

											<select name="person" id="person" size="1" class="w-100 "
												style="border: none; border-radius: 10px; height: 40px;">
												<option selected value="">인원</option>
												<c:forEach var="ki" items="${kind}">
													<option value="${ki.code}">${ki.headcount}</option>
												</c:forEach>

											</select>
										</div>
										<div class="col-4">

											<select name="ability" id="ability" size="1" class="w-100 "
												style="border: none; border-radius: 10px; height: 40px;">
												<option selected value="">실력(상/중/하)</option>

												<c:forEach var="ab" items="${ability}">
													<option value="${ab.code}">${ab.name}</option>
												</c:forEach>

											</select>
										</div>

									</div>
								</div>
							</div>
						</div>


						<div class="col-xs-12 col-md-1"></div>
					</div>
				</div>

			</div>


			<div class="row footer">


				<div class="col-12">
					<div class="row">
						<div class="col-6">
							<div class="row">
								<div class="col-2"></div>
								<div class="col-10">
									<br>
									<button type="submit" id="request" style="float: right;">등록</button>
								</div>
							</div>
						</div>


						<div class="col-6">
							<div class="row">

								<div class="col-10">
									<br>
									<button type="button" id="cancel" style="float: left;">취소</button>
								</div>
								<div class="col-2"></div>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>




	</form>




	<script>

            
            
      

                //팀명이름 비동기통신으로 파라미터를 넘긴다
                $(".ajax_team_name").on("change", function () {
                    let name = $(".ajax_team_name option:selected").val(); //선택한 텍스트를 뺴오는거

                    $.ajax({
                        url: "/choose.competition",
                        type: "get",
                        data: {
                            teamname: name
                        },	//dao,dto때문에 
                        dataType: "json"

                    }).done(function (resp) { 	//append가 있을떄 done으로 가게된다
                        //integer.parseint의 
                        $("#t1").val("팀명 : " + resp[0]);
                        $("#t2").val("팀장 이름 : " + resp[1]);
                        $("#t3").val("팀장 번호 : " + resp[2]);
                        $("#pic").attr("src",resp[3]); //사진
                        
                      
                    
                 
                    
                    
                    
                    })
                });
                
                
                
                //유효성 검사(필수항목)
                      
                      $("#request").on("click", function () {


            
                          let latlng = document.getElementById("clickLatlng"); //위도,경도


                          if ($("#tn").val() == "") {
                              alert("팀을 선택하십시오!");
                              return false;
                          } else if ($("#hometown").val() == "") {
                              alert("지역을 선택하십시오!");
                              return false;
                          } else if ($("#year").val() == "" || $("#month").val() == "" || $("#day").val() == "") {
                              alert("날짜를 선택하십시오!");
                              return false;
                          } else if ($("#hour").val() == "") {
                              alert("시간(시) 선택하십시오!");
                              return false;
                          }else if ($("#minute").val() == "") {
                              alert("시간(분) 선택하십시오!");
                              return false;
                          }else if ($("#kind").val() == "") {
                              alert("경기종류를 선택하십시오!");
                              return false;
                          }else if ($("#person").val() == "") {
                              alert("인원수를 선택하십시오!");
                              return false;
                          }else if ($("#ability").val() == "") {
                              alert("실력을 선택하십시오!");
                              return false;
                          }else if($("#clickLatlng").val()== ""){
                          	 alert("지도에 최종 결정지인곳에 맵핀을 찍어주세요");
                          	return false;
                     	  }
                          
                      })
                      

                   //    else if (year.innerHTML == "" || month.innerHTML == "" || day.innerHTML == "") {
                   //    alert("날짜를 선택하십시오!");
                   //    return false; }
            </script>

	<script type="text/javascript">
                $(function () {
                    $("#date").datepicker({
                        dateFormat: "yy/mm/dd",
                        dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
                        monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                        onSelect: function (d) {
                            alert(d + " 선택되었습니다");

                            var arr = d.split("/");
                            var year = arr[0];
                            var month = arr[1];
                            var day = arr[2];

                            $("input[name=year]").attr('value',year);
                            $("input[name=month]").attr('value',month);
                            $("input[name=day]").attr('value',day);
                            
                       //   $("#year").text(year + "년");
                        //    $("#month").text(month + "월");
                        //    $("#day").text(day + "일"); 

                            //요일 가져오기
                            //데이터를 먼저 가져오고 (숫자로 넘어옴)
                         //   var date = new Date($("#date").datepicker({ dateFormat: "yy/mm/dd" }).val());
                            //일요일 0~


                          //  week = new Array("일", "월", "화", "수", "목", "금", "토");
                          //  $("#mydate").text(week[date.getDay()] + "요일");
                            
                            
                          
                        }
                    });

                });



            </script>


</body>


</html>