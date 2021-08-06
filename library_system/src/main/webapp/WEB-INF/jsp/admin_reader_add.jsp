<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加读者</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/bootstrap.min.js" ></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
</head>
<header id="header"></header>
<body style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed">
<div class="col-sm-12" id="MessageBox">
</div>

<div style="background-color: #5bc0de;border-radius:50px; width: 60%; margin-left:20%; margin-top: 5% ">
    <h1 style="font-family: Lobster,cursive; padding-top:5%;padding-left: 5%">&nbsp;新增读者</h1>
    <div style="position:relative;margin-top: 5%; width: 60%;margin-left: 20%">
        <form action="reader_add_do.html"  method="post" id="addbook">
            <div class="form-group">
                 <label for="mail" style="font-size:150%;margin-top:15px">邮箱</label>
                 <input type="text" class="form-control" name="mail" id="mail" placeholder="请输入邮箱">
            </div>
            <div class="form-group">
                <label for="name" style="font-size:150%;margin-top:15px">昵称</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="请输入昵称">
            </div>
            <div class="form-group">
                <label for="password" style="font-size:150%;margin-top:15px">密码</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码">
            </div>
        </form>
        <button id="AddBtn" class="btn btn-success btn-lg" onclick="confirm()" style="border-radius: 15px;margin-top:15px;font-size: 20px;margin-bottom:10%;margin-left: 40%; width: 20%;height: 50px">添加</button>
               <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content"  style="border-radius: 10px">
                    <div class="modal-header">
                        <h2 class="modal-title" id="myModalLabel" style="font-family: 'Heiti SC',serif; ">确认添加新用户</h2>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" style="font-size: 30px">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <dl class="row" style="padding-left: 20%">
                            <dt class="col-sm-3">昵称:</dt>
                            <dd class="col-sm-9" id="com-B-name"></dd>
                            <dt class="col-sm-3">密码:</dt>
                            <dd class="col-sm-9" id="com-B-passwd"></dd>
                            <dt class="col-sm-3">邮箱:</dt>
                            <dd class="col-sm-9" id="com-B-mail"></dd>
                        </dl>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-lg" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary btn-lg" onclick="addingReader()">确认添加</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<style>
    .col-sm-3{
        padding-top: 5px;
    }
    .col-sm-9{
        padding-top: 5px;
    }

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
    const successBox = '<div class="alert fade alert-simple alert-success alert-dismissible text-center font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show">' +
        '<button type="button" class="close font__size-18" data-dismiss="alert">' +
        '<span aria-hidden="true">' +
        '<i class="fa fa-times greencross"></i>' +
        '</button>'+
        '<i class="start-icon far fa-check-circle faa-tada animated"></i>' +
        '<strong class="font__weight-semibold">Well done!</strong> 注册成功.' +
        '</div>';

    const failBox = '<div class="alert fade alert-simple alert-danger alert-dismissible text-center font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show" role="alert" data-brk-library="component__alert">'+
        '<button type="button" class="close font__size-18" data-dismiss="alert">'+'<span aria-hidden="true"> <i class="fa fa-times danger "></i> </span>'+
        '<span class="sr-only">Close</span></button>'+
        '<i class="start-icon far fa-times-circle faa-pulse animated"></i>'+
        '<strong class="font__weight-semibold">Oh snap!</strong> 邮箱已注册，请重试！'+
        '</div>';

    function confirm() {
        let name=$("#name").val();
        let id=$("#ID").val();
        let sex=$("#sex").val();
        let passwd=$("#password").val();
        let birthday=$("#birthday").val();
        let mail=$("#mail").val();
        let address=$("#address").val();
        let phone=$("#phone").val();
        if (name === ''||  passwd === '' ||mail === '' ) {
            alert("请填入完整用户信息！");
            return false;
        }
        else {
            $('#com-B-ID').text(id);
            $('#com-B-name').text(name);
            $('#com-B-passwd').text(passwd);
            $('#com-B-sex').text(sex);
            $('#com-B-birthday').text(birthday);
            $('#com-B-mail').text(mail);
            $('#com-B-address').text(address);
            $('#com-B-phone').text(phone);
            $('#myModal').modal("show");
        }
    }

    function addingReader(){
        let name=$("#name").val();
        let passwd=$("#password").val();
        let mail=$("#mail").val();
        $.ajax({
            type:"POST",
            url: "api/AddReader",
            data:{
                name: name,
                password: passwd,
                mail: mail,
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
        }
        else if (code==="0"){
            $('#MessageBox').prepend(failBox);
            setInterval("$('#MessageBox').empty();",3000);
            setTimeout("$('#myModal').modal('hide');",1000);
        }
    }
</script>
</html>
