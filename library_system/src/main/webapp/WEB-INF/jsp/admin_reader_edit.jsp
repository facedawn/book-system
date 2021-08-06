<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑读者信息《 ${readerInfo.user_email}》</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<body style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header" style="padding-bottom: 80px"></div>
<div class="col-xs-6 col-md-offset-3" style="position: relative;">
    <div class="panel panel-primary">
        <div class="panel-heading" style="background-color:grey;color:black">
            <h3 class="panel-title">编辑读者信息《 ${readerInfo.user_email}》</h3>
        </div>
        <div class="panel-body">
            <form action="reader_edit_do.html?user_email=${readerInfo.user_email}" method="post" id="readeredit" >
            <div class="input-group" style="margin-top:20px">
                                <span class="input-group-addon" style="width:10%">邮箱</span>
                                <input type="text" class="form-control" name="email" id="email" value="${readerInfo.user_email}" readonly="true">
                            </div>
                <div class="input-group"style="margin-top:20px">
                    <span class="input-group-addon" style="width:10%">姓名</span>
                    <input type="text" class="form-control" name="name" id="name" value="${readerInfo.user_name}" >
                </div>
                <input type="submit" value="确定" class="btn btn-success btn-sm" class="text-left" style="margin-top:20px">
                <script>
                    $("#readeredit").submit(function () {
                        if($("#name").val()==''||$("#sex").val()==''||$("#birth").val()==''||$("#address").val()==''||$("#phone").val()==''||$("#email").val()==''){
                            alert("请填入完整读者信息！");
                            return false;
                        }
                    })
                </script>
            </form>
        </div>
    </div>

</div>

</body>
</html>
