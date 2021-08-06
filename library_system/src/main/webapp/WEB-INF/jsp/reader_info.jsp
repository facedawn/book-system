<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${USER_SESSION.user_name}的主页</title>
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
<div id="header" style="padding-bottom: 80px"></div>
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
<div style="background-color: #5bc0de;border-radius:50px; width: 60%; margin-left:20%; margin-top: 5% ">
    <h1 style="font-family: Lobster,cursive; padding-top:5%;padding-left: 5%">&nbsp;个人信息</h1>

    <div class="panel-body">
            <table class="table table-hover" style="background: #b3d7ff;width: 80%;margin-left: 10%;border-radius: 10px">
                <tr>
                    <th>用户名</th>
                    <td>${readerinfo.user_name}</td>
                </tr>
                <tr>
                    <th>邮箱</th>
                    <td>${readerinfo.user_email}</td>
                </tr>
                <tr>
                    <th>剩余可借书籍数量</th>
                    <td>${readerinfo.rest_lend_num}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <a class="btn btn-success btn-lg" href="reader_info_edit.html" role="button" style="border-radius: 15px;margin-top:15px;font-size: 25px;margin-bottom:5%;margin-left: 44%; width: 12%;height: 50px">修改</a>
</div>

</body>
</html>
