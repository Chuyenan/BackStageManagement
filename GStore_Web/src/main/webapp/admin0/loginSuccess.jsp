<%--
  Created by IntelliJ IDEA.
  User: V-zcy
  Date: 2020/6/26
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>个人信息页面</title>
</head>
<body>
<a>登录成功</a>

<c:if test="${customers.size()==1}">
    ${customers.get(0).toString()}
    <a href="${pageContext.request.contextPath}/user/FindCustomerById?userId=${customers.get(0).userId}">修改信息</a>
</c:if>
<c:if test="${admins.size()==1}">
    ${admins.get(0).toString()}
    <a href="${pageContext.request.contextPath}/user/FindCustomerById?userId=${admins.get(0).userId}">修改信息</a>
</c:if>

</body>
</html>
