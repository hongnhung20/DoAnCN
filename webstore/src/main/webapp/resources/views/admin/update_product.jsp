<%@page import="com.webstore.app.entity.User"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Thêm sản phẩm</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
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
		<div class="content-wrapper">
			<div class="container-fluid">
				<!--Start Dashboard Content-->
				<div class="card mt-3">
					<div class="card-content">

						<div id="rightContent">
							<h3>Thông tin sản phẩm</h3>
							<form action="/admin/product/manager_product" method="post"
								accept-charset="utf8">
								<table width="95%">
									<tr>
										<td><b>Tên sản phẩm</b> <input type="hidden"
											class="prodId" name="prodId" value="${product.productID}" /></td>
										<td><input type="text" class="sedang prodName"
											name="prodName" value="${product.productName}" /> <%=error%></td>
									</tr>

									<tr>
										<td><b>Giá bán</b></td>
										<td><input type="text" class="textfield sedang price"
											name="gia" value="${product.productPrice.longValue()}"
											id="extra7" name="extra7" onkeypress="return isNumber(event)" />
											<%=error%></td>
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
										<td><select name="cateId" class="cateId">
												<option value="${cate.categoryID}">
													${cate.categoryName}</option>
										</select></td>
									</tr>

									<tr>
										<td><b>Mô tả sản phẩm</b></td>
										<td><textarea class="form-textarea" id="noiDung"
												name="descrip">
                                   ${product.productDescription}
                                </textarea></td>
									</tr>
									<tr>
										<td><b>Hình ảnh</b></td>
										<td><input type="file" id="productImg" name="hinhanh"
											value="${product.productImage}" /> <%=error%></td>
									</tr>

									<tr>
										<td></td>
										<td>
											<input type="hidden" class="command" name="command" value="update"> 
											<input class="button" value="Lưu dữ liệu" onclick="postFormData()">
										</td>
									</tr>
								</table>
							</form>
						</div>
						<div class="clear"></div>

						

					</div>
					<script>
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
		
		function isNumber(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		        return false;
		    }
		    return true;
		}
	</script>
</body>
</html>
