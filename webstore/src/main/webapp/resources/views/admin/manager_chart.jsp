
<%@page import="java.util.ArrayList"%>
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
<title>home</title>
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
<title>Biểu đồ, thống kê</title>

<!-- load Google AJAX API -->
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
            // Load the Visualization API and the piechart package.
            google.load('visualization', '1', {'packages': ['columnchart']});

            // Set a callback to run when the Google Visualization API is loaded.
            google.setOnLoadCallback(drawChart);

            // Callback that creates and populates a data table,
            // instantiates the pie chart, passes in the data and
            // draws it.
            function drawChart() {

                // Create the data table.    
                var data = google.visualization.arrayToDataTable([
                    ['Country', 'Area(square km)'],
            <c:forEach var="item" items="${datas}">['${item.name}',${item.value}],</c:forEach>
                ]);
                // Set chart options
                var options = {
                    'title': 'Thống kê danh mục sản phẩm',
                    is3D: true,
                    pieSliceText: 'label',
                    tooltip: {showColorCode: true},
                    'width': 700,
                    'height': 300
                };

                // Instantiate and draw our chart, passing in some options.
                var chart = new google.visualization.PieChart(document.getElementById('chart'));
                chart.draw(data, options);
            }
            </script>

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

							<h3>Thống kê danh mục sản phẩm</h3>

							<table class="data">

								<div id="chart"></div>

							</table>
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



