<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" charset="utf-8">

    <title>数据 - GStore定制版 | Log in</title>

    <meta
            content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
            name="viewport">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/ionicons.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/AdminLTE.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/blue.css">
</head>

<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href=""><b>GStore</b>普通会员登录</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">登录系统</p>

        <form action="${pageContext.request.contextPath}/user/LoginCustomer" method="post">
            <div class="form-group has-feedback">
                <input type="text" name="customerName" class="form-control"
                       placeholder="用户名">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">

                <input type="password" name="password" class="form-control"
                       placeholder="密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                					<div class="col-xs-4">
<%--                						<div class="checkbox icheck">--%>
<%--                							<label type="hidden"><input type="checkbox"> 记住 下次自动登录</label>--%>
<%--                						</div>--%>
                					</div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">

                </div>
                <!-- /.col -->
            </div>
        </form>

        <a href="${pageContext.request.contextPath}/pages/login.jsp">管理员登录</a><br>


    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<!-- Bootstrap 3.3.6 -->
<!-- iCheck -->
<script
        src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js" type="text/javascript"></script>
<script
        src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<script
        src="${pageContext.request.contextPath}/js/icheck.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</body>

</html>