<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="${pageContext.request.contextPath}/img/user2-160x160.jpg"
					class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>${currentAdmin.userName}</p>
				<a><i class="fa fa-circle text-success"></i> 在线</a>
			</div>
		</div>

		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="header">菜单</li>
			<li id="admin-index"><a
				href="${pageContext.request.contextPath}/pages/main.jsp"><i
					class="fa fa-dashboard"></i> <span>首页</span></a></li>

			<li class="treeview"><a href="#"> <i class="fa fa-cogs"></i>
					<span>角色管理</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>


			</a>
				<ul class="treeview-menu">

					<li id="admin-datalist"><a
						href="${pageContext.request.contextPath}/user/FindAllCustomer?pageNum=1&pageSize=4"> <i
							class="fa fa-circle-o"></i> 查看所有顾客
					</a></li>
					<li id="admin-blank"><a
						href="${pageContext.request.contextPath}/user/FindAllAdmin?pageNum=1&pageSize=4"> <i
							class="fa fa-circle-o"></i> 查看所有管理员
					</a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-cube"></i>
					<span>基础数据</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">

					<li id="admin-dataform"><a
						href="${pageContext.request.contextPath}/product/FindAllProduct?pageNum=1&pageSize=4">
							<i class="fa fa-circle-o"></i> 商品管理
					</a></li>
<%--					<li id="admin-profile"><a--%>
<%--						href="${pageContext.request.contextPath}/orders/findAll?pageNum=1&pageSize=4"> <i--%>
<%--							class="fa fa-circle-o"></i> 订单管理--%>
<%--					</a></li>--%>

				</ul></li>

		</ul>
	</section>
	<!-- /.sidebar -->
</aside>