<%--
  Created by IntelliJ IDEA.
  User: V-zcy
  Date: 2020/6/24
  Time: 17:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/user/LoginAdmin" method="post">
    管理员用户名：<label><input type="text" name="adminName"></label>
    管理员密码：<label><input type="password" name="password"></label>
    <input value="管理员登录" type="submit">
</form>
<form action="${pageContext.request.contextPath}/user/LoginCustomer" method="post">
    顾客用户名：<label><input type="text" name="customerName"></label>
    顾客密码：<label><input type="password" name="password"></label>
    <input value="顾客登录" type="submit">
</form>

<a href="${pageContext.request.contextPath}/user/FindAllUser">查询所有用户</a>
</body>
</html>
