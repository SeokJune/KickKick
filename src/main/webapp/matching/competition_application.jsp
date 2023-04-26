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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>

    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d92e049e6ae066afdf07afe8fdf8877"></script>


    <style>
        * {
            box-sizing: border-box;
            border: 1px solid black;
            text-align: center;

        }
    </style>
</head>
<body>
  <div class="container-fluid">

        <div class="row header">

            <div class="col-xs-12 col-md-6 " id="h1">

                <img src="/image/competition_img/team_logo.png">
            </div>



            <div class="col-xs-12 col-md-6" id="h2">
                <div class="row h-100">
                    <div class="col-xs-12">

                        <div class="row h-100">
                            <div class="col-md-1">빈곳</div>
                            <div class="col-md-11"><input type="text" style="width:30%;" placeholder="팀명"></div>
                        </div>
                    </div>

                    <div class="col-xs-12">
                        <div class="row h-100" style="">
                            <div class="col-md-1">빈곳</div>
                            <div class="col-md-11"><input type="text" style="width:30%;" placeholder="팀장이름"></div>
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <div class="row h-100">
                            <div class="col-md-1">빈곳</div>
                            <div class="col-md-11"><input type="text" style="width:30%; " placeholder="연락처"></div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="row body">

            <div class="h-75" id="b1">
                <div class="row">
                    <div class="col-xs-12 col-md-6">



                        <div id="map" style="width:100%;height:500px;"></div>




                        <script>





                            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                mapOption = {
                                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                    level: 3 // 지도의 확대 레벨


                                };

                            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                            var map = new kakao.maps.Map(mapContainer, mapOption);

                            var zoomControl = new kakao.maps.ZoomControl();
                            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

                            // 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
                            kakao.maps.event.addListener(map, 'zoom_changed', function () {

                                // 지도의 현재 레벨을 얻어옵니다
                                var level = map.getLevel();

                                var message = '현재 지도 레벨은 ' + level + ' 입니다';
                                var resultDiv = document.getElementById('result');
                                resultDiv.innerHTML = message;

                            });


                            var mapTypeControl = new kakao.maps.MapTypeControl();

                            // 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
                            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);


                            map.addOverlayMapTypeId(kakao.maps.MapTypeId.TERRAIN); 
                        </script>


                    </div>

                    <div class="col-xs-12 col-md-6">

                        <div class="row">
                            <div class="col-12">
                                <input class="w-75" type="text" placeholder="지역불러오기">
                            </div>
                            <div class="col-12 ">
                                <input class="w-75" type="text" placeholder="경기 일정(시간)불러오기">
                            </div>

                        </div>
                    </div>


                </div>

            </div>

            <div class="h-25" id="b2">
                <div class="row">
                    <div class="col-xs-12 col-md-4">
                        <input class="w-75" type="text" placeholder="평균나이대">
                    </div>
                    <div class="col-xs-12 col-md-4">
                        <input class="w-75" type="text" placeholder="경기 종류 및 인원불러오기팀명">


                    </div>
                    <div class="col-xs-12 col-md-4">
                        <input class="w-75" type="text" placeholder="실력(상/중/하)불러오기">

                    </div>
                </div>
            </div>


        </div>


        <div class="row footer">
            <div class="col-12" id="f1">
                <input class="w-75" type="text" placeholder="소개글 불러오기">
            </div>


            <div class="col-6"> <button id="request" style="float: right;">신청</button></div>
            <div class="col-6 "> <button style="float: left;">취소</button></div>

        </div>



    </div>
</body>
</html>