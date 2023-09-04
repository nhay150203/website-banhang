<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">
<title>Shop</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>


</head>

<body>
	<%@include file="comon/header.jsp"%>
	<div class="banner">
		<div id="myCarousel" class="carousel slide shop"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner shop">
				<div class="carousel-item active shop">
					<img src="../images/bannershop1.png" alt="">
				</div>
				<div class="carousel-item shop">
					<img src="../images/bannershop2.png" alt="">

				</div>
				<div class="carousel-item shop">
					<img src="../images/bannershop3.jpg" alt="">

				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<main>
		<section class="text-center container">
			<div class="row">
				<div class="col-lg-6 col-md-8 mx-auto">
					<h1 class="fw-light">WELCOME TO NDSHOP</h1>
					<p class="lead text-muted">Tại đây bạn có thể lựa chọn cho mình
						những trang bị tốt nhất cho những chuyến đi của bạn với những mức
						giá phù hợp với bạn. Dưới đây là những sản phẩm nổi bật cảu cửa
						hàng ⬇️</p>
					<!-- <p>
            <a href="#" class="btn btn-primary my-2">Nổi bật</a>
            <a href="#" class="btn my-2" style="background-color: rgb(249, 126, 96);">🛒Giỏ hàng</a>
          </p> -->
				</div>
			</div>
		</section>

		<div class="album py-5 bg-light">
			<div class="container">
				<div class="title">
					<strong>NỔI BẬT</strong>
				</div>
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<c:forEach var="item" items="${items}">
						<div class="col">
							<div class="card shadow-sm">
								<div class="anhsp">
									<img src="../images/${item.image}" alt="">
								</div>
								<div class="card-body">
									<p class="card-text">${item.name}</p>
									<div class="d-flex justify-content-between align-items-center">
										<div class="btn-group">
											<button type="button" class="btn btn-sm "
												style="color: white; background-color: orange; margin-right: 3px;">Mua
												ngay</button>
											<a href="/cart/add/${item.id}" type="button"
												class="btn btn-sm"
												style="color: black; background-color: skyblue;">Thêm ❤️</a>
										</div>
										<small class="price"><fmt:formatNumber
												value="${item.price}" pattern="#,###"></fmt:formatNumber>
											VND</small>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>			
			</div>
		</div>
	</main>
	<%@include file="comon/footer.jsp"%>
</body>
</html>