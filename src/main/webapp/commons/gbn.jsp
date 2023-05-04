<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar bg-body-tertiary fixed-top">
	<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="offcanvas-header">
			<a href="/" class="nav_a">
				<h1 class="offcanvas-title" id="offcanvasNavbarLabel" style="text-decoration: none; font-family: 'NanumSquareNeoHeavy';">⚽KickKick</h1>
			</a>
		</div>
		<c:if test="${sessionScope.id == null}">
			<a class="navbar-brand nav_a" href="/member/login_view.jsp">Login</a>
		</c:if>
		<c:if test="${sessionScope.id != null}">
			<a class="navbar-brand nav_a" href="/logout.member">Logout</a>
		</c:if>
		<div class="offcanvas offcanvas-start flex-shrink-0 p-3" style="width: 280px;" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
			<div class="offcanvas-header d-flex justify-content-end">
				<button type="button" class="btn-close text-end" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<!-- 프로필 -->
			<!-- div 태그 아래에만 border 1 주기 색은 그레이-->
			<div class="profile border-bottom text-center pb-2">
				<a href="/" class="nav_a">
					<h5 class="offcanvas-title" id="offcanvasNavbarLabel" style="text-decoration: none;">⚽KickKick</h5>
				</a>
				<img src="/image/login_img/ball_icon.png" alt="MyIcon" class="center-block mb-4" style="width: 80px; height: 80px;">
				<c:choose>
					<c:when test="${sessionScope.nickname != null}">
						<!-- 유저이름 -->
						<h3 class="nick_name text-center mb-3">${sessionScope.nickname}</h3>
						<!-- 알림 -->
						<div class="counter d-flex justify-content-center">
							<div class="col d-flex justify-content-center">
								<button type="button" class="btn position-relative">
									<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
									<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
                				</svg>
									<span class="position-absolute translate-middle p-1 bg-danger border border-light rounded-circle">
										<span class="visually-hidden">New alerts</span>
									</span>
								</button>
							</div>
							<div class="nav-col">
								<strong class="number">22.5k</strong>
								<span class="number-label">Followers</span>
							</div>
							<div class="nav-col">
								<strong class="number">150</strong>
								<span class="number-label">Following</span>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<a class="btn btn-outline-primary" role="button" href="/member/login_view.jsp">로그인 하러 가기</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="p-3 nav-scroller">
				<ul class="list-unstyled ps-0">
					<!--마이페이지 카테고리-->
					<c:if test="${sessionScope.nickname != null}">
						<li class="mb-1 nav-menu">
							<i class="bi bi-house"></i>
							<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">마이페이지</button>
							<div class="collapse show" id="home-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li class="login">
										<a href="#" class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">내 활동 관리</a>
									</li>
									<li class="login">
										<a href="/member/my_profile.jsp" class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">내 정보 보기</a>
									</li>
									<li class="login">
										<a href="/member/my_team_list.jsp" class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">내 팀 보기</a>
									</li>
								</ul>
							</div>
						</li>
					</c:if>
					<!--전체게시판 카테고리-->
					<li class="mb-1 nav-menu">
						<i class="fa-solid fa-file-pen"></i>
						<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">전체 제시판</button>
						<div class="collapse" id="dashboard-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li>
									<a href="/list.board?b_c=1002&cpage=1" class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">공지사항</a>
								</li>
								<li>
									<a href="/list.board?b_c=1003&cpage=1" class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">자유게시판</a>
								</li>
								<li>
									<a href="/list.board?b_c=1004&cpage=1" class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">홍보게시판</a>
								</li>
							</ul>
						</div>
					</li>
					<!-- 팀 카테고리 -->
					<li class="mb-1 nav-menu">
						<i class="bi bi-people-fill"></i>
						<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">팀 카테고리</button>
						<div class="collapse" id="orders-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<c:if test="${sessionScope.nickname != null}">
									<li class="login">
										<a href="/hometown.team" class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">팀 생성</a>
									</li>
								</c:if>
								<li>
									<a href="/list.team?cpage=1" class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">팀 목록보기</a>
								</li>
								<c:if test="${sessionScope.nickname != null}">
									<li class="login">
										<a href="#" class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">내 팀 게시판으로</a>
									</li>
								</c:if>
								<li>
									<a href="#" class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">팀 랭킹 보기</a>
								</li>
							</ul>
						</div>
					</li>
					<!-- 매치메이킹 카테고리 -->
					<li class="mb-1 nav-menu">
						<i class="fa-solid fa-hand-fist"></i>
						<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">매치메이킹</button>
						<div class="collapse" id="account-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<c:if test="${sessionScope.nickname != null}">
									<li class="login">
										<a href="/registration.competition" class="nav_a link-dark d-inline-flex text-decoration-none rounded">매칭 등록</a>
									</li>
								</c:if>
								<li>
									<a href="/list.competition" class="nav_a link-dark d-inline-flex text-decoration-none rounded">매칭 신청</a>
								</li>
								<c:if test="${sessionScope.nickname != null}">
									<li class="login">
										<a href="#" class="nav_a link-dark d-inline-flex text-decoration-none rounded">용병 등록</a>
									</li>
								</c:if>
								<li>
									<a href="#" class="nav_a link-dark d-inline-flex text-decoration-none rounded">용병 신청</a>
								</li>
								<li>
									<a href="#" class="nav_a link-dark d-inline-flex text-decoration-none rounded">시설 검색</a>
								</li>
							</ul>
						</div>
					</li>
					<!-- 구분선 -->
					<li class="border-top my-3"></li>
					<!-- 운영진 카테고리 -->
					<li class="mb-1 nav-menu">
						<i class="fa-solid fa-paper-plane"></i>
						<button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">운영진에게</button>
						<div class="collapse" id="account-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li>
									<a href="/" class="nav_a link-dark d-inline-flex text-decoration-none rounded">문의하기</a>
								</li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</nav>