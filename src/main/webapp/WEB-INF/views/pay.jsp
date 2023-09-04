<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<title>Thanh toán</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/thanhtoan.css">
<script src="${pageContext.request.contextPath}/js/backtotop.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/angular.min.js"></script>

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

<body ng-app="myapp">
	<%@include file="comon/header.jsp"%>
	<main>
		<div class="box">
			<div class="dssp">
				<h4>Danh sách sản phẩm</h4>
				<br>
				<table class="table">
					<thead>
						<tr>
							<th scope="col" colspan="2">Sản phẩm</th>
							<th scope="col">Màu sắc</th>
							<th scope="col">Kích thước</th>
							<th scope="col">Số lượng</th>
							<th scope="col" style="text-align: right;">Giá tiền</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${list}">
							<tr>
								<td style="width: 60px;"><img src="../images/${item.product.image}"
									alt="" width="80px"></td>
								<td>${item.product.name}</td>
								<td>Hồng</td>
								<td class="text-center">XXL</td>
								<td class="text-center">${item.quantity}</td>
								<td class="price"><fmt:formatNumber value="${item.price}"
										pattern="#,###"></fmt:formatNumber></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="information" ng-controller="myctrl">
				<form action="/cart/order">
					<h4>Vui lòng nhập thông tin để đặt hàng</h4>
					<label for="" class="form-label"><b>Họ và tên:</b> </label> <br>
					<input type="text" class="input name" ng-model="name"
						value="${sessionScope.user.fullname}"> <label for=""
						class="form-label general"><b>Giới tính: </b> </label> <input
						class="form-check-input radio" type="radio" name="gioitinh"
						id="flexRadioDefault2" checked> <label
						class="form-check-label male" for="flexRadioDefault2"> Nam
					</label> <input class="form-check-input radio" type="radio" name="gioitinh"
						id="flexRadioDefault1"> <label
						class="form-check-label female" for="flexRadioDefault1">
						Nữ </label> <br> <label for="" class="form-label"><b>Số
							điện thoại:</b></label> <br> <input type="text" class="input phone"
						ng-model="phone"> <br> <br> <label for=""
						class="form-label ship"><b>Hình thức nhận hàng:</b> </label> <input
						class="form-check-input radio" type="radio" name="giaohang"
						id="flexRadioDefault2" checked> <label
						class="form-check-label athome" for="flexRadioDefault2">
						Nhận tại nhà </label> <input class="form-check-input radio" type="radio"
						name="giaohang" id="flexRadioDefault1"> <label
						class="form-check-label atshop" for="flexRadioDefault1">
						Nhận tại shop </label> <br>
					<!-- <h6>Lưu ý: Nhập địa chỉ nếu bạn chọn hình thức nhận tại nhà</h6> -->
					<label for="" class="form-label"><b>Địa chỉ nhận hàng:</b></label><span>
						(Bỏ qua nếu chọn hình thức nhận hàng tại shop)</span> <br>
					<textarea class="form-control address"
						id="exampleFormControlTextarea1" rows="3" ng-model="address"
						name="address"></textarea>
					<label for="" class="form-label"><b>Phương thức thanh
							toán</b></label> <br> <select class="form-select"
						aria-label="Default select example">
						<option selected>Thanh toán khi nhận hàng</option>
						<option value="1">Thanh toán bằng tài khoản ngân hàng</option>
						<option value="2">Thanh toán bằng ví Momo</option>
						<option value="3">Thanh toán bằng ví ZaloPay</option>
					</select>
					<div class="input-group mb-3 discount">
						<input type="text" class="form-control"
							placeholder="Nhập mã giảm giá" aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<button class="btn btn-outline-secondary" type="button"
							id="button-addon2">Áp dụng</button>
					</div>
					<br> <span style="font-size: 14pt;">Tổng tiền: </span> <span
						class="float-end"
						style="color: rgb(32, 126, 240); font-size: 13pt; font-weight: bold;"><fmt:formatNumber
							value="${sum}" pattern="#,###"></fmt:formatNumber> VND</span> <br>
					<span style="font-size: 14pt;">Phí vận chuyển: </span> <span
						class="float-end"
						style="color: rgb(32, 126, 240); font-size: 13pt; font-weight: bold;">50,000
						VND</span> <br> <span style="font-size: 14pt;">Giảm giá: </span> <span
						class="float-end"
						style="color: rgb(32, 126, 240); font-size: 13pt; font-weight: bold;">0
						VND</span> <br> <span style="font-size: 14pt;">Thanh toán: </span> <span
						class="float-end"
						style="color: rgb(32, 126, 240); font-size: 13pt; font-weight: bold;"><fmt:formatNumber
							value="${sum + 50000}" pattern="#,###"></fmt:formatNumber> VND</span><br><br>
					<button class="btn btn-primary" type="submit"
						style="width: 100%; font-size: 15pt;">ĐẶT HÀNG</button>
					<p class="dieukhoan">
						Nhấn "ĐẶT HÀNG" đồng nghĩa với việc bạn đồng ý tuân theo <a
							href="" style="text-decoration: none;">Điều khoản của NDSHOP</a>
					</p>
				</form>
			</div>
		</div>

	</main>
	<%@include file="comon/footer.jsp"%>
</body>
</html>