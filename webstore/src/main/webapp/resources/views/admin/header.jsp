<%@page import="com.webstore.app.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link href="/resources/css1/bootstrap.css" rel="stylesheet"
	type="text/css" media="all" />
<!-- js -->
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap-notify.min.js"></script>
<script type="text/javascript">
	function checkNewBill() {
		$.ajax({
			url : "/bill/news",
			type : "GET",
			async : false,
			success : function(data) {
				$.each(data, function(idx, obj) {
					generateNotify('Khách hàng có sđt: ' + obj
							+ ' vừa đặt hàng.');
				});
			},
			error : function(jqXHR, status, errorThrown) {
				console.log(errorThrown)
			}
		});
	}

	function generateNotify(mess) {
		$
				.notify(
						{
							title : '<strong>Thông báo: </strong>',
							icon : 'glyphicon glyphicon-star',
							message : mess
						},
						{
							type : 'info',
							animate : {
								enter : 'animated fadeInDown',
								exit : 'animated fadeOutUp'
							},
							placement : {
								from : "top",
								align : "right"
							},
							newest_on_top : true,
							offset : 40,
							spacing : 10,
							z_index : 1031,
							template : '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">'
									+ '<button type="button" aria-hidden="true" class="close" data-notify="dismiss">×</button>'
									+ '<span data-notify="icon"></span> '
									+ '<span data-notify="title">{1}</span> '
									+ '<span data-notify="message">{2}</span>'
									+ '<div class="progress" data-notify="progressbar">'
									+ '<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>'
									+ '</div>'
									+ '<a href="{3}" target="{4}" data-notify="url"></a>'
									+ '</div>'
						});
	}

	$(document).ready(function() {

		setInterval(function() {
			//generateNotify("test")
			checkNewBill();
		}, 15000);
	});
</script>
</head>
<body>
<header class="topbar-nav">
 <nav class="navbar navbar-expand fixed-top">
  <ul class="navbar-nav mr-auto align-items-center">
    <li class="nav-item">
      <a class="nav-link toggle-menu" href="javascript:void();">
       <i class="icon-menu menu-icon"></i>
     </a>
    </li>
    <li class="nav-item">
      <form class="search-bar">
        <input type="text" class="form-control" placeholder="Enter keywords">
         <a href="javascript:void();"><i class="icon-magnifier"></i></a>
      </form>
    </li>
  </ul>
     
  <ul class="navbar-nav align-items-center right-nav-link">
    <li class="nav-item language">
      <a class="nav-link dropdown-toggle dropdown-toggle-nocaret waves-effect" data-toggle="dropdown" href="javascript:void();"><i class="fa fa-flag"></i></a>
      <ul class="dropdown-menu dropdown-menu-right">
          <li class="dropdown-item"> <i class="flag-icon flag-icon-gb mr-2"></i> Vietnamese</li>
        </ul>
    </li>
    <li class="nav-item">
      <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" data-toggle="dropdown" href="#">
        <span class="user-profile"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4ygrMrRN82ylandFjVxEpZ7qqVjt9XqAhm3CWa0Z4DqEOkBVRacGNQkTmpLrqph_xdbw&usqp=CAU" class="img-circle" alt="user avatar"></span>
      </a>
      <ul class="dropdown-menu dropdown-menu-right">
       <li class="dropdown-item user-details">
        <a href="javaScript:void();">
           <div class="media">
             <div class="avatar"><img class="align-self-start mr-3" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4ygrMrRN82ylandFjVxEpZ7qqVjt9XqAhm3CWa0Z4DqEOkBVRacGNQkTmpLrqph_xdbw&usqp=CAU" alt="user avatar"></div>
            <div class="media-body">
            <h6 class="mt-2 user-title">Nhung Admin</h6>
            <p class="user-subtitle">Hongnhung0905@gmail.com</p>
            </div>
           </div>
          </a>
        </li>
        <li class="dropdown-divider"></li>
        <li class="dropdown-item"><i class="icon-power mr-2"></i><a href="/admin/logout"> Logout</a></li>
      </ul>
    </li>
  </ul>
</nav>
</header>
</body>
</html>

