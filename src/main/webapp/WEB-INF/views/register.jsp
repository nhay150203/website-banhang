<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">
<title>Sign up</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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
	<div class="main">
		<div class="box-form">
			<div class="left">
				<div class="overlay">
					<h1>WELCOME</h1>
					<p>Tạo tài khoản để nhận được nhiều ưu đãi hơn.</p>
					<span class="different"> <a href="#"><img
							src="images/facebook.png" alt=""> Login with Facebook</a> <a
						href="#"><img src="images/google.png" alt=""> Login with
							Google</a>
					</span>
				</div>
			</div>

			<div class="right text-center">
				<div class="form">
					<form>
						<h1 class="h3 mb-3 fw-normal">Please fill</h1>
						<div class="form-floating">
							<input type="email" class="form-control" id="floatingInput"
								placeholder="name@example.com"> <label
								for="floatingInput">Username</label>
						</div>
						<div class="form-floating">
							<input type="email" class="form-control" id="floatingInput"
								placeholder="name@example.com"> <label
								for="floatingInput">Email address</label>
						</div>
						<div class="form-floating">
							<input type="password" class="form-control" id="floatingPassword"
								placeholder="Password"> <label for="floatingPassword">Password</label>
						</div>
						<div class="form-floating">
							<input type="password" class="form-control" id="floatingPassword"
								placeholder="Password"> <label for="floatingPassword">Confirm
								password</label>
						</div>

						<button class="w-100 btn btn-lg btn-primary" type="submit">Register</button>
						<p class="mt-5 mb-3 text-muted">Welcome to NDSHOP &reg;</p>
					</form>
				</div>
			</div>

		</div>
	</div>
	<%@include file="comon/footer.jsp"%>
</body>
</html>