<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>《 ${detail.book_name}》</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
        })
    </script>
</head>
<body style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header"></div>
<div class="col-xs-6 col-md-offset-3" style="position: relative;top: 15%">
    <div class="panel panel-primary">
        <div class="panel-heading" style="background-color:grey;color:black">
            <h3 class="panel-title">《 ${detail.book_name}》</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tr>
                    <th width="15%">书名</th>
                    <td>${detail.book_name}</td>
                </tr>
                <tr>
                    <th>作者</th>
                    <td>${detail.book_auth}</td>
                </tr>
                <tr>
                    <th>出版社</th>
                    <td>${detail.book_pub}</td>
                </tr>
                <tr>
                    <th>ISBN</th>
                    <td>${detail.ISBN}</td>
                </tr>
                <tr>
                    <th>简介</th>
                    <td>${detail.book_intro}</td>
                </tr>

                <tr>
                    <th>价格</th>
                    <td>${detail.book_pric}</td>
                </tr>

                <tr>
                    <th>状态</th>
                    <c:if test="${detail.res_num>0}">
                        <td>在馆</td>
                    </c:if>
                    <c:if test="${detail.res_num==0}">
                        <td>借出</td>
                    </c:if>

                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>

</body>
</html>
