<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书馆</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="<c:url value="css/login.css"/>">
    <script src="/library/js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/js.cookie.js"></script>
    <script src="js/popper.js"></script>
</head>

<body class="img js-fullheight" style="background-image: url(img/LoginBG.jpg); background-size: 100% 100%">
<section class="ftco-section" style="">
    <div class="col-sm-12" id="MessageBox">
    </div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
                <h2 class="heading-section" style=" font-family:STKaiti ,serif; font-size: 300%">图书馆登录</h2>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">
                <div class="login-wrap p-0">
                    <h3 class="mb-4 text-center" style=" font-family:STKaiti ,serif;">用户登录</h3>

                        <div class="form-group">
                            <input type="text" id="Username" class="form-control" placeholder="账号" required>
                        </div>
                        <div class="form-group">
                            <input id="password-field" type="password" class="form-control" placeholder="密码" required>
                            <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                        </div>
                        <div class="form-group">
                            <button type="submit" onclick="login()" class="form-control btn btn-primary submit px-3" style="font-family:STKaiti ,serif; font-size: 150%">登录</button>
                        </div>
                        <div class="form-group d-md-flex">
                            <div class="w-50">
                                <label class="checkbox-wrap checkbox-primary" style="font-family:STKaiti ,serif;">记住密码
                                    <input type="checkbox" checked>
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="w-50 text-md-right">
                                <a href="#" style="font-family:STKaiti ,serif;">忘记密码</a>
                            </div>
                        </div>

                </div>
            </div>
        </div>
    </div>
</section>

</body>
<style>
    .alert>.start-icon {
        margin-right: 0;
        min-width: 20px;
        text-align: center;
    }

    .alert>.start-icon {
        margin-right: 5px;
    }

    .greencross
    {
        font-size:18px;
        color: #25ff0b;
        text-shadow: none;
    }

    .alert-simple.alert-success
    {
        margin-left: 25%;
        width: 50%;
        border: 1px solid rgba(36, 241, 6, 0.46);
        background-color: rgba(7, 149, 66, 0.12156862745098039);
        box-shadow: 0px 0px 2px #259c08;
        color: #0ad406;
        text-shadow: 2px 1px #00040a;
        transition:0.5s;
        cursor:pointer;
    }
    .alert-success:hover{
        background-color: rgba(7, 149, 66, 0.35);
        transition:0.5s;
    }
    .alert-simple.alert-danger
    {
        margin-left: 25%;
        width: 50%;
        border: 1px solid rgba(241, 6, 6, 0.81);
        background-color: rgba(220, 17, 1, 0.16);
        box-shadow: 0px 0px 2px #ff0303;
        color: #ff0303;
        text-shadow: 2px 1px #00040a;
        transition:0.5s;
        cursor:pointer;
    }

    .alert-danger:hover
    {
        background-color: rgba(220, 17, 1, 0.33);
        transition:0.5s;
    }

    .danger
    {
        font-size: 18px;
        color: #ff0303;
        text-shadow: none;
    }
    .alert:before {
        content: '';
        position: absolute;
        width: 0;
        height: calc(100% - 44px);
        border-left: 1px solid;
        border-right: 2px solid;
        border-bottom-right-radius: 3px;
        border-top-right-radius: 3px;
        left: 0;
        top: 50%;
        transform: translate(0,-50%);
        height: 20px;
    }

    .fa-times
    {
        -webkit-animation: blink-1 2s infinite both;
        animation: blink-1 2s infinite both;
    }


    /**
     * ----------------------------------------
     * animation blink-1
     * ----------------------------------------
     */
    @-webkit-keyframes blink-1 {
        0%,
        50%,
        100% {
            opacity: 1;
        }
        25%,
        75% {
            opacity: 0;
        }
    }
    @keyframes blink-1 {
        0%,
        50%,
        100% {
            opacity: 1;
        }
        25%,
        75% {
            opacity: 0;
        }
    }
</style>
<script>
(function($) {

    "use strict";
    $(".toggle-password").click(function() {

        $(this).toggleClass("fa-eye fa-eye-slash");
        var input = $($(this).attr("toggle"));
        if (input.attr("type") === "password") {
            input.attr("type", "text");
        } else {
            input.attr("type", "password");
        }
    });

})(jQuery);

const successBox = '<div class="alert fade alert-simple alert-success alert-dismissible text-center font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show">' +
    '<button type="button" class="close font__size-18" data-dismiss="alert">' +
    '<span aria-hidden="true">' +
    '<i class="fa fa-times greencross"></i>' +
    '</button>'+
    '<i class="start-icon far fa-check-circle faa-tada animated"></i>' +
    '<strong class="font__weight-semibold">Welcome!</strong> 登录成功.' +
    '</div>';

const failBox = '<div class="alert fade alert-simple alert-danger alert-dismissible text-center font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show" role="alert" data-brk-library="component__alert">'+
    '<button type="button" class="close font__size-18" data-dismiss="alert">'+'<span aria-hidden="true"> <i class="fa fa-times danger "></i> </span>'+
    '<span class="sr-only">Close</span></button>'+
    '<i class="start-icon far fa-times-circle faa-pulse animated"></i>'+
    '<strong class="font__weight-semibold">Oh no!</strong> 账号/密码错误！'+
    '</div>';


function login(){
    let name=$("#Username").val()
    let Passwd=$("#password-field").val()
    // const reg_id = /^\w{5,16}$/;
    // const reg_passwd = /^\w{8,16}$/;
    {
        $.ajax({
            type: "POST",
            url: "api/loginCheck",
            data: {
                username: name,
                password: Passwd
            },
            dataType: "json",
            success: function (data) {
                if (data.stateCode.trim() === "1") {
                    $('#MessageBox').prepend(successBox);
                    setTimeout("window.location.href = 'admin_main.html';",2000);
                } else if (data.stateCode.trim() === "0") {
                    $('#MessageBox').prepend(failBox);
                    setInterval("$('#MessageBox').empty();",3000);
                }
                else if (data.stateCode.trim()==="2"){
                    $('#MessageBox').prepend(successBox);
                    setTimeout("window.location.href = 'reader_main.html';",1000);
                }
            }
        });
    }
}
</script>

</html>

