<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>全部图书信息</title>
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
<body style="background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<form method="post" action="admin_querybook_do.html" class="form-block"  id="searchform"  style="margin-left:35%; width: 30%; margin-top: 50px;margin-bottom: 50px">
    <div class="input-group">
        <input type="text" placeholder="输入图书名" class="form-control" id="search" name="searchWord" style="height: 40px; font-size: 15px">
        <div class="input-group-append">
            <button class="btn btn-secondary" type="submit"><i class="fa fa-search"></i></button>
        </div>
    </div>
</form>

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
            全部图书
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>书名</th>
                <th>作者</th>
                <th>出版社</th>
                <th>ISBN</th>
                <th>价格</th>
                <th>是否在馆</th>
                <th>详情</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${books}" var="book">
            <tr>
                <td><c:out value="${book.book_id}"></c:out></td>
                <td><c:out value="${book.book_name}"></c:out></td>
                <td><c:out value="${book.book_auth}"></c:out></td>
                <td><c:out value="${book.book_pub}"></c:out></td>
                <td><c:out value="${book.ISBN}"></c:out></td>
                <td><c:out value="${book.book_pric}"></c:out></td>
                <c:if test="${book.in_library==true}">
                    <td style="color: green"><strong>在馆</strong></td>
                </c:if>
                <c:if test="${book.in_library==false}">
                     <td style="color: red"><strong>借出</strong></td>
                </c:if>
                <td><a href="admin_book_detail.html?bookId=<c:out value="${book.book_id}"></c:out>">
                    <button type="button" class="btn btn-outline-info btn-xs">详情</button>
                </a></td>
                <td><a href="updatebook.html?bookId=<c:out value="${book.book_id}"></c:out>"><button type="button" class="btn btn-outline-success btn-xs">编辑</button></a></td>
                <td><a href="javascript:if(window.confirm('是否确认该操作？')){window.location.href='deletebook.html?bookId=<c:out value="${book.book_id}'}"></c:out>"><button type="button" class="btn btn-outline-danger btn-xs">删除</button></a></td>

            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
<script>
    if (${StatusCode.equals("0")}){
        alert("删除失败！图书已借出!");
    }
    else {
        alert("删除成功！");
    }
</script>
</html>
