<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">




<title>数据 - GStore定制版</title>
<meta name="description" content="AdminLTE2定制版">
<meta name="keywords" content="AdminLTE2定制版">




<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-purple sidebar-mini">

	<div class="wrapper">

		<!-- 页面头部 -->
		<jsp:include page="header.jsp"/>
		<!-- 页面头部 /-->
		<!-- 导航侧栏 -->
		<jsp:include page="aside.jsp"/>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<!-- @@master = admin-layout.html-->
		<!-- @@block = content -->

		<div class="content-wrapper">

			<!-- 内容头部 -->
			<section class="content-header">
				<h1>
					管理员数据 <small>数据列表</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/pages/main.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a href="#">角色管理</a></li>
					<li class="active">管理员数据列表</li>
				</ol>
			</section>
			<!-- 内容头部 /-->

			<!-- 正文区域 -->
			<section class="content">

				<!-- .box-body -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">列表</h3>
					</div>

					<div class="box-body">

						<!-- 数据表格 -->
						<div class="table-box">

							<!--工具栏-->
							<div class="pull-left">
								<div class="form-group form-inline">
									<div class="btn-group">
										<button type="button" class="btn btn-default" title="刷新"
										onclick="location.href='${pageContext.request.contextPath}/user/FindAllAdmin?pageNum=1&pageSize=4'">
											<i class="fa fa-refresh"></i> 刷新
										</button>
									</div>
								</div>
							</div>
							<div class="box-tools pull-right">
							</div>
							<!--工具栏/-->

							<!--数据列表-->
							<table id="dataList"
								class="table table-bordered table-striped table-hover dataTable">
								<thead>
									<tr>
										<th class="" style="padding-right: 0px;"><input
											id="selall" type="checkbox" class="icheckbox_square-blue">
										</th>
										<th class="sorting_asc">管理员ID</th>
										<th class="sorting_desc">管理员姓名</th>
										<th class="sorting_asc sorting_asc_disabled">管理员邮箱</th>
										<th class="sorting_asc sorting_asc_disabled">身份</th>
										<th class="sorting">最后一次信息更新时间</th>
										<th class="text-center sorting">用户账户状态</th>
										<th class="text-center">操作</th>
									</tr>
								</thead>
								<tbody>


									<c:forEach items="${pageInfo.list}" var="user" varStatus="status">
										<tr>
											<td><input name="ids" type="checkbox"></td>
											<td>${user.userId }</td>
											<td>${user.userName }</td>
											<td>${user.email }</td>
											<td>${user.role }</td>
											<td>${user.updateTime }</td>
											<td class="text-center">${user.stateStr }</td>
											<td class="text-center">
												<!--模态窗口-->
												<div class="tab-pane" id="tab-model">
													<c:if test="${user.userId==currentAdmin.userId}">
														<button type="button" class="btn bg-olive btn-xs" data-toggle="modal" disabled>
															取消管理员身份
														</button>
													</c:if>
													<c:if test="${user.userId!=currentAdmin.userId}">
														<button type="button" class="btn bg-olive btn-xs" data-toggle="modal" onclick="openMyModal(this)">
															取消管理员身份
														</button>
													</c:if>
													<div id="myModal" class="modal modal-primary" role="dialog">
														<div class="modal-dialog modal-lg">
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span></button>
																	<h4 class="modal-title">验证身份</h4>
																</div>
																<form action="${pageContext.request.contextPath}/user/VerifyAdminSetCustomer?adminId=${currentAdmin.userId}" method="post">
																	<div class="modal-body">
																		<div class="box-body">
																			<div class="form-horizontal">
																				<div class="form-group">
																					<label class="col-sm-2 control-label">当前管理员密码:</label>
																					<div class="col-sm-8">
																						<input type="text" hidden="hidden" id="customerId" name="targetId">
																						<input type="password" class="form-control" placeholder="密码" name="password"/>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-outline" data-dismiss="modal">关闭</button>
																		<input type="submit" class="btn btn-outline" value="确认"/>
																	</div>
																</form>
															</div>
															<!-- /.modal-content -->
														</div>
														<!-- /.modal-dialog -->
													</div>
													<!-- /.modal -->
												</div>
												<!--模态窗口/-->
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!--数据列表/-->
						</div>
						<!-- 数据表格 /-->


					</div>
					<!-- /.box-body -->

					<!-- .box-footer-->
                <div class="box-footer">
                    <div class="pull-left">
                        <div class="form-group form-inline">
							总共${pageInfo.pages} 页，共${pageInfo.total} 条数据。<hr>
							每页 <select class="form-control" id="changePageSize"
									   onchange="changePageSize()">
							<c:forEach begin="1" end="5" var="var">
								<c:if test="${pageInfo.pageSize==var}">
									<option selected>${var}</option>
								</c:if>
								<c:if test="${pageInfo.pageSize!=var}">
									<option>${var}</option>
								</c:if>
							</c:forEach>
						</select> 条,当前第<select class="form-control" id="changePageNum"
											   onchange="changePageNum()">
							<c:forEach begin="1" end="${pageInfo.pages}" var="var">
								<c:if test="${pageInfo.pageNum==var}">
									<option selected>${var}</option>
								</c:if>
								<c:if test="${pageInfo.pageNum!=var}">
									<option>${var}</option>
								</c:if>
							</c:forEach>
						</select>页
                        </div>
                    </div>
                    <div class="box-tools pull-right">
						<ul class="pagination">
							<li><a href="${pageContext.request.contextPath}/user/FindAllAdmin?pageNum=1&pageSize=${pageInfo.pageSize}" aria-label="Previous">首页</a></li>
							<li><a href="${pageContext.request.contextPath}/user/FindAllAdmin?pageNum=${pageInfo.pageNum-1}&pageSize=${pageInfo.pageSize}">上一页</a></li>
							<c:if test="${pageInfo.pages<=5}">
								<c:forEach begin="1" end="${pageInfo.pages}" var="var">
									<li><a href="${pageContext.request.contextPath}/user/FindAllAdmin?pageNum=${var}&pageSize=${pageInfo.pageSize}">${var}</a></li>
								</c:forEach>
							</c:if>
							<c:if test="${pageInfo.pages>5}">
								<c:forEach begin="${pageInfo.pageNum}" end="${pageInfo.pageNum+4}" var="var">
									<c:if test="${var<=pageInfo.pages}">
										<li><a href="${pageContext.request.contextPath}/user/FindAllAdmin?pageNum=${var}&pageSize=${pageInfo.pageSize}">${var}</a></li>
									</c:if>
								</c:forEach>
							</c:if>
							<li><a href="${pageContext.request.contextPath}/user/FindAllAdmin?pageNum=${pageInfo.pageNum+1}&pageSize=${pageInfo.pageSize}">下一页</a></li>
							<li><a href="${pageContext.request.contextPath}/user/FindAllAdmin?pageNum=${pageInfo.pages}&pageSize=${pageInfo.pageSize}" aria-label="Next">尾页</a></li>
						</ul>
                    </div>
                </div>
                <!-- /.box-footer-->
				</div>
			</section>
			<!-- 正文区域 /-->
		</div>
		<!-- @@close -->
		<!-- 内容区域 /-->
		<!-- 底部导航 -->
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 1.0
			</div>
			<strong>Copyright &copy; 2020-06 <a>软件开发小组研发部</a>.
			</strong> All rights reserved. </footer>
		<!-- 底部导航 /-->
	</div>
	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script>
		function openMyModal(obj) {
			var $td = $(obj).parents('td').parent('tr').children('td');
			var id = $td.eq(1).text();
			$("#myModal").modal('show');
			$("#customerId").val(id);
		}
		function changePageSize() {
			//获取下拉框的值
			var pageSize = $("#changePageSize").val();

			//向服务器发送请求，改变没页显示条数
			location.href = "${pageContext.request.contextPath}/user/FindAllAdmin?page=1&pageSize="
					+ pageSize;
		}
		function changePageNum() {
			//获取下拉框的值
			var pageSize = $("#changePageNum").val();

			//向服务器发送请求，改变当前页数
			location.href = "${pageContext.request.contextPath}/user/FindAllAdmin?pageNum=" + pageSize +
					"&pageSize=${pageInfo.pageSize}";
		}
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
			setSidebarActive("admin-blank");

			// 列表按钮 
			$("#dataList td input[type='checkbox']").iCheck({
				checkboxClass : 'icheckbox_square-blue',
				increaseArea : '20%'
			});
			// 全选操作 
			$("#selall").click(function() {
				var clicks = $(this).is(':checked');
				if (!clicks) {
					$("#dataList td input[type='checkbox']").iCheck("uncheck");
				} else {
					$("#dataList td input[type='checkbox']").iCheck("check");
				}
				$(this).data("clicks", !clicks);
			});
		});
	</script>
</body>

</html>