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
                
                
                
                 #pic {
                	width: 200px;
                	height:200px;
                	border-radius: 100px;
                }
                
            </style>
        </head>

        <body>


            <c:choose>
                <c:when test="${code != form.member_code }">


                        <div class="row header">

                            <div class="col-xs-1 col-md-1"></div>
                            <div class="col-xs-10 col-md-10">
                                <div class="row">
                                    <div class="col-12" style="color:red;">${status[2].name}</div>
                                    
                                      <div class="col-12" style=" display:none; " id="lat" >${form.latirude }</div>
                                     <div class="col-12" style=" display:none; " id="long" >${form.longitude }</div>
                                     <div class="col-12" ><input type="hidden" name="rcode" value="${form.registration_code }"></div>
                                     <div class="col-12" ><input type="hidden" name="tcode" value="${form.apply_teamcode }"></div>
                                    <div class="col-12">
                                        <br>
                                        <div class="row">
                                            <div class="col-xs-5 col-md-5" style="padding:1%;">
                                                <img id="pic" style="border:1px solid black;" class="h-100" src=" ${form.logo_path }${form.logo}">
                                            </div>
                                            <div class="col-xs-1 col-md-1"></div>
                                            <div class="col-xs-6 col-md-6">
                                                <div id="inf" class="row h-100">
                                                    <div class="col-12 h-25"> <input class="w-100"
                                                            value="팀명 : ${form.team_name }" disabled></div>
                                                    <div class="col-12 h-25">
                                                        <div class="row h-100">
                                                            <div class="col-4 "><input class="w-100"
                                                                    value="팀장 이름 : ${form.member_name }" disabled></div>
                                                            <div class="col-8 "><input class="w-100"
                                                                    value="팀장 번호 : ${form.member_phone }" disabled>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 h-25"><input class="w-100"
                                                            value="${form.competition_date }" disabled></div>
                                                    <div class="col-12 h-25"><input class="w-100" value="경기시간" disabled>
                                                    </div>

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

                   								<script>
                                                let lat = document.getElementById('lat').innerHTML; //위도
                                                let longi = document.getElementById('long').innerHTML; //경도
                                                
                                                console.log(lat);
                                                console.log(longi);
                                                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                                        mapOption = {
                                                            center: new kakao.maps.LatLng(lat, longi), // 지도의 중심좌표
                                                            level: 5 // 지도의 확대 레벨
                                                        };

                                                    var map = new kakao.maps.Map(mapContainer, mapOption);

                                                    // 마커가 표시될 위치입니다 
                                                    var markerPosition = new kakao.maps.LatLng(lat, longi);

                                                    // 마커를 생성합니다
                                                    var marker = new kakao.maps.Marker({
                                                        position: markerPosition
                                                    });

                                                    // 마커가 지도 위에 표시되도록 설정합니다
                                                    marker.setMap(map);

                                                    var iwContent = '<div style="padding:8px;">경기장소</div>',
                                                        iwPosition = new kakao.maps.LatLng(lat, longi); //인포윈도우 표시 위치입니다
                                                        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
                                                        
                                                        
                                                        
                                                        
                                                        
                                                    // 인포윈도우를 생성합니다
                                                    var infowindow = new kakao.maps.InfoWindow({
                                                        position: iwPosition,
                                                        content: iwContent,
                                                        removable : iwRemoveable
                                                    });

                                                    // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                                                    infowindow.open(map, marker); 
                                                </script>
                                            </div>
                                            <div class="col-xs-12 col-md-6">

                                                <textarea type="text" class="w-100 h-100" placeholder="소개글 불러오기"
                                                    readonly>${form.content }</textarea>
                                            </div>
                                        </div>
                                        <br>

                                    </div>


                                    <div class="col-12">
                                        <div class="row w-100" style="padding-left: 30px;">
                                            <div class="col-xs-12 col-md-3"><input class="w-100"
                                                    value="종목 : ${form.competition_name}" disabled></div>
                                            <div class="col-xs-12 col-md-3"><input class="w-100"
                                                    value="인원수 : ${form.headcount}" disabled></div>
                                            <div class="col-xs-12 col-md-3"><input class="w-100"
                                                    value="실력 : ${form.ability_name}" disabled></div>
                                            <div class="col-xs-12 col-md-3">
                                                
                                                <select size="1" id="ability" name="ab" class="w-100" style="padding-bottom: 4px;">

                                                     <option selected value="">실력선택</option>
                                                  
                                                <c:forEach var="a" items="${ability}">
                                                    <option value="${a.code}">${a.name}</option>
                                                    
                                                </c:forEach>

                                                  </select>
                                            
                                            
                                            
                                            </div>

                                        </div>
                                        <br>
                                    </div>

                                    <div class="col-12">
                                        <textarea id="tx" name="content" style="width:100%; height:200px;" placeholder="소개글작성(선택)"></textarea>
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
                                                <br> <button type="button" id="request"
                                                    style="float: right;">신청</button>
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



<script>


$("#request").on("click",function(){

	if ($("#ability").val() == "") {
		alert("실력을 선택하십시오");
        return false;
	
	}
	else {																																
		location.href="/apply.competition?status="+${status[2].code}+"&rcode="+${form.registration_code}+"&tcode="+${form.apply_teamcode}+"&ability="+ $("select[name=ab] option:selected").val()+"&content="+$("#tx").val();
		window.close(); //팝업창 닫는거
	
	}
	
})

	

</script>
 </c:when>

                <c:otherwise>


                </c:otherwise>

            </c:choose>

        </body>


        </html>