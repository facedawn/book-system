<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*"%>
<html>

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/library/css/login.css">
    <script src="/library/js/jquery-3.2.1.js"></script>
    <script src="/library/js/login.js"></script>
    <title>登陆界面</title>

</head>


<body>

    <div class="pic middiv" style="height: 10%;">
        <p style="font-size:larger;">图书管理系统登录</p>
    </div>
    <div class="outborder">
        <div class="text middiv">
            <p id="main-tips">提示信息<br><br><br><br><br><br><br><br><br><br><br><br><br>提示信息</p>
        </div>
        <div class="login middiv">
            <!--<img src="src\black.png" style="width: 100%; height: 30%; object-fit: cover;">-->
            <div id="top-tips">请登录</div><br>
            <div style="margin: 10%;">
                <label>username:</label>

                <input type="text" name="username" id="username" size="30" onkeydown="return disableTextSubmit(event)">
                <br>
                <br id="d" style="display:none;">
                <label id="emailLabel" style="display:none">email:</label>
                <input type="text" id="email" size="30" style="display:none">
                <input id="hiddenText" name="mode" value="login" type="text" style="display:none" />

                <label>password:</label>
                <input type="password" name="password" id="password" size="30" onkeydown="return disableTextSubmit(event)">
                <br><br>
                <input id="register" class="button" type="button" value="去注册" onclick='return to_register();';>
                <input id="in" class="button" type="button" value="登录">
                <input id="submitregister" class="button" type="button" value="注册"
                    style="display: none;margin:0 auto">

                <br>
                <p id="notice"></p>
            </div>
            </div>
        </div>
</body>


<script>

$('#submitregister').click(function(){
     var username =$("#username").val();
     var email=$('#email').val();
     var password=$("#password").val();
     if (username==''){
    	  $("#notice").text("提示:账号不能为空");
     }
     else if( email ==''){
         $("#notice").text("提示:邮箱不能为空");
     }
     else if( password ==''){
         $("#notice").text("提示:密码不能为空");
     }
     else
   	 {
    	 $.ajax({
    		 type:"POST",
    		 url:"api/register",
    		 data:{
    			 username:username,
    			 email:email,
    			 password:password
    		 },
    		 dataType:"json",
    		 success:function(data){
    			 if(data.stateCode.trim()==="0")
    			 {
    				 $("#notice").text("提示:注册失败，该邮箱已经注册过");
    			 }
    			 else if(data.stateCode.trim()==="1")
    			 {
    				 $("#notice").text("提示:注册成功");
    				 location.reload();
    			 }
    		 }
    	 })
   	 }
     
     
})

$("#in").click(function () {
            var username =$("#username").val();
            var password=$("#password").val();
            if (username == '') {
                $("#notice").text("提示:账号不能为空");
            }
            else if( password ==''){
                $("#notice").text("提示:密码不能为空");
            }
            else {
                $.ajax({
                    type: "POST",
                    url: "api/loginCheck",
                    data: {
                        username:username ,
                        password: password
                    },
                    dataType: "json",
                    success: function(data) {
                    console.log(data.stateCode);
                        if (data.stateCode.trim() === "0") {
                            $("#notice").text("提示:账号或密码错误！");
                        } else if (data.stateCode.trim() === "1") {
                            $("#notice").text("提示:登陆成功，跳转中...");
                            window.location.href="admin_main.html";
                        } else if (data.stateCode.trim() === "2") {

                            $("#notice").text("提示:登陆成功，跳转中...");
                            window.location.href="reader_main.html";

                        }
                    }
                })
            }
        })

</script>
</html>