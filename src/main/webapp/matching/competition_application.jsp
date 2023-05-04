<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <link rel="stylesheet" href="css/foundation.css">

            <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
                crossorigin="anonymous">



            <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d92e049e6ae066afdf07afe8fdf8877&libraries=services"></script>

            <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

            <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


            <style>
                * {
                    box-sizing: border-box;

                    text-align: center;
                }



                #request,
                #cancel {
                    background-color: green;
                    border: none;
                    border-radius: 5px;
                    padding: 1%;
                    width: 70px;
                    color: #ffffff;
                }
            </style>
        </head>

        <body>

            <form action="/send.competition" method="get" enctype="multipart/form-data">
                <div class="container-fluid  " style="background-color: whitesmoke;">

                    <div class="row header">

                        <div class="col-xs-1 col-md-1"></div>
                        <div class="col-xs-10 col-md-10">
                            <div class="row">
                                <div class="col-12" style="border:1px solid black; color:red;">경기 정보</div>
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-xs-5 col-md-5">
                                            <img class="h-100" src="team_logo.png">
                                        </div>
                                        <div class="col-xs-1 col-md-1"></div>
                                        <div class="col-xs-6 col-md-6">
                                            <div id="inf" class="row h-100">
                                                <div class="col-12 h-25"> <input  class="w-100" value="팀명" disabled></div>
                                                <div class="col-12 h-25">
                                                    <div class="row h-100">
                                                        <div class="col-4 "><input class="w-100" value="팀장이름" disabled></div>
                                                        <div class="col-8 "><input class="w-100" value="팀장번호" disabled></div>
                                                    </div>
                                                </div>
                                                <div class="col-12 h-25"><input class="w-100" value="경기날짜" disabled></div>
                                                <div class="col-12 h-25"><input class="w-100" value="경기시간" disabled></div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-1 col-md-1"></div>

                    </div>
                    <br>
                    <div class="row body">
                        <div class="col-xs-1 col-md-1"></div>
                        <div class="col-xs-12 col-md-10">
                            <div class="row">

                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-xs-12 col-md-6">
                                            <div id="map" style="width:100%;height:350px;"></div>

                                            <script type="text/javascript"
                                                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 APP KEY를 사용하세요"></script>
                                            <script>
                                                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                                    mapOption = {
                                                        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                                        level: 5 // 지도의 확대 레벨
                                                    };

                                                var map = new kakao.maps.Map(mapContainer, mapOption);

                                                // 마커가 표시될 위치입니다 
                                                var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667);

                                                // 마커를 생성합니다
                                                var marker = new kakao.maps.Marker({
                                                    position: markerPosition
                                                });

                                                // 마커가 지도 위에 표시되도록 설정합니다
                                                marker.setMap(map);

                                                var iwContent = '<div style="padding:5px;">경기장소 <br><a href="https://map.kakao.com/link/map/경기장소,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/경기장소,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                                                    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

                                                // 인포윈도우를 생성합니다
                                                var infowindow = new kakao.maps.InfoWindow({
                                                    position: iwPosition,
                                                    content: iwContent
                                                });

                                                // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                                                infowindow.open(map, marker); 
                                            </script>
                                        </div>
                                        <div class="col-xs-12 col-md-6">

                                            <textarea type="text" class="w-100 h-100" placeholder="소개글 불러오기"
                                                readonly></textarea>
                                        </div>
                                    </div>
                                    <br>
                                    
                                </div>
                               

                                <div class="col-12">
                                    <div class="row w-100" style="padding-left: 30px;">
                                        <div class="col-xs-12 col-md-3" ><input class="w-100" value="경기종류" disabled></div>
                                        <div class="col-xs-12 col-md-3" ><input class="w-100" value="인원수" disabled></div>
                                        <div class="col-xs-12 col-md-3" ><input class="w-100" value="상중하" disabled></div>
                                        <div class="col-xs-12 col-md-3" >
                                            <select size="1" class="w-100" style="padding-bottom: 4px;">

                                                <option selected value="">선택</option>
                                                <option>1</option>

                                                <select>
                                        </div>

                                    </div>
                                    <br>
                                </div>

                                <div class="col-12">
                                    <textarea style="width:100%; height:200px;"
                                        placeholder="소개글작성(선택)"></textarea>
                                </div>

                            </div>
                        </div>
                        <div class="col-xs-1 col-md-1"></div>
                    </div>


                    <div class="row footer">


                        <div class="col-12">
                            <div class="row">
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-2"></div>
                                        <div class="col-10">
                                            <br> <button type="submit" id="request" style="float: right;">신청</button>
                                        </div>
                                    </div>
                                </div>


                                <div class="col-6">
                                    <div class="row">

                                        <div class="col-10">
                                            <br> <button type="button" id="cancel" style="float: left;">취소</button>
                                        </div>
                                        <div class="col-2"></div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>




            </form>

        </body>


        </html>