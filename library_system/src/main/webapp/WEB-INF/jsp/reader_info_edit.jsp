<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<header id="header"></header>
<body style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div style="background-color: #5bc0de;border-radius:50px; width: 60%; margin-left:20%; margin-top: 5% ">
    <h1 style="font-family: Lobster,cursive; padding-top:5%;padding-left: 5%">&nbsp;信息修改</h1>
    <div style="position:relative;margin-top: 5%; width: 60%;margin-left: 20%">
            <form action="reader_edit_do_r.html" method="post" id="edit" >
                <div class="form-group">
                    <label style="font-size:150%;margin-top:15px">邮箱</label>
                    <input type="text" id="email" name="email" class="form-control"
                           style="margin-top:20px;font-size: 18px" readonly value="${readerinfo.user_email}">
                </div>
                <div class="form-group">
                    <label style="font-size:150%;margin-top:15px">用户名</label>
                    <input type="text" id="name" name="name" class="form-control"
                           style="margin-top:20px;font-size: 18px" value="${readerinfo.user_name}">
                </div>
                <input type="submit" value="确定" class="btn btn-success btn-lg" style="border-radius: 15px;;margin-top:20px;width: 20%;height:5%;margin-left:40%;margin-bottom: 5%">
                <script>
                    $("#edit").submit(function () {
                        if($("#name").val()==''){
                            alert("请填入正确用户信息！");
                            return false;
                        }
                    })
                </script>
            </form>
        </div>
</div>
</body>
</html>
