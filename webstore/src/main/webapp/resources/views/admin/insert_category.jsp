<%@page import="com.webstore.app.entity.User"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
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
<title>Thông tin</title>
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
</head>
<body class="bg-theme bg-theme1">

	<%
		User users = (User) session.getAttribute("useradmin");
	if (users == null) {
		response.sendRedirect("/shop/admin/login");
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
							<h3>Thông tin</h3>
							<form action="/admin/manager_category" method="post">
								<table width="95%">
									<tr>
										<td style="float: right"><b>Tên Loại:</b></td>
										<td><input type="text" class="sedang" name="cateName"><%=error%></td>
									</tr>
									<tr>
										<td></td>
										<td><input type="hidden" name="command" value="insert">
											<input type="hidden" name="id" value=""> <input
											type="submit" class="button" value="Lưu dữ liệu"></td>
									</tr>
								</table>
							</form>
						</div>
						<div class="clear"></div>
						<script type="text/javascript">
			var ScreenSizeH = screen.height - 168;
			document.getElementById("rightContent").style.height = ScreenSizeH
					+ "px";

			function ChangeHeightAuto() {
				var HFooter = document.getElementById("footer").offsetHeight;
				var ScreenSizeH = screen.height - HFooter - 100;
				document.getElementById("rightContent").style.height = ScreenSizeH
						+ "px";
				console.log(HFooter);
			}
		</script>


					</div>
</body>
</html>