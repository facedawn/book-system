<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>借还日志</title>
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

<div style="position: relative;">
    <c:if test="${!empty succ}">
        <div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${succ}
        </div>
    </c:if>
    <c:if test="${!empty error}">
        <div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
                ${error}
        </div>
    </c:if>
</div>

<div class="panel panel-default" style="width: 90%;margin-left: 5%">
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>图书号</th>
                <th>读者证号</th>
                <th>借出日期</th>
                <th>到期日期</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${lendList}" var="alog">
                <tr>
                    <td><c:out value="${alog.book_id}"></c:out></td>
                    <td><c:out value="${alog.user_email}"></c:out></td>
                    <td><c:out value="${alog.lending_time}"></c:out></td>
                    <td><c:out value="${alog.return_time}"></c:out></td>
                    <td>
                        <a href="javascript:if(window.confirm('是否确认该操作？'))
                        {window.location.href='bookreturn.html?book_id=<c:out value='${alog.book_id}'/>&user_email=<c:out value='${alog.user_email}'/>'}">
                            <c:if test="${!empty alog.return_time}">
                                <button type="button" class="btn btn-outline-danger btn-xs">归还</button>
                            </c:if>
                            <c:if test="${empty alog.return_time}">
                                <button type="button" class="btn btn-default btn-xs" disabled="disabled">归还</button>
                            </c:if>
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
