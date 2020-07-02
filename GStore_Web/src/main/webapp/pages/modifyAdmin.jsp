<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 页面meta -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" charset="utf-8">

<title>ITCAST - AdminLTE2定制版</title>
<meta name="description" content="AdminLTE2定制版">
<meta name="keywords" content="AdminLTE2定制版">

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js" type="text/javascript"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js" type="text/javascript"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/morris/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/select2/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">

	<section class="wrapper">

		<!-- 页面头部 -->
		<jsp:include page="header.jsp"/>
			<!-- 页面头部 /-->

		<!-- 导航侧栏 -->
		<jsp:include page="aside.jsp"/>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<div class="content-wrapper">

			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					<i class="fa fa-user-circle" aria-hidden="true"></i>
					当前管理员: <a>${currentAdmin.userName} </a>
				</h1>
				<ol class="breadcrumb">
					<li><a href="main.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">修改信息</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="col-md-2"></div>
				<div class="col-md-8">
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs">
<%--						<li class="active"><a href="#activity" data-toggle="tab">Activity</a></li>--%>
<%--						<li><a href="#timeline" data-toggle="tab">Timeline</a></li>--%>
						<li class="active"><a href="#settings" data-toggle="tab">修改信息</a></li>
					</ul>
						<div class="tab-pane" id="settings">
							<form class="form-horizontal" action="${pageContext.request.contextPath}/user/ModifyAdmin" method="post" style="margin-right: 20px;margin-top: 20px;padding-bottom: 20px">
								<div class="form-group">
									<label for="inputName" class="col-sm-2 control-label">ID</label>

									<div class="col-sm-10">
										<input type="email" value="${currentAdmin.userId}" class="form-control" id="inputName1" name="userId" placeholder="Name" readonly>
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail" class="col-sm-2 control-label">邮箱</label>

									<div class="col-sm-10">
										<input type="email" value="${currentAdmin.email}" class="form-control" id="inputEmail" name="email" placeholder="Email">
									</div>
								</div>
								<div class="form-group">
									<label for="inputName" class="col-sm-2 control-label">名字</label>

									<div class="col-sm-10">
										<input type="text" value="${currentAdmin.userName}" class="form-control" id="inputName" name="userName" placeholder="Name">
									</div>
								</div>
								<div class="form-group">
									<label for="inputSkills" class="col-sm-2 control-label">角色</label>
									<div class="col-sm-10">
										<input type="text" value="${currentAdmin.role}" class="form-control" id="inputRole" name="role" placeholder="Role" disabled>
									</div>
								</div>
								<div class="form-group">
									<label for="inputSkills" class="col-sm-2 control-label">上次更新</label>
									<div class="col-sm-10">
										<input type="text" value="${currentAdmin.updateTime}" class="form-control" id="inputSkills" name="adminUpdateTime" placeholder="updateTime" disabled>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-instagram">保存</button>
									</div>
								</div>
							</form>
						</div>
						<!-- /.tab-pane -->
					</div>
					<!-- /.tab-content -->
				</div>
				<div class="col-md-2"></div>
				<!-- /.nav-tabs-custom -->
			</section>
			<!-- /.col -->

		</div>
		<!-- 内容区域 /-->

		<!-- 底部导航 -->
		<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 1.0
		</div>
		<strong>Copyright &copy; 2020-06 <a>软件开发小组研发部</a>.
		</strong> All rights reserved. </footer>
		<!-- 底部导航 /-->

	</section>>

	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/morris/morris.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js" type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});
		});

		// 设置激活菜单
		function setSidebarActive(tagUri) {
			var liObj = $("#" + tagUri);
			if (liObj.length > 0) {
				liObj.parent().parent().addClass("active");
				liObj.addClass("active");
			}
		}

		$(document).ready(function() {
			// 激活导航位置
			setSidebarActive("admin-index");
		});
	</script>
</body>

</html>