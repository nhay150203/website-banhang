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
<title>Login</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
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
							src="../images/facebook.png" alt=""> Login with Facebook</a> <a
						href="#"><img src="../images/google.png" alt=""> Login
							with Google</a>
					</span>
				</div>
			</div>

			<div class="right text-center">
				<div class="form-signin">
					<form action="/login" method="post">
						<img class="mb-4" src="../images/logoND1.png" alt="" width="65"
							height="57">
						<h1 class="h3 mb-3 fw-normal">Please sign in</h1>

						<div class="form-floating">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="Username" name="username"> <label
								for="floatingInput">Username</label>
						</div>
						<div class="form-floating">
							<input type="password" class="form-control" id="floatingPassword"
								placeholder="Password" name="password"> <label
								for="floatingPassword">Password</label>
						</div>

						<div class="checkbox mb-3">
							<label> <input type="checkbox" name="remember"
								value="true"> Remember me
							</label>
						</div>
						<button class="w-100 btn btn-lg btn-primary" type="submit">Sign
							in</button>
							<h5 style="margin-top: 10px; color: red;">${message}</h5>
						<p class="mt-5 mb-3 text-muted">Welcome to &copy; NDSHOP</p>
					</form>
				</div>
				<p class="">
					Don't have an account? <a href="register.html">Creat Your
						Account</a> it takes less than a minute
				</p>
			</div>

		</div>
	</div>
	<%@include file="comon/footer.jsp"%>
</body>
</html>