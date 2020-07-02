<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>数据 - AdminLTE2定制版</title>
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
					商品管理 <small>数据列表</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/pages/main.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a href="#">商品管理</a></li>
					<li class="active">商品数据列表</li>
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
										<button type="button" class="btn btn-default" title="新建"
											onclick="location.href='${pageContext.request.contextPath}/product/FindAllCategoryToAddProduct'">
											<i class="fa fa-plus-square"></i> 新建
										</button>
										<button type="button" class="btn btn-default" title="删除" onclick="delManyProducts()">
											<i class="fa fa-trash-o"></i> 删除
										</button>
										<button type="button" class="btn btn-default" title="刷新"
												onclick="location.href='${pageContext.request.contextPath}/product/FindProductsByName?pNameLike=${pNameLike}&pageNum=1&pageSize=4'">
											<i class="fa fa-refresh"></i> 刷新
										</button>
										<button type="button" class="btn btn-default" title="空白">
											<img width="500px">
										</button>
										<input type="text" style="width: 200px;border: 1px black solid" id="searchProductBox" class="btn btn-block" title="搜索框">
										<button type="button" class="btn btn-twitter" title="搜索"
												onclick="findProductByName()">
											<i class="fa fa-search"></i> 搜索
										</button>
									</div>
								</div>
							</div>
<%--							<div class="box-tools pull-right">--%>
<%--								<div class="has-feedback">--%>
<%--									<form>--%>
<%--										<input style="float:left;" type="text" class="form-control input-sm"--%>
<%--											   placeholder="搜索">--%>
<%--											<span style="float:left;" class="glyphicon glyphicon-search form-control-feedback" onclick="alert('abc')" ></span>--%>
<%--									</form>--%>
<%--								</div>--%>
<%--							</div>--%>
							<!--工具栏/-->

							<!--数据列表-->
							<table id="dataList"
								class="table table-bordered table-striped table-hover dataTable">
								<thead>
									<tr>
										<th class="text-center" style="padding-right: 0px;"><input
											id="selall" type="checkbox" class="icheckbox_square-blue">
										</th>
										<th class="text-center sorting">商品图片</th>
										<th class="text-center sorting_asc sorting_asc_disabled">商品名称</th>
										<th class="text-center sorting">商品类别</th>
										<th class="text-center sorting">商品价格</th>
										<th class="text-center sorting">商品数量</th>
										<th class="text-center">操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${pageInfo.list}" var="product">

										<tr>
											<td class="text-center" style="line-height: 100px"><input class="checkPID" name="ids" value="${product.productId}" type="checkbox"></td>
											<td class="text-center"><img src="${pageContext.request.contextPath}/img/goods/${product.imgUrl}" style="width: 100px;height: 100px;" alt="图片加载失败"></td>
											<td class="text-center" style="line-height: 100px">${product.productName }</td>
											<td class="text-center" style="line-height: 100px">${product.categoryName }</td>
											<td class="text-center" style="line-height: 100px">${product.productPrice }</td>
											<td class="text-center" style="line-height: 100px">${product.productNum }</td>
											<td class="text-center" style="line-height: 100px">
												<a type="button" class="btn bg-olive btn-xs"
														href="${pageContext.request.contextPath}/product/FindProductDetailById?productId=${product.productId}">详情</a>
												<a type="button" class="btn bg-olive btn-xs"
												   href="${pageContext.request.contextPath}/product/FindProductDetailByIdToModify?productId=${product.productId}">编辑</a>
												<button type="button" class="btn btn-danger  btn-xs" onclick="delOneProduct('${product.productId}')">删除</button>
<%--												href="${pageContext.request.contextPath}/product/DeleteProductById?productId=${product.productId}"--%>
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
								<li><a href="${pageContext.request.contextPath}/product/FindProductsByName?pNameLike=${pNameLike}&pageNum=1&pageSize=${pageInfo.pageSize}" aria-label="Previous">首页</a></li>
								<li><a href="${pageContext.request.contextPath}/product/FindProductsByName?pNameLike=${pNameLike}&pageNum=${pageInfo.pageNum-1}&pageSize=${pageInfo.pageSize}">上一页</a></li>
								<c:if test="${pageInfo.pages<=5}">
									<c:forEach begin="1" end="${pageInfo.pages}" var="var">
										<li><a href="${pageContext.request.contextPath}/product/FindProductsByName?pNameLike=${pNameLike}&pageNum=${var}&pageSize=${pageInfo.pageSize}">${var}</a></li>
									</c:forEach>
								</c:if>
								<c:if test="${pageInfo.pages>5}">
									<c:forEach begin="${pageInfo.pageNum}" end="${pageInfo.pageNum+4}" var="var">
										<c:if test="${var<=pageInfo.pages}">
											<li><a href="${pageContext.request.contextPath}/product/FindProductsByName?pNameLike=${pNameLike}&pageNum=${var}&pageSize=${pageInfo.pageSize}">${var}</a></li>
										</c:if>
									</c:forEach>
								</c:if>
								<li><a href="${pageContext.request.contextPath}/product/FindProductsByName?pNameLike=${pNameLike}&pageNum=${pageInfo.pageNum+1}&pageSize=${pageInfo.pageSize}">下一页</a></li>
								<li><a href="${pageContext.request.contextPath}/product/FindProductsByName?pNameLike=${pNameLike}&pageNum=${pageInfo.pages}&pageSize=${pageInfo.pageSize}" aria-label="Next">尾页</a></li>
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
		function findProductByName() {
			var name = document.getElementById("searchProductBox").value;
			if (name.length!==0){
				location.href="${pageContext.request.contextPath}/product/FindProductsByName?pNameLike="+name;
			}else {
				alert("请输入关键字！")
			}
		}

		function delOneProduct(id) {
			if (window.confirm("要删除该商品吗？")){
				location.href="${pageContext.request.contextPath}/product/DeleteProductById?productId=" + id;
			}
		}
		
		function delManyProducts() {
			var url = "";
			var nums = 0;
			$(".checkPID").each(function(){
				if($(this).is(':checked')){
					url+=$(this).val()+",";
					nums++;
				}else{}
			});
			if (nums === 0){
				alert("请选择商品后再进行操作!")
			}else {
				if (url !== ""){
					url=url.substring(0, url.length-1);
				}
				if (window.confirm("确认删除这"+nums+"件商品吗？")){
					location.href="${pageContext.request.contextPath}/product/DeleteProducts?ids=" + url;
				}
			}
		}
		
		function changePageSize() {
			//获取下拉框的值
			var pageSize = $("#changePageSize").val();

			//向服务器发送请求，改变没页显示条数
			location.href = "${pageContext.request.contextPath}/product/FindProductsByName?pNameLike=${pNameLike}&pageNum=1&pageSize="
					+ pageSize;
		}
		function changePageNum() {
			//获取下拉框的值
			var pageSize = $("#changePageNum").val();

			//向服务器发送请求，改变当前页数
			location.href = "${pageContext.request.contextPath}/product/FindProductsByName?pNameLike=${pNameLike}&pageNum=" + pageSize +
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
			setSidebarActive("admin-dataform");

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