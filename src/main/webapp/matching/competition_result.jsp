<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

        .header>div {
            float: left;
        }
    </style>
</head>

<body>
  <div class="container-fluid">

        <div class="row box">

            <div class="col-xs-12 col-md-6 contents order-1 order-lg-1">



                <div class="row header  " style="border: 1px solid black;">
                    <div class="col-xs-12 col-md-5 " id="t1_h1">
                        <img src="/image/competition_img/team_logo.png" class="w-100">
                    </div>



                    <div class="col-xs-12 col-md-7" id="t1_h2">
                        <div class="row h-100 ">
                            <div class="col-xs-12">우리팀명</div>
                            <div class="col-xs-12">팀장이름</div>
                            <div class="col-xs-12">연락처</div>
                        </div>
                    </div>

                </div>

                <div class="row body">


                    <div class="col-xs-12 ">

                        <div class="row">

                            <div class="col-xs-12" style="border: 1px solid black;">

                                소개글 불러오기

                            </div>



                        </div>



                        <div class="row" style="border: 1px solid black;">
                            <div class="col-xs-12 col-md-4">평균나이대</div>
                            <div class="col-xs-12 col-md-4">

                                경기 종류 및 인원불러오기

                            </div>
                            <div class="col-xs-12 col-md-4">
                                실력(상/중/하)불러오기
                            </div>
                        </div>


                    </div>

                </div>




            </div>









            <div class="col-xs-12 col-md-6  contents order-2 order-lg-2">

                <div class="row header " style="border: 1px solid black;">
                    <div class="col-xs-12 col-md-5 " id="t1_h1">
                        <img src="/image/competition_img/team_logo.png" class="w-100">
                    </div>



                    <div class="col-xs-12 col-md-7" id="t1_h2">
                        <div class="row h-100 ">
                            <div class="col-xs-12">상대팀명</div>
                            <div class="col-xs-12">팀장이름</div>
                            <div class="col-xs-12">연락처</div>
                        </div>
                    </div>

                </div>

                <div class="row body " style="border: 1px solid black;">


                    <div class="col-xs-12 ">

                        <div class="row">

                            <div class="col-xs-12">

                                소개글 불러오기

                            </div>



                        </div>



                        <div class="row" style="border: 1px solid black;">
                            <div class="col-xs-12 col-md-4">평균나이대</div>
                            <div class="col-xs-12 col-md-4">

                                경기 종류 및 인원불러오기

                            </div>
                            <div class="col-xs-12 col-md-4">
                                실력(상/중/하)불러오기
                            </div>
                        </div>


                    </div>

                </div>




            </div>









        </div>




        <div class="row box2">

            <div class="col-xs-12 h-100">

                <div class="row">


                    <div class="col-12">
                        <div id="map" style="width:100%;height:400px;"></div>

                        <script>
                            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                mapOption = {
                                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                    level: 3 // 지도의 확대 레벨
                                };

                            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                            var map = new kakao.maps.Map(mapContainer, mapOption); 
                        </script>

                    </div>


                    <div class="col-12">

                        경기 일정 및 공지사항
                    </div>

                </div>


            </div>

        </div>


    </div>


    </div>
</body>
</html>