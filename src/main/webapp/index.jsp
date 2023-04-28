<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>KickKick</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- JQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro:400,600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
</head>

 <style>
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }

    .b-example-divider {
      width: 100%;
      height: 3rem;
      background-color: rgba(0, 0, 0, .1);
      border: solid rgba(0, 0, 0, .15);
      border-width: 1px 0;
      box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
    }

    .b-example-vr {
      flex-shrink: 0;
      width: 1.5rem;
      height: 100vh;
    }

    .bi {
      vertical-align: -.125em;
      fill: currentColor;
    }

    .nav-scroller {
      overflow-y: auto;
    }
    
    .nav-scroller::-webkit-scrollbar{
    display: none;
    }



    .btn-bd-primary {
      --bd-violet-bg: #712cf9;
      --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

      --bs-btn-font-weight: 600;
      --bs-btn-color: var(--bs-white);
      --bs-btn-bg: var(--bd-violet-bg);
      --bs-btn-border-color: var(--bd-violet-bg);
      --bs-btn-hover-color: var(--bs-white);
      --bs-btn-hover-bg: #6528e0;
      --bs-btn-hover-border-color: #6528e0;
      --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
      --bs-btn-active-color: var(--bs-btn-hover-color);
      --bs-btn-active-bg: #5a23c8;
      --bs-btn-active-border-color: #5a23c8;
    }

    .bd-mode-toggle {
      z-index: 1500;
    }

    a,
    a:hover {
      padding-top: 10px;
      padding-bottom: 10px;
      padding-left: 30px;
      padding-right: 3px;
      text-decoration: none !important;
    }

    .center-block {
      display: block;
      margin-left: auto;
      margin-right: auto;
    }
    li{
      font-size: 16px;
    }
    li:hover {
      background-color: #fcfcfc;
    }
    .btn-toggle-nav>li:hover{
    	background-color: #547cec1e;
    }
  </style>

</head>

<body>
  <nav class="navbar bg-body-tertiary fixed-top">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
        aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="offcanvas-header">
        <a href="/index.jsp" class="">
          <h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="text-decoration: none;">⚽KickKick</h5>
        </a>
      </div>
      <a class="navbar-brand" href="/member/login_view.jsp">Login</a>
      
      <div class="offcanvas offcanvas-start flex-shrink-0 p-3" style="width: 280px;" tabindex="-1" id="offcanvasNavbar"
        aria-labelledby="offcanvasNavbarLabel">
        <div class="offcanvas-header d-flex justify-content-end">
          <button type="button" class="btn-close text-end" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>

        <!-- 프로필 -->
        <!-- div 태그 아래에만 border 1 주기 색은 그레이-->
        <div class="profile border-bottom text-center pb-2">
                  <a href="/index.jsp" class="">
            <h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="text-decoration: none;">⚽KickKick</h5>
          </a>
          <img src="/image/login_img/ball_icon.png" alt="Image" class="center-block mb-4" style="width: 80px; height: 80px;">
          <!-- 유저이름 -->
          <h3 class="nick_name text-center mb-3">TEST</h3>
          <!-- 알림 -->
          <div class="counter d-flex justify-content-center">
            <div class="col d-flex justify-content-center">
              <button type="button" class="btn position-relative">
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-bell"
                  viewBox="0 0 16 16">
                  <path
                    d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
                </svg>
                <span
                  class="position-absolute translate-middle p-1 bg-danger border border-light rounded-circle">
                  <span class="visually-hidden">New alerts</span>
                </span>
              </button>
            </div>

            <div class="col">
              <strong class="number">22.5k</strong>
              <span class="number-label">Followers</span>
            </div>
            <div class="col">
              <strong class="number">150</strong>
              <span class="number-label">Following</span>
            </div>

          </div>
        </div>

        <div class=" p-3 nav-scroller">
          <ul class="list-unstyled ps-0">
            <li class="mb-1">
              <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
                마이페이지
              </button>
              <div class="collapse show" id="home-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                  <li><a href="#" class="link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">내 정보
                      보기</a></li>
                  <li><a href="#" class="link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">내 팀
                      보기</a></li>
                  <li><a href="#" class="link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">내 활동
                      관리</a></li>
                </ul>
              </div>
            </li><!--마이페이지 카테고리-->

            <li class="mb-1">
              <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
                전체 제시판
              </button>
              <div class="collapse" id="dashboard-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                  <li><a href="/list.board?b_c=1002&cpage=1"
                      class="link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">공지사항</a></li>
                  <li><a href="/list.board?b_c=1003&cpage=1"
                      class="link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">자유게시판</a></li>
                  <li><a href="/list.board?b_c=1004&cpage=1"
                      class="link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">홍보게시판</a></li>
                </ul>
              </div>
            </li> <!--전체게시판 카테고리-->

            <li class="mb-1">
              <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
                팀 카테고리
              </button>
              <div class="collapse" id="orders-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                  <li><a href="#" class="link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">팀 랭킹
                      보기</a></li>
                  <li><a href="hometown.team"
                      class="link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">팀 생성하기</a></li>
                  <li><a href="/list.team?cpage=1"
                      class="link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">팀 목록보기</a></li>
                  <li><a href="#" class="link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">내 팀
                      게시판으로</a></li>
                </ul>
              </div>
            </li> <!-- 팀 카테고리 -->

            <li class="mb-1">
              <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
                매치메이킹
              </button>
              <div class="collapse" id="account-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                  <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">시설 검색</a></li>
                  <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">용병 등록하기</a></li>
                  <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">용병 목록보기</a></li>
                  <li><a href="/registration.competition"
                      class="link-dark d-inline-flex text-decoration-none rounded">매칭 등록하기</a></li>
                  <li><a href="/list.competition" class="link-dark d-inline-flex text-decoration-none rounded">매칭
                      목복보기</a></li>
                </ul>
              </div>
            </li> <!-- 매치메이킹 카테고리 -->

            <li class="border-top my-3"></li> <!-- 구분선 -->

            <li class="mb-1">
              <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
                운영진에게
              </button>
              <div class="collapse" id="account-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                  <li><a href="/list.board?b_c=1005&cpage=1"
                      class="link-dark d-inline-flex text-decoration-none rounded">문의하기</a></li>
                </ul>
              </div>
            </li> <!-- 운영진 카테고리 -->

          </ul>
        </div> <!-- flex-shrink-0 p-3 -->
      </div>

    </div>
    </div>
    </div>
    </div>
  </nav>

  <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>

  <script src="sidebars.js"></script>
</body>

</html>

</html>