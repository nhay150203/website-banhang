<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/usersManagement.css">
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
					<a href="/product/list/page" class="text-decoration-none">
						<button class="nav-link ${tabList} text-muted" id="nav-list-tab"
							data-bs-toggle="tab" data-bs-target="#nav-list" type="button"
							role="tab" aria-controls="nav-list" aria-selected="true">Product
							List</button>
					</a> <a href="/product/edit" class="text-decoration-none">
						<button class="nav-link ${tabEdit} text-muted" id="nav-edit-tab"
							data-bs-toggle="tab" data-bs-target="#nav-edit" type="button"
							role="tab" aria-controls="nav-edit" aria-selected="false">Product
							Edition</button>
					</a>

				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent" ng-controller="check">
				<div class="tab-pane fade ${showList}" id="nav-list" role="tabpanel"
					aria-labelledby="nav-list-tab">
					<div class="box">
						<form action="/product/search" method="post" class="d-flex mb-5"
							style="justify-content: space-between; width: 80%;">
							<input name="keywords" value="${keywords}"
								placeholder="Keywords?" class="form-control me-3">
							<button class="btn btn-outline-primary">Search</button>
						</form>
						<table class="table border">
							<thead>
								<tr>
									<th scope="col"><a href="/product/list/page?field=id"
										class="text-decoration-none">ID</a></th>
									<th scope="col"><a href="/product/list/page?field=name"
										class="text-decoration-none">Name</a></th>
									<th scope="col"><a href="/product/list/page?field=price"
										class="text-decoration-none">Price</a></th>
									<th scope="col"><a
										href="/product/list/page?field=createDate"
										class="text-decoration-none">Create date</a></th>
									<th scope="col"><a
										href="/product/list/page?field=available"
										class="text-decoration-none">Available</a></th>
									<th scope="col"><a
										href="/product/list/page?field=outstanding"
										class="text-decoration-none">Outstanding</a></th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="item" items="${page.content}">
									<tr>
										<td>${item.id}</td>
										<td>${item.name}</td>
										<td><fmt:formatNumber value="${item.price}"
												pattern="#,###"></fmt:formatNumber></td>
										<td>${item.createDate}</td>
										<td>${item.available?'Available':'Unavailable'}</td>
										<td>${item.outstanding?'Yes':'No'}</td>
										<td><a href="/product/edit/${item.id}">Edit</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="row" style="margin-top: 30px;">
							<div class="col-2">
								<b class="count">${page.totalElements} Product</b>
							</div>
							<div class="col-10 text-end">
								<a href="/product/list/page?p=${page.number-1}"
									class="nut btn btn-outline-primary ${page.number == 0 ? 'disabled':''}">Previous</a>
								<c:forEach varStatus="i" begin="1" end="${maxPage}">
									<a href="/product/list/page?p=${i.index - 1}"
										class="nut btn btn-outline-primary ${page.number == i.index - 1 ? 'active':''}"><b>
											${i.index}</b> </a>
								</c:forEach>
								<a href="/product/list/page?p=${page.number+1}"
									class="nut btn btn-outline-primary ${page.number == maxPage - 1 ? 'disabled':''}">Next</a>
							</div>
						</div>
					</div>
				</div>

				<div class="tab-pane fade ${showEdit}" id="nav-edit" role="tabpanel"
					aria-labelledby="nav-edit-tab">
					<div class="box">
						<form:form action="/product/setImage/${product.id}"
							modelAttribute="product" method="post"
							enctype="multipart/form-data">
							<div class="poster">
								<div class="image">
									<img
										src="${pageContext.request.contextPath}/images/${imageProduct}"
										alt="" id="imgPreview">
								</div>

								<div class="mb-3">
									<form:hidden path="image" />
									<input name="attach" class="form-control" type="file"
										placeholder="Image" onchange="this.form.submit()" />
								</div>
								<label style="margin: 0 20px;"> <form:radiobutton
										path="available" value="true" checked="checked" /> Available
								</label> <label> <form:radiobutton path="available"
										value="false" /> Unavailable
								</label>
							</div>
							<div class="input">
								<div class="form-floating">
									<form:input path="id" type="text" class="form-control"
										id="floatingInput" placeholder="" />
									<label for="floatingInput">ID</label>
								</div>
								<div class="form-floating">
									<form:input path="Category.id" class="form-control"
										id="floatingInput" placeholder="" />
									<label for="floatingInput">Category</label>
								</div>
								<div class="form-floating">
									<form:input path="name" type="text" class="form-control"
										id="floatingInput" placeholder="" />
									<label for="floatingInput">Name</label>
								</div>
								<div class="form-floating">
									<form:input path="price" type="number" min="0"
										class="form-control" id="floatingInput" placeholder="" />
									<label for="floatingInput">Price</label>
								</div>
								<label style="margin-right: 20px;">Outstanding:</label>
								<label style="margin: 0 20px;"> <form:radiobutton
										path="outstanding" value="true" checked="checked" /> Yes
								</label> <label> <form:radiobutton path="outstanding"
										value="false" /> No
								</label>
							</div>
							<div class="descript">
								<div class="text-end">
									<button type="submit" class="btn btn-primary"
										formaction="/product/create">Create</button>
									<button type="submit" class="btn btn-success" id="update"
										onclick="checkForm()" formaction="/product/update"
										${disabled==1 ? 'disabled' :''}>Update</button>
									<button type="submit" class="btn btn-danger"
										formaction="/product/delete/${product.id}"
										${disabled==1 ? 'disabled'
														:''}>Delete</button>
									<button type="submit" class="btn btn-secondary"
										formaction="/product/edit">Reset</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</aside>
</body>

</html>