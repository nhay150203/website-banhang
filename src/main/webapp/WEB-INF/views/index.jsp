<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">
<title>Home</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/carousel.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/backtotop.js"></script>
</head>
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
<body>
	<%@include file="comon/header.jsp"%>
	<main>
		<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#myCarousel"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="home carousel-item active">
					<img src="images/banner8.jpg" alt="">
					<div class="container">
						<div class="carousel-caption text-end">
							<h1 style="font-size: 50px;">BALO</h1>
							<p style="font-size: 20pt;">Nó sẽ là trang bị vô cùng cần
								thiết nếu bạn có một chuyến đi dài và xa.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Tìm hiểu</a>
							</p>
						</div>
					</div>
				</div>
				<div class="home carousel-item">
					<img src="images/banner1.jpg" alt="">
					<div class="container">
						<div class="carousel-caption">
							<h1 style="font-size: 50px;">NÓN BẢO HIỂM</h1>
							<p style="font-size: 20pt;">Trang bị không thể thiếu của một
								chuyến đi.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Tìm hiểu</a>
							</p>
						</div>
					</div>
				</div>
				<div class="home carousel-item">
					<img src="images/banner11.jpg" alt="">
					<div class="container">
						<div class="carousel-caption text-start">
							<h1 style="font-size: 50px;">THỜI TRANG</h1>
							<p style="font-size: 20pt;">Bạn sẽ đẹp hơn và an toàn hơn nếu
								bạn được trạng bị cả áo, quần, găng tay và giày chuyên dụng.</p>
							<p>
								<a class="btn btn-lg btn-primary" href="#">Tìm hiểu</a>
							</p>
						</div>
					</div>
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

		<div class="container marketing">

			<!-- Three columns of text below the carousel -->
			<div class="row">
				<div class="col-lg-4">
					<img src="images/mu6.png" alt=""
						class="bd-placeholder-img rounded-circle" width="140" height="140"
						style="border: 1px solid gray; padding: 10px;">
					<h2>Nón bảo hiểm</h2>
					<div class="content">
						<p>Chúng tôi có nhiều loại nón của nhiều hãng để lựa chọn như:
							1/2, 3/4, fullface,... Cam kết chính hãng!</p>
					</div>
					<p>
						<a class="btn btn-info" href="#">View details &raquo;</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4">
					<img src="images/ao1.png" alt=""
						class="bd-placeholder-img rounded-circle" width="140" height="140"
						style="border: 1px solid gray; padding: 10px;">
					<h2>Thời trang</h2>
					<div class="content">
						<p>Quần áo đa dạng, nhiều kích cỡ và giá cả phù hợp với tất cả
							các đối tượng.</p>
					</div>
					<p>
						<a class="btn btn-info" href="#">View details &raquo;</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4">
					<img src="images/balo1.png" alt=""
						class="bd-placeholder-img rounded-circle" width="140" height="140"
						style="border: 1px solid gray; padding: 10px;">
					<h2>Balo</h2>
					<div class="content">
						<p>Balo là trang bị không thể thiếu nếu bạn muốn đi phượt
							đường dài. Tại đây chúng tôi có nhiều dòng balo để các bạn lựa
							chọn.</p>
					</div>
					<p>
						<a class="btn btn-info" href="#">View details &raquo;</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->


			<!-- START THE FEATURETTES -->

			<hr class="featurette-divider">

			<div class="row featurette">
				<div class="col-md-7">
					<h2 class="featurette-heading">
						Một chiếc nón phù hợp. <span class="text-muted"> Trải
							nghiệm của bạn sẽ X2</span>
					</h2>
					<p class="lead">An toàn và thời thượng!</p>
				</div>
				<div class="col-md-5">
					<img src="images/mu3.png" alt=""
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="500" height="500">
				</div>
			</div>

			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7 order-md-2">
					<h2 class="featurette-heading">
						Bạn muốn được trang bị từ đầu đến chân. <span class="text-muted">
							Thì hãy đến với chúng tôi!</span>
					</h2>
					<p class="lead">Đa dạng và hợp lí</p>
				</div>
				<div class="col-md-5 order-md-1">
					<img src="images/ao2.png" alt=""
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="500" height="500">
				</div>
			</div>
			<hr class="featurette-divider">
			<div class="row featurette">
				<div class="col-md-7">
					<h2 class="featurette-heading">
						Đồ nhiều ư, đừng lo! <span class="text-muted"> Chúng tôi có
							những chiếc balo có thể đựng cả thế giới 😁</span>
					</h2>
					<p class="lead">Gọn gàng và bền bỉ!</p>
				</div>
				<div class="col-md-5">
					<img src="images/balo.png" alt=""
						class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto"
						width="500" height="500">
				</div>

			</div>
			<hr class="featurette-divider">
		</div>
	</main>
	<%@include file="comon/footer.jsp"%>
</body>
<script>
	var backTo = document.getElementById("back");
	window.onscroll = function() {
		backToTop(), nav()
	};
</script>

</html>