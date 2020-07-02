<%--
  Created by IntelliJ IDEA.
  User: V-zcy
  Date: 2020/6/26
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table id="dataList"
       class="table table-bordered table-striped table-hover dataTable">
    <thead>
    <tr>
        <th class="" style="padding-right: 0px;"><label for="selall"></label><input
                id="selall" type="checkbox" class="icheckbox_square-blue">
        </th>
        <th class="sorting_asc">ID</th>
        <th class="sorting_desc">name</th>
        <th class="sorting_asc sorting_asc_disabled">email</th>
        <th class="sorting_desc sorting_desc_disabled">role</th>
        <th class="sorting">updateTime</th>
    </tr>
    </thead>
    <tbody>


    <c:forEach items="${users}" var="user">
        <tr>
            <td><label>
                <input name="ids" type="checkbox">
            </label></td>
            <td>${user.userId }</td>
            <td>${user.userName }</td>
            <td>${user.email }</td>
            <td>${user.role }</td>
            <td>${user.updateTime }</td>

        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
