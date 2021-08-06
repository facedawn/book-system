<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>罚款情况</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<body style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header"></div>
<div style="position: relative;padding-top: 10px">
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
<div class="col-sm-12" id="MessageBox">
</div>
<div>
    <form method="post" name="form1" action="query_all_fine_log.html" class="form-block" id="searchform" style="margin-left:35%;width:30%;margin-top:50px;margin-bottom:50px">
        <div class="input-group">
            <input type="date" class="form-control" name="begin" id="begin" style="height:40">
            <span class="input-group-addon" style="width:40;height:40;padding-top:12">到</span>
            <input type="date" class="form-control" name="end" id="end" style="height:40">
            <div class="input-group-append">
                <button class="btn btn-secondary" type="submit" onclick="check()"><i class="fa fa-search"></i></button>
            </div>
        </div>
        <div class="input-group">
                        <input type="radio" name="a" style="color:white;margin-top:16px" checked="checked">
                        <label style="color:white;margin-top:10px;font-size:15px">全选</label>
                        <input type="radio" name="a" style="color:white;margin-left:30px;margin-top:16px">
                        <label style="color:white;margin-top:10px;font-size:15px">已还</label>
                        <input type="radio" name="a" style="color:white;margin-left:30px;margin-top:16px">
                        <label style="color:white;margin-top:10px;font-size:15px">未还</label>
        </div>
        <script language="javascript">
        function check(){
            if(document.form1.a[0].checked==true)
            {
            document.form1.action="query_all_fine_log.html";
            }
            else if(document.form1.a[1].checked==true)
                document.form1.action="query_payed_fine_log.html"
            else
                document.form1.action="query_unpayed_fine_log.html"
        }
        </script>
    </form>
</div>
<div class="panel panel-default" style="width: 90%;margin-left: 5%">
    <div class="panel-heading">
        <h3 class="panel-title">
            罚款情况
        </h3>
    </div>
    <div class="panel-body">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>图书号</th>
                <th>读者邮箱</th>
                <th>借出日期</th>
                <th>归还日期</th>
                <th>罚款金额</th>
                <th>罚款归还情况</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="alog">
                <tr>
                    <td><c:out value="${alog.book_id}"></c:out></td>
                    <td><c:out value="${alog.user_email}"></c:out></td>
                    <td><c:out value="${alog.lend_time}"></c:out></td>
                    <td><c:out value="${alog.return_time}"></c:out></td>
                    <td><c:out value="${alog.fine_amount}"></c:out></td>
                    <td>
                        <c:if test="${alog.pay_situ==false}">
                           <button type="button" class="btn btn-danger btn-xs" onclick="confirm('${alog.book_id}', '${alog.user_email}', '${alog.lend_time}', '${alog.return_time}', '${alog.fine_amount}')">未还</button>
                               <!-- Modal -->
                           <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
                                 <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                      <div class="modal-content"  style="border-radius: 10px">
                                         <div class="modal-header">
                                             <h2 class="modal-title" id="myModalLabel" style="font-family: 'Heiti SC',serif; ">确认用户已经缴清罚款</h2>
                                             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                 <span aria-hidden="true" style="font-size: 30px">&times;</span>
                                             </button>
                                         </div>
                                         <div class="modal-body">
                                              <dl class="row" style="padding-left: 20%">
                                                   <dt class="col-sm-3">图书号:</dt>
                                                   <dd class="col-sm-9" id="com_book_id"></dd>
                                                   <dt class="col-sm-3">邮箱:</dt>
                                                   <dd class="col-sm-9" id="com_user_email"></dd>
                                                   <dt class="col-sm-3">罚款金额:</dt>
                                                   <dd class="col-sm-9" id="com_fine_amount"></dd>
                                              </dl>
                                         </div>
                                         <div class="modal-footer">
                                              <button type="button" class="btn btn-secondary btn-lg" data-dismiss="modal">取消</button>
                                              <button type="button" class="btn btn-primary btn-lg" onclick="userPayAFine('${alog.book_id}', '${alog.user_email}', '${alog.lend_time}')">确认</button>
                                         </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${alog.pay_situ==true}">
                            <button type="button" class="btn btn-success btn-xs" disabled="disabled" >已还</button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script>

    const successBox = '<div class="alert fade alert-simple alert-success alert-dismissible text-center font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show">' +
            '<button type="button" class="close font__size-18" data-dismiss="alert">' +
            '<span aria-hidden="true">' +
            '<i class="fa fa-times greencross"></i>' +
            '</button>'+
            '<strong class="font__weight-semibold">Well done!</strong> 修改成功.' +
            '</div>';

        const failBox = '<div class="alert fade alert-simple alert-danger alert-dismissible text-center font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show" role="alert" data-brk-library="component__alert">'+
            '<button type="button" class="close font__size-18" data-dismiss="alert">'+'<span aria-hidden="true"> <i class="fa fa-times danger "></i> </span>'+
            '<span class="sr-only">Close</span></button>'+
            '<strong class="font__weight-semibold">Oh snap!</strong> 修改失败，请重试！'+
            '</div>';

    function confirm(book_id, user_email, lend_time, return_time, fine_amount){
        $('#com_book_id').text(book_id);
        $('#com_user_email').text(user_email);
        $('#com_fine_amount').text(fine_amount);
        $('#myModal').modal("show");
    }

    function userPayAFine(book_id, user_email, lend_time){
            $.ajax({
                type:"POST",
                url: "api/userPayAFine",
                data:{
                    book_id: book_id,
                    user_email: user_email,
                    lend_time: lend_time,
                },
                dataType:"json",
                success: function (data){
                    messagePre(data.StatusCode.trim());
                }
            })
    }
    function messagePre(code){
            if (code==="1"){
                $('#MessageBox').prepend(successBox);
                setInterval("$('#MessageBox').empty();",3000);
                setTimeout("$('#myModal').modal('hide');",1000);
                $('#myModal').modal("hide");
            }
            else if (code==="0"){
                $('#MessageBox').prepend(failBox);
                setInterval("$('#MessageBox').empty();",3000);
                setTimeout("$('#myModal').modal('hide');",1000);
            }
    }
</script>

</body>
</html>
