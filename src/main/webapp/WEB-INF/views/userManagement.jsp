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
					<a href="/account/list/page" class="text-decoration-none">
						<button class="nav-link ${tabList} text-muted" id="nav-list-tab"
							data-bs-toggle="tab" data-bs-target="#nav-list" type="button"
							role="tab" aria-controls="nav-list" aria-selected="true">Account
							List</button>
					</a> <a href="/account/edit" class="text-decoration-none">
						<button class="nav-link ${tabEdit} text-muted" id="nav-edit-tab"
							data-bs-toggle="tab" data-bs-target="#nav-edit" type="button"
							role="tab" aria-controls="nav-edit" aria-selected="false">Account
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
							<input name="keyword" value="${keyword}"
								placeholder="Keyword?" class="form-control me-3">
							<button class="btn btn-outline-primary">Search</button>
						</form>
						<table class="table border">
							<thead>
								<tr>
									<th scope="col"><a href="/account/list/page?field=username"
										class="text-decoration-none">Username</a></th>
									<th scope="col"><a href="/account/list/page?field=password"
										class="text-decoration-none">Password</a></th>
									<th scope="col"><a href="/account/list/page?field=fullname"
										class="text-decoration-none">Fullname</a></th>
									<th scope="col"><a
										href="/account/list/page?field=email"
										class="text-decoration-none">Email address</a></th>
									<th scope="col"><a
										href="/account/list/page?field=activated"
										class="text-decoration-none">Activated</a></th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="item" items="${page.content}">
									<tr>
										<td>${item.username}</td>
										<td>${item.password}</td>
										<td>${item.fullname}</td>
										<td>${item.email}</td>
										<td>${item.activated?'Active':'Inactive'}</td>
										<td><a href="/account/edit/${item.username}">Edit</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="row" style="margin-top: 30px;">
							<div class="col-2">
								<b class="count">${page.totalElements} User</b>
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
						<form:form action="/account/setPhoto/${account.username}"
							modelAttribute="account" method="post"
							enctype="multipart/form-data">
							<div class="poster">
								<div class="image">
									<img
										src="${pageContext.request.contextPath}/images/${photo}"
										alt="" id="imgPreview">
								</div>

								<div class="mb-3">
									<form:hidden path="photo" />
									<input name="attach" class="form-control" type="file"
										placeholder="Photo" onchange="this.form.submit()"/>
								</div>
								<label style="margin: 0 20px;"> <form:radiobutton
										checked="checked" path="activated" value="true"  /> Active
								</label> <label> <form:radiobutton path="activated"
										value="false" /> Inactive
								</label>
							</div>
							<div class="input">
								<div class="form-floating">
									<form:input path="username" type="text" class="form-control"
										id="floatingInput" placeholder="" />
									<label for="floatingInput">Username</label>
								</div>
								<div class="form-floating">
									<form:input path="password" class="form-control"
										id="floatingInput" placeholder="" type="password"/>
									<label for="floatingInput">Password</label>
								</div>
								<div class="form-floating">
									<form:input path="fullname" type="text" class="form-control"
										id="floatingInput" placeholder="" />
									<label for="floatingInput">Fullname</label>
								</div>
								<div class="form-floating">
									<form:input path="email" type="email"
										class="form-control" id="floatingInput" placeholder="" />
									<label for="floatingInput">Email</label>
								</div>
							</div>
							<div class="descript">
								<div class="text-end">
									<button type="submit" class="btn btn-primary"
										formaction="/register">Register</button>
									<button type="submit" class="btn btn-success" id="update"
										onclick="checkForm()" formaction="/account/update"
										${disabled==1 ? 'disabled' :''}>Update</button>
									<button type="submit" class="btn btn-danger"
										formaction="/account/delete/${account.username}"
										${disabled==1 ? 'disabled'
														:''}>Delete</button>
									<button type="submit" class="btn btn-secondary"
										formaction="/account/edit">Reset</button>
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