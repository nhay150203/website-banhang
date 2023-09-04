<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>Giỏ hàng</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Josefin Slab"> -->
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
	<main>
		<div class="tabs">
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a href="/cart/view" class="text-decoration-none">
						<button class="nav-link ${tabCart} text-muted" id="nav-list-tab"
							data-bs-toggle="tab" data-bs-target="#nav-list" type="button"
							role="tab" aria-controls="nav-list" aria-selected="true">Giỏ
							hàng</button>
					</a> <a href="/cart/order" class="text-decoration-none">
						<button class="nav-link ${tabOrder} text-muted" id="nav-edit-tab"
							data-bs-toggle="tab" data-bs-target="#nav-edit" type="button"
							role="tab" aria-controls="nav-edit" aria-selected="false">Đơn
							mua</button>
					</a>

				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent" ng-controller="check">
				<div class="tab-pane fade ${showCart} show active" id="nav-list"
					role="tabpanel" aria-labelledby="nav-list-tab">
					<div class="shoppingcart">
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary float-end"
							data-bs-toggle="modal" data-bs-target="#staticBackdrop">
							Thêm sản phẩm</button>

						<!-- Modal -->
						<div class="modal fade" id="staticBackdrop"
							data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog modal-xl">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="staticBackdropLabel">NDSHOP</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<h5 class="a">Tìm kiếm sản phẩm</h5>
										<div class="timkiem">
											<input class="timkiem1" type="text" placeholder="Search">
											<a href="" title="Search"><img src="../images/search.png"
												alt="" class="nav-icon"></a>
										</div>
										<div class="box">
											<form action="">
												<label for="">Sản phẩm</label> <br> <select
													class="form-select" aria-label="Default select example">
													<option selected>Nón bảo hiểm</option>
													<option value="1">Quần áo</option>
													<option value="2">Găng tay</option>
													<option value="3">Giày</option>
													<option value="4">Balo</option>
													<option value="5">Phụ kiện khác</option>
												</select> <label for="" class="label1">Khoảng giá</label> <br>
												<div class="input-group mb-3 price-range">
													<span class="input-group-text">$</span> <span
														class="input-group-text">0</span> <input type="text"
														class="form-control"
														aria-label="Dollar amount (with dot and two decimal places)">
												</div>

												<div class="input-group price-range">
													<input type="text" class="form-control"
														aria-label="Dollar amount (with dot and two decimal places)">
													<span class="input-group-text">$</span> <span
														class="input-group-text">100.000.000</span>
												</div>
												<button type="button" class="btn btn-info"
													data-bs-dismiss="modal">Áp dụng</button>
											</form>
										</div>
										<div class="box1">
											<h5 class="title2">Sản phẩm nổi bật</h5>
											<div class="box2">
												<div class="sanpham row row-cols-1 row-cols-md-2 g-4">
													<c:forEach var="item" items="${list}">
														<div class="col">
															<div class="card shadow-sm h-100">
																<div class="anhsp">
																	<img src="../images/${item.image}" alt="">
																</div>
																<div class="card-body">
																	<p class="card-text">${item.name}</p>
																	<div
																		class="d-flex justify-content-between align-items-center">
																		<div class="btn-group">

																			<a href="/cart/add/${item.id}" type="button"
																				class="btn btn-sm "
																				style="color: black; background-color: skyblue;">Thêm
																				❤️</a>
																		</div>
																		<small class="price"> <fmt:formatNumber
																				value="${item.price}" pattern="#,###"></fmt:formatNumber>
																			VND
																		</small>
																	</div>
																</div>
															</div>
														</div>
													</c:forEach>

												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-info"
											data-bs-dismiss="modal">Xem thêm</button>
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Thoát</button>
									</div>
								</div>
							</div>
						</div>
						<p class="title">Chi tiết giỏ hàng</p>

						<table class="table table-hover">
							<thead>
								<tr>
									<th>Chọn</th>
									<th scope="col" colspan="2">Mã sản phẩm</th>
									<th scope="col">Sản phẩm</th>
									<th scope="col">Màu sắc</th>
									<th scope="col">Kích thước</th>
									<th scope="col">Số lượng</th>
									<th scope="col">Giá tiền</th>
									<th scope="col">Tổng tiền</th>
									<th scope="col">Gỡ bỏ</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${items}">
									<form:form action="/cart/update/${item.id}" method="post">
										<input type="hidden" name="id" value="${item.product.id}">
										<tr>
											<td>
												<div class="form-check" style="width: 20px; margin: auto;">
													<input class="form-check-input" type="checkbox"
														id="flexCheckDefault" />
												</div>
											</td>
											<th scope="row">${item.product.id}</th>
											<td><img src="../images/${item.product.image}" alt=""
												width="100px"></td>
											<td>${item.product.name}</td>
											<td>Hồng</td>
											<td class="text-center">XXL</td>
											<td><input type="number" min="1" name="quantity"
												value="${item.quantity}" onchange="this.form.submit()"
												step="1" class="rounded-pill text-center"
												style="width: 80px;"></td>
											<td><fmt:formatNumber value="${item.price}"
													pattern="#,###"></fmt:formatNumber></td>
											<td><fmt:formatNumber
													value="${item.quantity * item.price}" pattern="#,###">
												</fmt:formatNumber></td>
											<td><a href="/cart/remove/${item.id}"><img
													src="../images/icon-rubbish.png" alt="" width="40px"></a></td>
										</tr>
									</form:form>
								</c:forEach>
							</tbody>
						</table>
						<a href="/cart/clear" class="btn btn-secondary float-end clear">Bỏ
							tất cả</a> <a href="/cart/check"
							class="btn btn-info float-end mb-4  ${disabled==1 ? 'disabled'
														:''}">Thanh
							toán</a>
					</div>
				</div>

				<div class="tab-pane fade ${showOrder}" id="nav-edit"
					role="tabpanel" aria-labelledby="nav-edit-tab">
					<%-- <div class="shoppingcart">
						<p class="title">Chi tiết đơn mua</p>

						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col" colspan="2">Mã đơn hàng</th>
									<th scope="col">Sản phẩm</th>
									<th scope="col">Màu sắc</th>
									<th scope="col">Kích thước</th>
									<th scope="col">Số lượng</th>
									<th scope="col">Giá tiền</th>
									<th scope="col">Tổng tiền</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${cart.items}">
									<form action="/cart/update/${item.id}" method="post">
										<input type="hidden" name="id" value="${item.id}">
										<tr>
											<td>
												<div class="form-check" style="width: 20px; margin: auto;">
													<input class="form-check-input" type="checkbox" value=""
														id="flexCheckDefault">
												</div>
											</td>
											<th scope="row">${item.id}</th>
											<td><img src="../images/${item.image}" alt=""
												width="100px"></td>
											<td>${item.name}</td>
											<td>Hồng</td>
											<td class="text-center">XXL</td>
											<td><input type="number" min="1" name="qty"
												value="${item.qty}" onchange="this.form.submit()" step="1"
												class="rounded-pill text-center" style="width: 80px;"></td>
											<td><fmt:formatNumber value="${item.price}"
													pattern="#,###"></fmt:formatNumber></td>
											<td><fmt:formatNumber value="${item.qty * item.price}"
													pattern="#,###">
												</fmt:formatNumber></td>
											<td><a href="/cart/remove/${item.id}"><img
													src="../images/icon-rubbish.png" alt="" width="40px"></a></td>
										</tr>
									</form>
								</c:forEach>
							</tbody>
						</table>
					</div> --%>
				</div>
			</div>
		</div>

	</main>
	<%@include file="comon/footer.jsp"%>
</body>
</html>