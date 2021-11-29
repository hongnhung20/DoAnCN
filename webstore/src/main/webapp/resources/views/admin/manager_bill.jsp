<%@page import="java.util.ArrayList"%>
<%@ page import="com.webstore.app.entity.User"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Hóa Đơn</title>
<!-- loader-->
<link href="/resources/css1/pace.min.css" rel="stylesheet" />
<script src="/resources/js/pace.min.js"></script>
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
<link href="/resources/css1/animate.css" rel="stylesheet" type="text/css" />
<!-- Icons CSS-->
<link href="/resources/css1/icons.css" rel="stylesheet" type="text/css" />
<!-- Sidebar CSS-->
<link href="/resources/css1/sidebar-menu.css" rel="stylesheet" />
<!-- Custom Style-->
<link href="/resources/css1/app-style.css" rel="stylesheet" />
<link href="/resources/css1/material-design-iconic-font.css"
	rel="stylesheet" />
<link href="/resources/css1/material-design-iconic-font.min.css"
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
							<h3>Quản lý hóa đơn</h3>
							<table class="data">
								<tr class="data">
									<th class="data" width="150px">Mã hóa đơn</th>
									<th class="data" width="150px">Khách hàng</th>
									<th class="data" width="150px">SDT khách hàng</th>
									<th class="data" width="150px">Tổng hóa đơn</th>
									<th class="data" width="150px">Thanh toán</th>
									<th class="data" width="150px">Địa chỉ giao hàng</th>
									<th class="data" width="100px">Ngày mua</th>
									<th class="data" width="150px">Trạng thái đơn</th>
									<th class="data" width="100px">Tùy chọn</th>
								</tr>
								<!-- Set start end Paging -->
								<c:set var = "perPage" scope = "session" value = "${5}"/>
								<c:set var = "start" scope = "session" value = "${(curentPage -1)*perPage}"/>
								<c:set var = "end" scope = "session" value = "${perPage*curentPage}"/>
								<c:forEach items="${bills}" var="b" varStatus="loop">
									<!-- Check value in start - end -->
									<c:if test="${loop.index + 1 > start && loop.index + 1 <= end}">
									<tr class="data">
										<td class="data" width="30px">${b.id}</td>
										<td class="data">${b.userEmail}</td>
										<td class="data">${b.phone}</td>
										<td class="data">${b.total.longValue()}</td>
										<td class="data">${b.payment}</td>
										<td class="data">${b.address}</td>
										<td class="data">${b.date}</td>
										<c:choose>
											<c:when test="${b.status == 1}">
												<td class="data"><span style="font-size: 24px">
														&#x2015;</span></td>
											</c:when>
											<c:when test="${b.status == 3}">
												<td class="data"><span
													style="color: green; font-size: 24px"> &#10004;</span></td>
											</c:when>
											<c:otherwise>
												<td class="data"><span
													style="font-size: 24px; color: red">&#x3A7;</span></td>
											</c:otherwise>
										</c:choose>
										<td class="data" width="75px">
											<center>
												<a title="hoàn tất" onclick="update(${b.id}, 3)"><span
													style="color: green; font-size: 24px"> &#10004;</span></a> </a>&nbsp;&nbsp;
												<a title="hủy dơn" onclick="update(${b.id}, 2)"><span
													style="font-size: 24px; color: red">&#x3A7;</span></a> </a>&nbsp;&nbsp;
												<a title="xóa đơn" href="/admin/bill/delete/${b.id}"><span
													style="font-size: 24px">&#x26D4;</span></a> </a>&nbsp;&nbsp;
											</center>
										</td>
									</tr>
									</c:if>
								</c:forEach>
							</table>
							<!--Phan trang - Page Paging-->
								<div class="page-number-content">
									<li class="page-num">
										<a href="/admin/manager_bill/${curentPage-1 < 1 ? maxPage :curentPage -1}"><i class="fas fa-arrow-left"></i></a>
									</li>
									<c:forEach items="${PageNumber}" var="p" varStatus="loop">
										<li id="page-num${p}" class="page-num ">
											<a href="/admin/manager_bill/${p}">${p}</a>
										</li>
									</c:forEach>
									<li class="page-num">
										<a href="/admin/manager_bill/${curentPage + 1 > maxPage ? 1 : curentPage + 1}"><i class="fas fa-arrow-right"></i></a>
									</li>
								</div>
								<script type="text/javascript">
									document.querySelector(`#page-num${curentPage}`).classList.add("btnActive");
								</script>
							<!-- end Page paging -->
						</div>
					</div>

					<!-- End container-fluid-->

					<!--End content-wrapper-->
				</div>
				<div id="wrapper">
					<div class="clear"></div>
					<script type="text/javascript">
			//var HFooter = document.getElementById("footer").offsetHeight;
			
			var ScreenSizeH = screen.height-168;
			document.getElementById("rightContent").style.height = ScreenSizeH+"px";
			
			function ChangeHeightAuto(){
				var HFooter = document.getElementById("footer").offsetHeight;
				var ScreenSizeH = screen.height-HFooter-100;
				document.getElementById("rightContent").style.height = ScreenSizeH+"px";
				console.log(HFooter);
			}
			
			function update(id, stt){
				$.ajax({
					url : "/admin/bill/update/" +id +'/' + stt,
					type : "GET",
					async : false,
					success : function(data) {
						if (data.mess === 'ok'){
							window.location.href = "/admin/manager_bill"
						}
						if (data.mess === 'eq'){
							alert('Số lương sản phẩm không đủ.');
						}
					},
					error : function(jqXHR, status, errorThrown) {
						console.log(errorThrown)
					}
					});
			}
			</script>
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
