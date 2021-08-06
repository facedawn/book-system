<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加记录</title>
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
    <h1 style="font-family: Lobster,cursive; padding-top:5%;padding-left: 5%">&nbsp;新增记录</h1>
    <div style="position:relative;margin-top: 5%; width: 60%;margin-left: 20%">
        <form action="admin_lend_list_add_do.html"  method="post" id="addRecord">
            <div class="form-group">
                 <label for="bookId" style="font-size:150%;margin-top:15px">图书号</label>
                 <input type="text" class="form-control" name="bookId" id="bookId" placeholder="请输入图书号">
            </div>
            <div class="form-group">
                <label for="readerID" style="font-size:150%;margin-top:15px">读者邮箱</label>
                <input type="text" class="form-control" name="readerID" id="readerID" placeholder="请输入读者邮箱">
            </div>
        </form>
        <button id="AddBtn" type="submit" class="btn btn-success btn-lg" onclick="confirm()" style="border-radius: 15px;margin-top:15px;font-size: 20px;margin-bottom:10%;margin-left: 40%; width: 20%;height: 50px">添加</button>
               <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content"  style="border-radius: 10px">
                    <div class="modal-header">
                        <h2 class="modal-title" id="myModalLabel" style="font-family: 'Heiti SC',serif; ">确认添加新记录</h2>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" style="font-size: 30px">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <dl class="row" style="padding-left: 20%">

                            <dt class="col-sm-3">图书号:</dt>
                            <dd class="col-sm-9" id="com-B-bookID"></dd>
                            <dt class="col-sm-3">读者证号:</dt>
                            <dd class="col-sm-9" id="com-B-readerID"></dd>
                        </dl>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-lg" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary btn-lg" onclick="addingRecord()">确认添加</button>
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
        '<strong class="font__weight-semibold">Well done!</strong> 新增借书记录成功!' +
        '</div>';


    const noBookBox = '<div class="alert fade alert-simple alert-danger alert-dismissible text-center font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show" role="alert" data-brk-library="component__alert">'+
        '<button type="button" class="close font__size-18" data-dismiss="alert">'+'<span aria-hidden="true"> <i class="fa fa-times danger "></i> </span>'+
        '<span class="sr-only">Close</span></button>'+
        '<i class="start-icon far fa-times-circle faa-pulse animated"></i>'+
        '<strong class="font__weight-semibold">Oh snap!</strong> 图书不存在！'+
        '</div>';
    const outBookBox = '<div class="alert fade alert-simple alert-danger alert-dismissible text-center font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show" role="alert" data-brk-library="component__alert">'+
        '<button type="button" class="close font__size-18" data-dismiss="alert">'+'<span aria-hidden="true"> <i class="fa fa-times danger "></i> </span>'+
        '<span class="sr-only">Close</span></button>'+
        '<i class="start-icon far fa-times-circle faa-pulse animated"></i>'+
        '<strong class="font__weight-semibold">Oh snap!</strong> 图书已借出！'+
        '</div>';
    const noUserBox = '<div class="alert fade alert-simple alert-danger alert-dismissible text-center font__family-montserrat font__size-16 font__weight-light brk-library-rendered rendered show" role="alert" data-brk-library="component__alert">'+
        '<button type="button" class="close font__size-18" data-dismiss="alert">'+'<span aria-hidden="true"> <i class="fa fa-times danger "></i> </span>'+
        '<span class="sr-only">Close</span></button>'+
        '<i class="start-icon far fa-times-circle faa-pulse animated"></i>'+
        '<strong class="font__weight-semibold">Oh snap!</strong> 读者用户不存在！'+
        '</div>';

    function confirm() {
        let bookId=$('#bookId').val();
        let readerId=$('#readerID').val();
        if (bookId===''||readerId===''){
            alert("图书ID或读者ID不能为空！");
        }
        else {
            $('#com-B-bookID').text(bookId);
            $('#com-B-readerID').text(readerId);
            $('#myModal').modal('show');
        }
    }

    function addingRecord(){
        let bookId=$('#bookId').val();
        let readerId=$('#readerID').val();
        $.ajax({
            type:"POST",
            url: "api/AddRecord",
            data:{
                bookId: bookId,
                readerId: readerId,
            },
            dataType:"json",
            success: function (data){
                messagePre(data.StatusCode.trim());
            },
            error: function (){
                console.log("here");
            }
        })
    }

    function messagePre(code){
        if (code==="0"){
            $('#MessageBox').prepend(noBookBox);
            setInterval("$('#MessageBox').empty();",3000);
            setTimeout("$('#myModal').modal('hide');",1000);
        }
        else if (code==="01"){
            $('#MessageBox').prepend(outBookBox);
            setInterval("$('#MessageBox').empty();",3000);
            setTimeout("$('#myModal').modal('hide');",1000);
        }
        else if (code==="1"){
            $('#MessageBox').prepend(successBox);
            setInterval("$('#MessageBox').empty();",3000);
            setTimeout("$('#myModal').modal('hide');",1000);
        }
        else if (code==="10"){
            $('#MessageBox').prepend(noUserBox);
            setInterval("$('#MessageBox').empty();",3000);
            setTimeout("$('#myModal').modal('hide');",1000);
        }
    }
</script>
</html>
