<%--
  Created by IntelliJ IDEA.
  User: V-zcy
  Date: 2020/5/23
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${productList}" var="product">
    ${product.toString()}
    <hr>
</c:forEach>
</body>
</html>
