<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: haruki_9
  Date: 2021/7/28
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>借阅历史</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<header id="header"></header>
<body style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<form method="post" action="querybook.html" class="form-block"  id="searchform"  style="margin-left:35%; width: 30%; margin-top: 50px;margin-bottom: 50px">
    <div class="input-group">
        <input type="text" placeholder="输入读者证号/图书号" class="form-control" id="search" name="searchWord" style="height: 40px; font-size: 15px">
        <div class="input-group-append">
            <button class="btn btn-secondary" type="button"><i class="fa fa-search"></i></button>
        </div>
    </div>
</form>
<script>
    $("#searchform").submit(function () {
        var val=$("#search").val();
        if(val==''){
            alert("请输入关键字");
            return false;
        }
    })
</script>

<div class="panel panel-default" style="width: 90%;margin-left: 5%">
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>图书号</th>
                <th>读者证号</th>
                <th>借出日期</th>
                <th>归还日期</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${records}" var="record">
                <tr>
                    <td><c:out value="${record.book_id}"></c:out></td>
                    <td><c:out value="${record.user_email}"></c:out></td>
                    <td><c:out value="${record.lending_time}"></c:out></td>
                    <td><c:out value="${record.return_time}"></c:out></td>
                    <td>
                        <a href="javascript:if(window.confirm('是否确认该操作？'))
                        {window.location.href='recordDelete.html?book_id=${record.book_id}&user_email=${record.user_email}&lend_time=${record.lending_time}'}">
                            <button type="button" class="btn btn-outline-danger btn-xs">删除</button>

                        <%--                            <c:if test="${!empty record.return_time}">--%>
<%--                            </c:if>--%>
<%--                            <c:if test="${empty record.return_time}">--%>
<%--                                <button type="button" class="btn btn-default btn-xs" disabled="disabled">删除</button>--%>
<%--                            </c:if>--%>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
