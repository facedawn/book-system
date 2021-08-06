<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>全部读者</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
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
<form method="post" action="queryReader.html" class="form-block"  id="searchform"  style="margin-left:35%; width: 30%; margin-top: 50px;margin-bottom: 50px">
    <div class="input-group">
        <input type="text" placeholder="输入读者ID/名称" class="form-control" id="search" name="search" style="height: 40px; font-size: 15px">
        <div class="input-group-append">
            <button class="btn btn-secondary" type="submit"><i class="fa fa-search"></i></button>
        </div>
    </div>
</form>
<c:if test="${!empty info}">
    <script>alert("${info}");window.location.href="allreaders.html"</script>
</c:if>

<div style="position: relative;top: 10%">
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
<div class="panel panel-default" style="width: 80%;margin-left: 10%;margin-bottom:5%">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">
            全部读者
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>邮箱</th>
                <th>用户名</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${readers}" var="reader">
                <tr>
                    <td><c:out value="${reader.user_email}"></c:out></td>
                    <td><c:out value="${reader.user_name}"></c:out></td>
                    <td><a href="reader_edit.html?readerId=<c:out value="${reader.user_email}"></c:out>"><button type="button" class="btn btn-outline-success btn-xs">编辑</button></a></td>
                    <td><a href="javascript:if(window.confirm('是否确认该操作？')){window.location.href='reader_delete.html?readerId=<c:out value="${reader.user_email}'}"></c:out>"><button type="button" class="btn btn-outline-danger btn-xs">删除</button></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
<script>
    console.log("${StatusCode.equals("0")}")
    if (${StatusCode.equals("0")}){
        alert("删除失败！用户存在在借记录!");
    }
    else {
        alert("用户删除成功！");
    }
</script>
</html>
