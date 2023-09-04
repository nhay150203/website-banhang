
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<script src="${pageContext.request.contextPath}/js/backtotop.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</head>
<body onload="myFunction()">
	<div id="loader"></div>
	<header class="bg-dark">
		<div class="py-2">
			<div class="row">
				<div class="col d-flex justify-content-start align-items-center mot">
					<a href="" title="Search" class="icon"><img
						src="../images/search1.png" alt="" class="nav-icon"></a> <input
						class="search" type="text" placeholder="Search">
				</div>
				<div class="col text-center logo">
					<a class="brand-logo" href="/home"><img
						src="../images/logoND1.png" alt="" class="logohome"><br>N
						D S H O P</a>
				</div>
				<div class="col d-flex justify-content-end align-items-center hai">
					<c:choose>
						<c:when test="${empty sessionScope.user}">
							<ul class="nav nav-pills">
								<li class="nav-item"><a href="/login" class="menu text-decoration-none"
									aria-current="page">Login</a></li>
								<li class="nav-item"><a href="/register"
									class="menu text-decoration-none">Register</a></li>
							</ul>
						</c:when>
						<c:otherwise>
							<a href="" title="Thông báo" class="position-relative icon"><img
								src="../images/alarm.png" alt="" class="nav-icon"> <span
								class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
									2 <span class="visually-hidden">unread messages</span>
							</span></a>
							<a href="/shopping-cart" title="Giỏ hàng"
								class="position-relative icon"><img
								src="../images/shopping.png" alt="" class=" nav-icon"><span
								class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
									${sessionScope.badge} </span></a>
							<div class="dropdown">
								<a class="dropdown-toggle icon" href="#" role="button"
									id="dropdownMenuLink" data-bs-toggle="dropdown"
									aria-expanded="false"><img alt=""
									src="../images/account.png" class="nav-icon"></a>

								<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
									<c:if test="${sessionScope.user.admin}">
										<li><a class="dropdown-item" href="/product/list/page">Admin</a></li>
									</c:if>
									<li><a class="dropdown-item" href="/login">Đăng nhập</a></li>
									<li><a class="dropdown-item" href="/register">Đăng ký</a></li>
									<li><a class="dropdown-item" href="/editProfile">Chỉnh
											sửa tài khoản</a></li>
									<li><a class="dropdown-item" href="/forgotPassword">Quên
											mật khẩu?</a></li>
									<li><a class="dropdown-item" href="/login">Đăng xuất</a></li>
									<li>
										<hr class="dropdown-divider">
									</li>
									<li class="text-center">${sessionScope.user.fullname}</li>
								</ul>
							</div>
						</c:otherwise>
					</c:choose>
					<a href="#" title="Ngôn ngữ" class="icon"><img
						src="../images/vietnam.png" alt="" class="nav-icon"></a>

				</div>
			</div>
		</div>

		<div class="nav-scroller">
			<nav class="nav d-flex justify-content-between">
				<a class="p-2" href="/home">GIỚI THIỆU</a> <a class="p-2"
					href="/san-pham-noi-bat">NỔI BẬT</a> <a class="p-2" href="/quan-ao">QUẦN
					ÁO</a> <a class="p-2" href="/non-bao-hiem">NÓN BẢO HIỂM</a> <a
					class="p-2" href="/balo">BALO</a> <a class="p-2" href="/gang-tay">GĂNG
					TAY</a> <a class="p-2" href="#">GIÀY</a> <a class="p-2"
					href="/phu-kien-khac">PHỤ KIỆN KHÁC</a>
			</nav>
		</div>

	</header>
</body>
</html>