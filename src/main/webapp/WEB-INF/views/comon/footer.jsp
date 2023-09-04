<%@ page language="java" pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/backtotop.js"></script>
</head>

<body>
	<a href="#" id="back" title="Back to top"><img
		src="${pageContext.request.contextPath}/images/back-to-top.png" alt=""
		class="rounded-circle"></a>
	<footer class="text-muted">
		<div>
			<div class="row">
				<div class="col-sm-7" style="padding-right: 80px; padding-top: 25px">
					<h4 class="text-white">WELCOME TO NDSHOP</h4>
					<p class="text-muted">Chào mừng bạn đến với cửa hàng của chúng
						tôi. Tại đây bạn có thể lựa chọn cho mình những trang bị tốt nhất
						cho những chuyến đi của bạn với những mức giá phù hợp với bạn.</p>
				</div>
				<div class="col-sm-2 py-4 follow">
					<h4 class="text-white">Follow Us:</h4>
					<a href="#" class="text-white text-decoration-none"><img
						src="${pageContext.request.contextPath}/images/youtube.png" alt=""
						width="30px"></a> <a href="#"
						class="text-white text-decoration-none"><img
						src="${pageContext.request.contextPath}/images/facebook1.png"
						alt="" width="30px"></a> <a href="#"
						class="text-white text-decoration-none"><img
						src="${pageContext.request.contextPath}/images/tik-tok.png" alt=""
						width="30px"></a>

				</div>
				<div class="col-sm-3 py-4">
					<h4 class="text-white">Contact</h4>
					<ul class="list-unstyled">
						<li><a href="#" class="text-white text-decoration-none">Website:
								https://ndshop.com.vn</a></li>
						<li><a href="#" class="text-white text-decoration-none">Hotline:
								19001009</a></li>
						<li><a href="#" class="text-white text-decoration-none">Email:
								nghiepdvps20385@fpt.edu.vn</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
</body>
<script>
	var backTo = document.getElementById("back");
	window.onscroll = function() {
		backToTop()
	};
</script>
</html>
