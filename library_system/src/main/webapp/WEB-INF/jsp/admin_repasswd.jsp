<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>更改密码</title>
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
<div id="header" style="padding-bottom: 100px"></div>
<div style="position: relative">
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
<div style="background-color: #5bc0de;border-radius:50px; width: 60%; margin-left:20%; margin-top: 5% ">
    <h1 style="font-family: Lobster,cursive; padding-top:5%;padding-left: 5%">&nbsp;修改密码</h1>
    <div style="position:relative;margin-top: 5%; width: 60%;margin-left: 20%">
            <form action="admin_repasswd_do"  method="post" id="repasswd">
               <div class="form-group">
                    <label style="font-size:150%;margin-top:15px">输入旧密码</label>
                    <input type="password" id="oldPasswd" name="oldPasswd" placeholder="输入旧密码" class="form-control"
                        class="form-control" style="margin-top:20px">
               </div>
               <div class="form-group">
                    <label style="font-size:150%;margin-top:15px">输入新密码</label>
                    <input type="password" id="newPasswd" name="newPasswd" placeholder="输入新密码" class="form-control"
                        class="form-control" style="margin-top:20px">
               </div>
               <div class="form-group">
                      <label style="font-size:150%;margin-top:15px">再次输入新密码</label>
                      <input type="password" id="reNewPasswd" name="reNewPasswd" placeholder="再次输入新密码"
                           class="form-control" class="form-control" style="margin-top:20px">
               </div>
               <em id="tishi" style="color: red"></em>
               <br/>
               <span>
                   <input type="submit" value="提交" class="btn btn-success btn-lg" class="text-left" style="border-radius: 15px;margin-top:15px;font-size: 20px;margin-bottom:10%;margin-left: 40%; width: 20%;height: 50px">
               </span>
            </form>
    </div>
</div>
<script>
    $(document).keyup(function () {
        if ($("#newPasswd").val() != $("#reNewPasswd").val() && $("#newPasswd").val() != "" && $("#reNewPasswd").val() != "" && $("#newPasswd").val().length == $("#reNewPasswd").val().length) {
            $("#tishi").text("两次输入的新密码不同，请检查");
        } else {
            $("#tishi").text("");
        }
    })

    $("#repasswd").submit(function () {
        if ($("#oldPasswd").val() == '' || $("#newPasswd").val() == '' || $("#reNewPasswd").val() == '') {
            $("#tishi").text("请填写完毕后提交");
            return false;
        } else if ($("#newPasswd").val() != $("#reNewPasswd").val()) {
            $("#tishi").text("两次输入的新密码不同，请检查");
            return false;
        }
    })
</script>
</body>
<script>
    if(${StatusCode.equals("0")}){
        alert("修改密码失败，旧密码不正确");
    }
    else{
        alert("修改密码成功！");
    }

</script>
</html>
