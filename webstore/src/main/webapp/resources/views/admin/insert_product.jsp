<%@page import="com.webstore.app.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<title>Thêm sản phẩm</title>
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
<link href="/resources/css/material-design-iconic-font.css"
	rel="stylesheet" />
<link href="/resources/css/material-design-iconic-font.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />

<script src="/resources/js/jquery.min.js"></script>
</head>
<body class="bg-theme bg-theme1">

	<%
		User users = (User) session.getAttribute("useradmin");
	if (users == null) {
		response.sendRedirect("/admin/login");
	}
	String error = "";
	if (request.getParameter("error") != null) {
		error = (String) request.getParameter("error");
	}
	%>

	<!-- Start wrapper-->
	<div id="wrapper">

		<!--Start sidebar-wrapper-->
		<jsp:include page="menu.jsp"></jsp:include>
		<!--End sidebar-wrapper-->

		<!--Start topbar header-->
		<jsp:include page="header.jsp"></jsp:include>
		<!--End topbar header-->

		<div class="clearfix"></div>
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
							<h3>Thông tin sản phẩm</h3>
							<form action="/shop/ManagerProductServlet" method="post">
								<table width="95%">
									<tr>
										<td><b>Tên sản phẩm</b></td>
										<td><input type="text" class="sedang prodName"
											name="tensanpham"></td>
									</tr>

									<tr>
										<td><b>Giá bán</b></td>
										<td>
											<!-- <input type="text" class="sedang price" name="gia"> -->
											<input type="text" class="textfield sedang price" name="gia"
											value="" id="extra7" name="extra7"
											onkeypress="return isNumber(event)" />
										</td>
									</tr>
									<tr>
										<td><b>Giá nhập</b></td>
										<td><input type="text" class="textfield sedang buy"
											name="buy" value="${product.productBuy.longValue()}"
											id="extra7" name="extra7" onkeypress="return isNumber(event)" />
											<%=error%></td>
									</tr>
									<tr>
										<td><b>Số lượng</b></td>
										<td><input type="text" class="textfield sedang quantity"
											name="quantity" value="${product.productQuantity}"
											id="extra7" name="extra7" onkeypress="return isNumber(event)" />
											<%=error%></td>
									</tr>
									<tr>
										<td><b>Nhà cung cấp</b></td>
										<td><input type="text" class="sedang provider"
											name="provider" value="${product.productProvider}" /> <%=error%>
										</td>
									</tr>
									<tr>
										<td><b>Loại sản phẩm</b></td>
										<td><select name="category_id" class="cateId">
												<c:forEach items="${cates}" var="c">
													<option value="${c.categoryID}">${c.categoryName}</option>
												</c:forEach>
										</select></td>
									</tr>

									<tr>
										<td><b>Mô tả sản phẩm</b></td>
										<td><textarea class="form-textarea" id="noiDung"
												name="mota"></textarea></td>
									</tr>
									<tr>
										<td><b>Hình ảnh</b></td>
										<td><input type="file" id="productImg" name="hinhanh">
										</td>
									</tr>

									<tr>
										<td></td>
										<td>
											<input type="hidden" class="command" name="command" value="insert"> 
											<input class="button" value="Lưu dữ liệu" onclick="postFormData()">
										</td>
									</tr>
								</table>
							</form>
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
						<div class="clear"></div>
						<script type="text/javascript">
			var ScreenSizeH = screen.height-168;
			document.getElementById("rightContent").style.height = ScreenSizeH+"px";
			
			function ChangeHeightAuto(){
				var HFooter = document.getElementById("footer").offsetHeight;
				var ScreenSizeH = screen.height-HFooter-100;
				document.getElementById("rightContent").style.height = ScreenSizeH+"px";
				console.log(HFooter);
			}</script>

						<jsp:include page="footer.jsp"></jsp:include>
						<script>
			
			function isNumber(evt) {
			    evt = (evt) ? evt : window.event;
			    var charCode = (evt.which) ? evt.which : evt.keyCode;
			    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
			        return false;
			    }
			    return true;
			}
			
		function postData(img) {
			var body = {
					command: $('.command').val(),
					image: img,
					descrip: $('#noiDung').val(),
					cateId: $('.cateId').val(),
					price: $('.price').val(),
					prodName: $('.prodName').val(),
					prodId: $('.prodId').val(),
					buy: $('.buy').val(),
					quantity: $('.quantity').val(),
					provider: $('.provider').val()
			};
			
			$.ajax({
					url : "/admin/product/manager_product",
					type : "POST",
					contentType : "application/json",
					dataType:"json",
					data : JSON.stringify(body),
					async : false,
					success : function(result) {
						window.location.href = result.url;
					},
					error : function(jqXHR, status, errorThrown) {
					}
			});
		}
		
		function postFormData() {
			var form = new FormData();
			var file = $('#productImg')[0].files[0];
			
			if (file.name){
				form.append('hinhanh',file, file.name);
			}
				$.ajax({
					url : "/admin/product/file",
					type : "POST",
					data : form,
					processData : false,
					contentType : false,
					async : false,
					success : function(result) {
						postData(result);
					},
					error : function(jqXHR, status, errorThrown) {
					}
				});
		}
	</script>
					</div>
</body>
</html>
