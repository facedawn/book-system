<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: haruki_9
  Date: 2021/7/27
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>预约处理</title>
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
<div class="col-sm-12" id="MessageBox" style="margin-top: 2%">
</div>
<body style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div class="panel panel-default" style="width: 80%;margin-left: 10%;margin-top:10%">
    <div class="panel-heading" style="background-color: #fff">
        <h3 class="panel-title">
            预约记录
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>邮箱</th>
                <th>图书号</th>
                <th>预约时间</th>
                <th>状态</th>
                <th>接受</th>
                <th>拒绝</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${Bookings}" var="booking">
                <tr>
                    <td><c:out value="${booking.user_email}"></c:out></td>
                    <td><c:out value="${booking.book_id}"></c:out></td>
                    <td><c:out value="${booking.booking_time}"></c:out></td>
                    <c:if test="${booking.status==1}">
                        <td style="color: #009eac">
                            待处理
                        </td>
                        <td><button type="button" class="btn btn-outline-success btn-xs" onclick="RefuseAdmit('${booking.user_email}','${booking.book_id}','admit')">接受</button></td>
                        <td><button type="button" class="btn btn-outline-danger btn-xs" onclick="RefuseAdmit('${booking.user_email}','${booking.book_id}','refuse')">拒绝</button></td>
                    </c:if>
                    <c:if test="${booking.status==0}">
                        <td style="color: green">
                            已同意
                        </td>
                        <td><button type="button" disabled="disabled" class="btn btn-outline-success btn-xs">接受</button></td>
                        <td><button type="button" disabled="disabled" class="btn btn-outline-danger btn-xs">拒绝</button></td>
                    </c:if>
                    <c:if test="${booking.status==-1}">
                        <td style="color: red">
                            已拒绝
                        </td>
                        <td><button type="button" disabled="disabled" class="btn btn-outline-success btn-xs">接受</button></td>
                        <td><button type="button" disabled="disabled" class="btn btn-outline-danger btn-xs">拒绝</button></td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
<style>
    .alert-simple.alert-primary
    {
        width: 50%;
        margin-left: 25%;
        border: 1px solid rgba(6, 241, 226, 0.81);
        background-color: rgba(1, 204, 220, 0.16);
        box-shadow: 0px 0px 2px #03fff5;
        color: #03d0ff;
        text-shadow: 2px 1px #00040a;
        transition:0.5s;
        cursor:pointer;
    }

    .alert-primary:hover{
        background-color: rgba(1, 204, 220, 0.33);
        transition:0.5s;
    }

    .alertprimary
    {
        font-size: 18px;
        color: #03d0ff;
        text-shadow: none;
    }

</style>
<script>
    const admitBox='<div class="col-sm-12">'+
        '<div class="alert fade alert-simple alert-primary alert-dismissible text-left font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show" role="alert" data-brk-library="component__alert">'+
        '<button type="button" class="close font__size-18" data-dismiss="alert">'+
                '<span  aria-hidden="true"><i class="fa fa-times alertprimary"></i></span>'+
                '<span class="sr-only">Close</span>'+
            '</button>'+
            '<i class="start-icon fa fa-thumbs-up faa-bounce animated"></i>'+
            '<strong class="font__weight-semibold">处理预约</strong> 成功交付预约书籍到读者！'+
        '</div>'+
    '</div>';

    const refuseBox='<div class="col-sm-12">'+
        '<div class="alert fade alert-simple alert-primary alert-dismissible text-left font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show" role="alert" data-brk-library="component__alert">'+
        '<button type="button" class="close font__size-18" data-dismiss="alert">'+
        '<span  aria-hidden="true"><i class="fa fa-times alertprimary"></i></span>'+
        '<span class="sr-only">Close</span>'+
        '</button>'+
        '<i class="start-icon fa fa-thumbs-up faa-bounce animated"></i>'+
        '<strong class="font__weight-semibold">处理预约</strong> 拒绝交付预约书籍！'+
        '</div>'+
        '</div>';

    function RefuseAdmit(email,bookId,decision){
        console.log(email,bookId,decision);
        $.ajax({
            type:"POST",
            url: "api/BookingDealing",
            data:{
                email:email,
                bookId:bookId,
                decision:decision,
            },
            dataType:"json",
            success: function (data){
                messagePre(data.StatusCode.trim());
            },
            error: function (){
                console.log("error!");
            }
        })
    }

    function messagePre(code){
        if (code==="0"){
            $('#MessageBox').prepend(refuseBox);
            setInterval("$('#MessageBox').empty();window.location.href = 'admin_bookings.html';",1500);
        }
        else if (code==="1"){
            $('#MessageBox').prepend(admitBox);
            setInterval("$('#MessageBox').empty();window.location.href = 'admin_bookings.html';",1500);
        }
    }
</script>
</html>
