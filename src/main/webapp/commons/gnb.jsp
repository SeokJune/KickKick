<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar bg-body-tertiary fixed-top">
	<div class="container-fluid">
		<button class="navbar-toggler" type="button"
			data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
			aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="offcanvas-header">
			<a href="/" class="nav_a">
				<h1 class="offcanvas-title" id="offcanvasNavbarLabel"
					style="text-decoration: none; font-family: 'NanumSquareNeoHeavy';">⚽KickKick</h1>
			</a>
		</div>
		<c:if test="${sessionScope.id == null}">
			<a class="navbar-brand nav_a" href="/member/login_view.jsp">Login</a>
		</c:if>
		<c:if test="${sessionScope.id != null}">
			<a class="navbar-brand nav_a" href="/logout.member">Logout</a>
		</c:if>
		<div class="offcanvas offcanvas-start flex-shrink-0 p-3"
			style="width: 280px;" tabindex="-1" id="offcanvasNavbar"
			aria-labelledby="offcanvasNavbarLabel">
			<div class="offcanvas-header d-flex justify-content-end">
				<button type="button" class="btn-close text-end"
					data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<!-- 프로필 -->
			<!-- div 태그 아래에만 border 1 주기 색은 그레이-->
			<div class="profile border-bottom text-center pb-2">
				<a href="/" class="nav_a">
					<h5 class="offcanvas-title" id="offcanvasNavbarLabel"
						style="text-decoration: none;">⚽KickKick</h5>
				</a> <img src="/image/login_img/ball_icon.png" alt="MyIcon"
					class="center-block mb-4" style="width: 80px; height: 80px;">
				<c:choose>
					<c:when test="${sessionScope.nickname != null}">
						<!-- 유저이름 -->
						<h3 class="nick_name text-center mb-3">${sessionScope.nickname}</h3>
						<!-- 알림 -->
						<div class="counter d-flex justify-content-center">
							<div class="col d-flex justify-content-center">
								<button type="button" class="btn position-relative">
									<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
										fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
									<path
											d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
                				</svg>
									<span
										class="position-absolute translate-middle p-1 bg-danger border border-light rounded-circle">
										<span class="visually-hidden">New alerts</span>
									</span>
								</button>
							</div>
							<div class="col d-flex justify-content-center">
								<button type="button" class="btn position-relative">
									<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
										fill="currentColor" class="bi bi-trophy" viewBox="0 0 16 16">
  									<path
											d="M2.5.5A.5.5 0 0 1 3 0h10a.5.5 0 0 1 .5.5c0 .538-.012 1.05-.034 1.536a3 3 0 1 1-1.133 5.89c-.79 1.865-1.878 2.777-2.833 3.011v2.173l1.425.356c.194.048.377.135.537.255L13.3 15.1a.5.5 0 0 1-.3.9H3a.5.5 0 0 1-.3-.9l1.838-1.379c.16-.12.343-.207.537-.255L6.5 13.11v-2.173c-.955-.234-2.043-1.146-2.833-3.012a3 3 0 1 1-1.132-5.89A33.076 33.076 0 0 1 2.5.5zm.099 2.54a2 2 0 0 0 .72 3.935c-.333-1.05-.588-2.346-.72-3.935zm10.083 3.935a2 2 0 0 0 .72-3.935c-.133 1.59-.388 2.885-.72 3.935zM3.504 1c.007.517.026 1.006.056 1.469.13 2.028.457 3.546.87 4.667C5.294 9.48 6.484 10 7 10a.5.5 0 0 1 .5.5v2.61a1 1 0 0 1-.757.97l-1.426.356a.5.5 0 0 0-.179.085L4.5 15h7l-.638-.479a.501.501 0 0 0-.18-.085l-1.425-.356a1 1 0 0 1-.757-.97V10.5A.5.5 0 0 1 9 10c.516 0 1.706-.52 2.57-2.864.413-1.12.74-2.64.87-4.667.03-.463.049-.952.056-1.469H3.504z" />
									</svg>
									<path
										d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
									</svg>
								</button>
							</div>
							<div class="col d-flex justify-content-center">
								<button type="button" class="btn position-relative">
									<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
										fill="currentColor" class="bi bi-envelope-paper"
										viewBox="0 0 16 16">
  										<path
											d="M4 0a2 2 0 0 0-2 2v1.133l-.941.502A2 2 0 0 0 0 5.4V14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V5.4a2 2 0 0 0-1.059-1.765L14 3.133V2a2 2 0 0 0-2-2H4Zm10 4.267.47.25A1 1 0 0 1 15 5.4v.817l-1 .6v-2.55Zm-1 3.15-3.75 2.25L8 8.917l-1.25.75L3 7.417V2a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v5.417Zm-11-.6-1-.6V5.4a1 1 0 0 1 .53-.882L2 4.267v2.55Zm13 .566v5.734l-4.778-2.867L15 7.383Zm-.035 6.88A1 1 0 0 1 14 15H2a1 1 0 0 1-.965-.738L8 10.083l6.965 4.18ZM1 13.116V7.383l4.778 2.867L1 13.117Z" />
									</svg>
									<span
										class="position-absolute translate-middle p-1 bg-danger border border-light rounded-circle">
										<span class="visually-hidden">New alerts</span>
									</span>
								</button>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<a class="btn btn-outline-primary" role="button"
							href="/member/login_view.jsp">로그인 하러 가기</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="p-3 nav-scroller">
				<ul class="list-unstyled ps-0">
					<!--마이페이지 카테고리-->
					<c:if test="${sessionScope.nickname != null}">
						<li class="mb-1 nav-menu"><i class="bi bi-house"></i>
							<button
								class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
								data-bs-toggle="collapse" data-bs-target="#home-collapse"
								aria-expanded="true">마이페이지</button>
							<div class="collapse show" id="home-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li class="login"><a href="#"
										class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">내
											활동 관리</a></li>
									<li class="login"><a href="/my_profile.member"
										class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">내
											정보 보기</a></li>
									<li class="login"><a href="/my_team_list.team"
										class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">내
											팀 보기</a></li>
								</ul>
							</div></li>
					</c:if>
					<!--전체게시판 카테고리-->
					<li class="mb-1 nav-menu"><i class="fa-solid fa-file-pen"></i>
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
							aria-expanded="false">전체 제시판</button>
						<div class="collapse" id="dashboard-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="/list.board?b_c=1002&cpage=1"
									class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">공지사항</a>
								</li>
								<li><a href="/list.board?b_c=1003&cpage=1"
									class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">자유게시판</a>
								</li>
								<li><a href="/list.board?b_c=1004&cpage=1"
									class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">홍보게시판</a>
								</li>
							</ul>
						</div></li>
					<!-- 팀 카테고리 -->
					<li class="mb-1 nav-menu"><i class="bi bi-people-fill"></i>
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" data-bs-target="#orders-collapse"
							aria-expanded="false">팀 카테고리</button>
						<div class="collapse" id="orders-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<c:if test="${sessionScope.nickname != null}">
									<li class="login"><a href="/hometown.team"
										class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">팀
											생성</a></li>
								</c:if>
								<li><a href="/list.team?cpage=1"
									class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">팀
										목록보기</a></li>
								<c:if test="${sessionScope.nickname != null}">
									<li class="login"><a href="#"
										class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">내
											팀 게시판으로</a></li>
								</c:if>
								<li><a href="#"
									class="nav_a link-dark link-body-emphasis d-inline-flex text-decoration-none rounded">팀
										랭킹 보기</a></li>
							</ul>
						</div></li>
					<!-- 매치메이킹 카테고리 -->
					<li class="mb-1 nav-menu"><i class="fa-solid fa-hand-fist"></i>
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" data-bs-target="#account-collapse"
							aria-expanded="false">매치메이킹</button>
						<div class="collapse" id="account-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<c:if test="${sessionScope.nickname != null}">
									<li class="login"><a href="/registration.competition"
										class="nav_a link-dark d-inline-flex text-decoration-none rounded">매칭
											등록</a></li>
								</c:if>
								<li><a href="/list.competition"
									class="nav_a link-dark d-inline-flex text-decoration-none rounded">매칭
										신청</a></li>
								<c:if test="${sessionScope.nickname != null}">
									<li class="login"><a href="/to_register_form.mercenary"
										class="nav_a link-dark d-inline-flex text-decoration-none rounded">용병
											등록</a></li>
								</c:if>
								<li><a href="/to_register_list.mercenary?cpage=1"
									class="nav_a link-dark d-inline-flex text-decoration-none rounded">용병
										신청</a></li>
								<li><a href="#"
									class="nav_a link-dark d-inline-flex text-decoration-none rounded">시설
										검색</a></li>
							</ul>
						</div></li>
					<!-- 구분선 -->
					<li class="border-top my-3"></li>
					<!-- 운영진 카테고리 -->
					<li class="mb-1 nav-menu"><i class="fa-solid fa-paper-plane"></i>
						<button
							class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
							data-bs-toggle="collapse" data-bs-target="#account-collapse"
							aria-expanded="false">운영진에게</button>
						<div class="collapse" id="account-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><a href="/"
									class="nav_a link-dark d-inline-flex text-decoration-none rounded">문의하기</a>
								</li>
								<li><a href="/list.report?cpage=1"
									class="nav_a link-dark d-inline-flex text-decoration-none rounded">신고내역</a>
								</li>
							</ul>
						</div></li>
				</ul>
			</div>
		</div>
	</div>
</nav>