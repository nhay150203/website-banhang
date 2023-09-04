<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
	href="${pageContext.request.contextPath}/css/categorysManagement.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/backtotop.js"></script>
</head>
<body>
	<c:url var="url" value="/a/admin"></c:url>
	<%@ include file="comon/menuAdmin.jsp"%>
	<aside>
		<div class="tabs">
			<nav>
				<div class="nav nav-tabs" id="nav-tab" role="tablist">
					<button class="nav-link active text-muted" id="nav-list-tab"
						data-bs-toggle="tab" data-bs-target="#nav-list" type="button"
						role="tab" aria-controls="nav-list" aria-selected="true">Categorys</button>
				</div>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-list" role="tabpanel"
					aria-labelledby="nav-list-tab">
					<div class="box">
						<div class="right text-center">
							<div class="form">
								<form:form action="/category/index" modelAttribute="item">
									<div class="form-floating">
										<form:input path="id" class="form-control" id="floatingInput"
											placeholder="Category ID" />
										<label for="floatingInput">ID</label>
									</div>
									<div class="form-floating">
										<form:input path="name" class="form-control" id="floatingName"
											placeholder="Category Name" />
										<label for="floatingName">Name</label>
									</div>
									<div>
										<button class="btn btn-primary" type="submit"
											formaction="/category/create">Create</button>
										<button class="btn btn-success" type="submit"
											formaction="/category/update">Update</button>
										<button class="btn btn-danger" type="submit"
											formaction="/category/delete/${item.id}">Delete</button>
										<button class="btn btn-secondary" type="submit"
											formaction="/category/index">Refresh</button>
									</div>
								</form:form>
							</div>
						</div>
					</div>
					<div class="list">
						<table class="table border">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Name</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${items}">
									<tr>
										<th scope="row">${item.id}</th>
										<td>${item.name}</td>
										<td><a href="/category/edit/${item.id}">Edit</a></td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
						<div class="row">
							<div class="col-2">
								<b class="count">${allUser} Category</b>
							</div>
							<div class="col-10 text-end">
								<a href="${url1}/users?page=${currentPage - 1}"
									class="nut btn btn-outline-primary ${currentPage == 1 ? 'disabled':''}">Previous</a>
								<c:forEach varStatus="i" begin="1" end="${maxPage}">
									<a href="${url1}/users?page=${i.index}"
										class="nut btn btn-outline-primary ${currentPage == i.index ? 'active':''}"><b>
											${i.index}</b> </a>
								</c:forEach>
								<a href="${url1}/users?page=${currentPage + 1}"
									class="nut btn btn-outline-primary ${currentPage == maxPage ? 'disabled':''}">Next</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</aside>
</body>
</html>