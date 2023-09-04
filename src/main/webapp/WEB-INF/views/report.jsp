<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/layoutAdmin.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/productsManagement.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/backtotop.js"></script>
</head>
<body>
	<%@ include file="comon/menuAdmin.jsp"%>
	<aside>
		<div class="tabs">
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<a href="/report" class="text-decoration-none"><button
							class="nav-link ${tab1} text-muted" id="nav-favorites-tab"
							data-bs-toggle="tab" data-bs-target="#nav-favorites"
							type="submit" role="tab" aria-controls="nav-edit"
							aria-selected="true">Revenue</button></a> <a href="/report1"
						class="text-decoration-none"><button
							class="nav-link ${tab2} text-muted" id="nav-favoriteUsers-tab"
							data-bs-toggle="tab" data-bs-target="#nav-favoriteUsers"
							type="submit" role="tab" aria-controls="nav-list"
							aria-selected="false">Customer</button></a> <a href="/report2"
						class="text-decoration-none"><button
							class="nav-link ${tab3} text-muted" id="nav-shared-tab"
							data-bs-toggle="tab" data-bs-target="#nav-shared" type="submit"
							role="tab" aria-controls="nav-list" aria-selected="false">Products</button></a>
				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade ${show1}" id="nav-favorites"
					role="tabpanel" aria-labelledby="nav-favorites-tab">
					<div class="box">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Category</th>
									<th scope="col">Quantity</th>
									<th scope="col">Revenue</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list1}">
									<tr>
										<th scope="row">${item.group.name}</th>
										<td>${item.quantity}</td>
										<td><fmt:formatNumber value="${item.revenue}"
												pattern="#,###"></fmt:formatNumber></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="tab-pane fade ${show2}" id="nav-favoriteUsers"
					role="tabpanel" aria-labelledby="nav-favoriteUsers-tab">
					<div class="box">
						
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Username</th>
									<th scope="col">Order</th>
									<th scope="col">Revenue</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list2}">
									<tr>
										<th scope="row">${item.group.fullname}</th>
										<td>${item.quantity}</td>
										<td><fmt:formatNumber value="${item.revenue}"
												pattern="#,###"></fmt:formatNumber></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="tab-pane fade ${show3}" id="nav-shared" role="tabpanel"
					aria-labelledby="nav-shared-tab">
					<div class="box">
						
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Name</th>
									<th scope="col">Quantity</th>
									<th scope="col">Revenue</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list3}">
									<tr>
										<th scope="row">${item.group.name}</th>
										<td>${item.quantity}</td>
										<td><fmt:formatNumber value="${item.revenue}"
												pattern="#,###"></fmt:formatNumber></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</aside>
</body>
</html>