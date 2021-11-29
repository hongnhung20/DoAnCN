<%@ page import="com.webstore.app.entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Sản Phẩm</title>
<!-- loader-->
<link href="/resources/css1/pace.min.css" rel="stylesheet" />
<script src="/resources/cjs/pace.min.js"></script>
<!--favicon-->
<link rel="icon" href="/resources/images/favicon.ico"
	type="image/x-icon">
<!-- Vector CSS -->
<link href="/resources/plugins/vectormap/jquery-jvectormap-2.0.2.css"
	rel="stylesheet" />
<!-- simplebar CSS-->
<link href="/resources/plugins/simplebar/css/simplebar.css"
	rel="stylesheet" />
<!-- Bootstrap core CSS-->
<link href="/resources/css1/bootstrap.min.css" rel="stylesheet" />
<!-- animate CSS-->
<link href="/resources/css1/animate.css" rel="stylesheet"
	type="text/css" />
<!-- Icons CSS-->
<link href="/resources/css1/icons.css" rel="stylesheet" type="text/css" />
<!-- Sidebar CSS-->
<link href="/resources/css1/sidebar-menu.css" rel="stylesheet" />
<!-- Custom Style-->
<link href="/resources/css1/app-style.css" rel="stylesheet" />
<link href="/resources/css/material-design-iconic-font.css"
	rel="stylesheet" />
<link href="/resources/css/material-design-iconic-font.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
<link rel="stylesheet" href="/resources/css/paging.css"/>
</head>
<body class="bg-theme bg-theme1">

	<!-- Start wrapper-->
	<div id="wrapper">

		<!--Start sidebar-wrapper-->
		<jsp:include page="menu.jsp"></jsp:include>
		<!--End sidebar-wrapper-->

		<!--Start topbar header-->
		<jsp:include page="header.jsp"></jsp:include>
		<!--End topbar header-->

		<div class="clearfix"></div>
		<div class="content-wrapper">
			<div class="container-fluid">
				<!--Start Dashboard Content-->
				<div class="card mt-3">
					<div class="card-content">
						<div id="rightContent">

							<%
								User users = (User) session.getAttribute("useradmin");
							if (users == null) {
								response.sendRedirect("/admin/login");
							}
							%>

							<jsp:include page="header.jsp"></jsp:include>

							<div id="wrapper">

								<jsp:include page="menu.jsp"></jsp:include>
								<div id="rightContent">
									<h3>Quản lý sản phẩm</h3>
									<a href="/admin/product/add">Thêm Sản Phẩm</a>
									<table class="data">
										<tr class="data">
											<th class="data" width="50px">STT</th>
											<th class="data" width="150px">Tên sản phẩm</th>
											<th class="data" width="150px">Hình ảnh</th>
											<th class="data" width="150px">Giá bán</th>
											<th class="data" width="150px">Giá nhập</th>
											<th class="data" width="90px">Số lượng</th>
											<th class="data" width="150px">NCC</th>
											<th class="data" width="300px">Mô tả</th>
											<th class="data" width="150px">Tùy Chọn</th>
										</tr>
										<!-- Set start end Paging -->
										<c:set var = "perPage" scope = "session" value = "${5}"/>
										<c:set var = "start" scope = "session" value = "${(curentPage -1)*perPage}"/>
										<c:set var = "end" scope = "session" value = "${perPage*curentPage}"/>
										<c:forEach items="${prods}" var="p" varStatus="loop">
											<!-- Check value in start - end -->
											<c:if test="${loop.index + 1 > start && loop.index + 1 <= end}">
											<tr class="data">
												<td class="data" width="30px" style="text-align: center">${loop.index + 1}</td>
												<td class="data">${p.productName}</td>
												<td class="data"><img style="text-align: center"
													witdh="50px" height="50px" src="${p.productImage}" /></td>
												<td class="data"><fmt:formatNumber
														value="${p.productPrice}" type="currency"
														currencySymbol="" /> VNĐ</td>
												<td class="data"><fmt:formatNumber
														value="${p.productBuy}" type="currency" currencySymbol="" />
													VNĐ</td>
												<td class="data">${p.productQuantity}</td>
												<td class="data">${p.productProvider}</td>
												<td class="data">${p.productDescription}</td>
												<td class="data" width="90px">
													<center>
														<a href="/admin/product/update_product/${p.productID}">Sửa</a>&nbsp;&nbsp;
														| &nbsp;&nbsp; <a
															href="/admin/product/delete/${p.productID}">Xóa</a>
													</center>
												</td>
											</tr>
											</c:if>
										</c:forEach>
									</table>
								</div>
								<!--Phan trang - Page Paging-->
								<div class="page-number-content">
									<li class="page-num">
										<a href="/admin/manager_product/${curentPage-1 < 1 ? maxPage :curentPage -1}"><i class="fas fa-arrow-left"></i></a>
									</li>
									<c:forEach items="${PageNumber}" var="p" varStatus="loop">
										<li id="page-num${p}" class="page-num ">
											<a href="/admin/manager_product/${p}">${p}</a>
										</li>
									</c:forEach>
									<li class="page-num">
										<a href="/admin/manager_product/${curentPage + 1 > maxPage ? 1 : curentPage + 1}"><i class="fas fa-arrow-right"></i></a>
									</li>
								</div>
								<script type="text/javascript">
									document.querySelector(`#page-num${curentPage}`).classList.add("btnActive");
								</script>
								<!-- end Page paging -->
							</div>
							
							
						</div>
					</div>
					<!--End Dashboard Content-->

					<!--start overlay-->
					<div class="overlay toggle-menu"></div>
					<!--end overlay-->

				</div>
				<!-- End container-fluid-->

			</div>
			<!--End content-wrapper-->
			<!--Start Back To Top Button-->
			<a href="javaScript:void();" class="back-to-top"><i
				class="fa fa-angle-double-up"></i> </a>
			<!--End Back To Top Button-->

			<!--start color switcher-->
			<div class="right-sidebar">
				<div class="switcher-icon">
					<i class="zmdi zmdi-settings zmdi-hc-spin"></i>
				</div>
				<div class="right-sidebar-content">

					<p class="mb-0">Gaussion Texture</p>
					<hr>

					<ul class="switcher">
						<li id="theme1"></li>
						<li id="theme2"></li>
						<li id="theme3"></li>
						<li id="theme4"></li>
						<li id="theme5"></li>
						<li id="theme6"></li>
					</ul>

					<p class="mb-0">Gradient Background</p>
					<hr>

					<ul class="switcher">
						<li id="theme7"></li>
						<li id="theme8"></li>
						<li id="theme9"></li>
						<li id="theme10"></li>
						<li id="theme11"></li>
						<li id="theme12"></li>
						<li id="theme13"></li>
						<li id="theme14"></li>
						<li id="theme15"></li>
					</ul>

				</div>
			</div>
			<!--end color switcher-->

		</div>
		<!--End wrapper-->

		<!--Start footer-->
		<jsp:include page="footer.jsp"></jsp:include>
		<!--End footer-->

		<!-- Bootstrap core JavaScript-->
		<script src="/resources/js/jquery.min.js"></script>
		<script src="/resources/js/popper.min.js"></script>
		<script src="/resources/js/bootstrap.min.js"></script>

		<!-- simplebar js -->
		<script src="/resources/plugins/simplebar/js/simplebar.js"></script>
		<!-- sidebar-menu js -->
		<script src="/resources/js/sidebar-menu.js"></script>
		<!-- loader scripts -->
		<script src="/resources/js/jquery.loading-indicator.js"></script>
		<!-- Custom scripts -->
		<script src="/resources/js/app-script.js"></script>
		<!-- Chart js -->

		<script src="/resources/plugins/Chart.js/Chart.min.js"></script>

		<!-- Index js -->
		<script src="/resources/js/index.js"></script>
</body>
</html>

