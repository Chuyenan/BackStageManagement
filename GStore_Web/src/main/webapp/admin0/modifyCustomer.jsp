<%--
  Created by IntelliJ IDEA.
  User: V-zcy
  Date: 2020/6/27
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改信息</title>
    <style>

    </style>
</head>
<body>
<h1>更改信息</h1>
<form action="${pageContext.request.contextPath}/user/ModifyCustomer?state=1" method="post">
    用户名：<label>
        <input type="text" value="${user.userName}" id="user-name-label" name="userName">
    </label>
    <hr>
    邮箱：<label>
        <input type="email" value="${user.email}" id="email" name="email">
    </label>
    <hr>
    角色：<label>
        <input type="text" value="${user.role}" disabled="disabled">
    </label>
    <hr>
    最近一次更新时间：<label>
        <input type="text" value="${user.updateTime}" style="width: 210px" disabled="disabled">
    </label>
    <hr><input type="hidden" value="${user.password}" name="password">
    <input type="hidden" value="${user.userId}" name="userId">
    <input type="submit" value="更改信息">
</form>
<hr>
<form action="${pageContext.request.contextPath}/user/ModifyCustomerPW?userId=${user.userId}" method="post">
    原密码:<label>
    <input type="password" name="formerPWD">
</label>
    新密码:<label>
    <input type="password" name="newPWD">
</label>
    <input type="submit" value="更换密码">
</form>
<hr>
<form action="${pageContext.request.contextPath}/user/LogoffCustomer?userId=${user.userId}" method="post">
    输入密码:<label>
    <input type="password" name="password">
    <input type="submit" value="注销">
</label>
</form>
</body>

</html>
