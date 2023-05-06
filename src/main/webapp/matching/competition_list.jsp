<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
                crossorigin="anonymous"></script>

            <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d92e049e6ae066afdf07afe8fdf8877&libraries=services"></script>


            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css"
                integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />




            <style>
                * {
                    box-sizing: border-box;
                    text-align: center;
                }
            </style>
        </head>

        <body>
            <div class="container-fluid" style="background-color: whitesmoke;">

                <div class="row header">

                    <div class="col-xs-12 col-md-6">

                        <div class="row h-100">
                            <div class="col-xs-2 col-md-2"></div>
                            <div class="col-xs-8 col-md-8">
                                <select size="1" class="h-100 w-100" style="border-radius: 10px;">
                                    <option selected>지역선택</option>
                                    <c:forEach var="h" items="${hometown}">
                                        <option>${h.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-xs-2 col-md-2"></div>
                        </div>

                    </div>

                    <div class="col-xs-12 col-md-6">

                        <div class="row h-100">

                            <div class="col-xs-2 col-md-2"></div>

                            <div class="col-xs-8 col-md-8">
                                <div class="row h-100">
                                    <input class="col-10 h-100" type="text" placeholder="팀명 검색">
                                    <button class="col-2 h-100" type="button">
                                        <i class="fa-solid fa-magnifying-glass"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="col-xs-2 col-md-2"></div>
                        </div>

                    </div>

                </div>

                <br>

                <div class="row body">

                    <div class="col-12">

                        <c:forEach var="l" items="${list}">
                            <div class="row">
                                <div class="col-xs-1 col-md-1"></div>


                                <div class="col-xs-10 col-md-10 applywindow"
                                    style="border: 1px solid black; border-radius: 5px;">


                                    <div class="row">
                                        <div class="col-xs-12 col-md-1">
                                            <div class="row">
                                                <div class="col-12"
                                                    style="color:red; font-weight:bold ; font-size: 14px;">
                                                    ${l.kind_name}</div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-md-3" style="border: 1px solid black;">
                                            <img src="team_logo.png" class="h-100">
                                        </div>

                                        <div class="col-xs-12 col-md-7">


                                            <div class="row h-100">
                                                <div class="col-12 h-25 tname"  style="border: 1px solid black; padding: 2%;">
                                                    팀명: ${l.team_name}</div>
                                                <div class="col-12 h-25">
                                                    <div class="row h-100">
                                                        <div class="col-4"
                                                            style="border: 1px solid black; padding: 2%;">
                                                            팀장 이름: ${l.member_name}</div>
                                                        <div class="col-8"
                                                            style="border: 1px solid black; padding: 2%;">
                                                             번호: ${l.member_phone}</div>
                                                    </div>
                                                </div>

                                                <div class="place col-12 h-25"
                                                    style="border: 1px solid black; padding: 2%;">
                                                </div>
                                                <div class="col-12 h-25">
                                                    <div class="row h-100">
                                                        <div class="lat col-3"
                                                            style="border: 1px solid black; padding: 2%; display: none;">
                                                            ${l.latirude}</div>
                                                        <div class="lng col-3"
                                                            style="border: 1px solid black; padding: 2%; display: none;">
                                                            ${l.longitude}</div>



                                                        <div class="col-6"
                                                            style="border: 1px solid black; padding: 2%;">
                                                            경기상태: ${l.status_name}</div>
                                                        <div class="col-6"
                                                            style="border: 1px solid black; padding: 2%;">
                                                            경기일정: ${l.competition_date}</div>
                                                    </div>
                                                </div>
                                                
                                                <div class="date col-12 " style="display:none" >${l.competition_date}</div>

                                            </div>

                                        </div>

                                        <div class="col-xs-12 col-md-1 "></div>
                                    </div>

                                </div>







                                <div class="col-xs-1 col-md-1"></div>
                            </div>
                            <br>
                        </c:forEach>



                    </div>

                    <div class="row footer">
                        <div style="font-size: 15px;" class="col-xs-12 col-md-12 " colspan="5">1 2 3 4 5 6 7 8 9 10
                        </div>

                    </div>





                </div>

            </div>

            <script>
                var lat = document.getElementsByClassName("lat");
                var lng = document.getElementsByClassName("lng");

                var geocoder = new kakao.maps.services.Geocoder();

                for (let i = 0; i < lat.length; i++) {
                    var coord = new kakao.maps.LatLng(lat[i].innerHTML,
                        lng[i].innerHTML);
                    var place = document.getElementsByClassName("place");
                    console.log(place[i]);

                    var callback = function (result, status) {

                        if (status === kakao.maps.services.Status.OK) {

                            place[i].innerHTML = "장소: " + result[0].address.address_name;
                            console.log(name);
                            
                        }

                    }

                    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);

                }
                
                $(".applywindow").on("click",function(){

                    $(this).css("border","solid 3px navy");
                   window.open("/applyform.competition?date="+$(this).find(".date").text(),
                		   "","width=900px, height=600px");
                 })
                    
            </script>





        </body>

        </html>