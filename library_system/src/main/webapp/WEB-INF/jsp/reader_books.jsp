<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>全部图书信息</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('reader_header.html');
        })
    </script>
</head>
<header id="header"></header>
<body style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<form name="form1" method="post" action="reader_querybook_do.html" class="form-block"  id="searchform"  style="margin-left:35%; width: 30%; margin-top: 50px;margin-bottom: 50px">
    <div class="input-group">
        <input type="text" placeholder="输入图书名" class="form-control" id="searchWord" name="searchWord" style="height: 40px; font-size: 15px">
        <div class="input-group-append">
            <button class="btn btn-secondary" type="submit" onclick="check();"><i class="fa fa-search"></i></button>
        </div>
    </div>
    <div class="input-group">
        <input type="radio" name="a" style="color:white;margin-top:16px" checked="checked">
        <label style="color:white;margin-top:10px;font-size:15px">书名</label>
        <input type="radio" name="a" style="color:white;margin-left:30px;margin-top:16px">
        <label style="color:white;margin-top:10px;font-size:15px">作者</label>
        <input type="radio" name="a" style="color:white;margin-left:30px;margin-top:16px">
        <label style="color:white;margin-top:10px;font-size:15px">出版社</label>
        <input type="radio" name="a" style="color:white;margin-left:30px;margin-top:16px">
        <label style="color:white;margin-top:10px;font-size:15px">ISBN</label>
    </div>
    <script language="javascript">
        function check(){
        if(document.form1.a[0].checked==true)
            document.form1.action="reader_querybook_do.html";
        else if(document.form1.a[1].checked==true)
            document.form1.action="reader_querybookByAuth_do.html"
        else if(document.form1.a[2].checked==true)
            document.form1.action="reader_querybookByPub_do.html"
        else
            document.form1.action="reader_querybookByISBN_do.html"
        }
    </script>
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
<div class="panel panel-default" style="width: 80%;margin-left: 10%;margin-bottom:10%">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">
            全部图书
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>书名</th>
                <th>作者</th>
                <th>出版社</th>
                <th>ISBN</th>
                <th>价格</th>
                <th>剩余数量</th>
                <th>借还</th>
                <th>详情</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${books}" var="book">
                <tr>
                    <td><c:out value="${book.book_name}"></c:out></td>
                    <td><c:out value="${book.book_auth}"></c:out></td>
                    <td><c:out value="${book.book_pub}"></c:out></td>
                    <td><c:out value="${book.ISBN}"></c:out></td>
                    <td><c:out value="${book.book_pric}"></c:out></td>
                    <td><c:out value="${book.res_num}"></c:out></td>

                    <c:set var="flag" value="false"/>
                    <c:forEach var="lend" items="${myLendList}">
                        <c:if test="${lend eq book.book_id}">
                            <c:set var="flag" value="true"/>
                        </c:if>
                    </c:forEach>

                    <c:if test="${not flag}">
                        <c:if test="${book.res_num>0}">
                                <td>
                                    <c:if test="${book.ISBN.equals(bookingBookISBN)}">
                                        <button type="button" class="btn btn-info btn-xs" disabled="disabled">预约中</button>
                                    </c:if>
                                    <c:if test="${!book.ISBN.equals(bookingBookISBN)}">
                                        <button type="button" class="btn btn-info btn-xs" onclick="readerBooking('${book.ISBN}')" >预约</button>
                                    </c:if>
                                </td>
                        </c:if>
                        <c:if test="${book.res_num==0}">
                            <td>
                                <c:if test="${book.ISBN.equals(bookingBookISBN)}">
                                    <button type="button" class="btn btn-info btn-xs" disabled="disabled">已预约</button>
                                </c:if>
                                <c:if test="${!book.ISBN.equals(bookingBookISBN)}">
                                    <button type="button" class="btn btn-danger btn-xs" disabled="disabled">已空</button>
                                </c:if>
                            </td>
                        </c:if>
                    </c:if>
                    <td><a href="reader_book_detail.html?ISBN=<c:out value="${book.ISBN}"></c:out>">
                        <button type="button" class="btn btn-outline-info btn-xs">详情</button>
                    </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
<script>
    function readerBooking(bookISBN){
        let userID=$('#userMail').text();
        console.log('${USER_SESSION.rest_lend_num}');
        $.ajax({
            type:"POST",
            url: "api/readerBooking",
            data:{
                bookISBN:bookISBN,
                userId:userID,
            },
            dataType:"json",
            success: function (data){
                messagePre(data.StatusCode.trim());
            }
        })
    }

    function messagePre(code){
        if (code=="1"){
            alert("预约成功!");
            window.location.href= "reader_books.html";
        }
        else if (code=="0"){
            alert("预约失败！");
            window.location.href= "reader_books.html";
        }
        else if (code=="-1"){
            alert("已预约书籍，请等待处理!");
            window.location.href= "reader_books.html";
        }
        else if (code=="-2"){
            alert("已到达最大借阅图书数量!");
            window.location.href= "reader_books.html";
        }
    }
</script>
</html>
