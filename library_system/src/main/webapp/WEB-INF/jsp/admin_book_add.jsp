<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书信息添加</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.2.1.js"></script>
    <style>
        .form-group {
            margin-bottom: 0;
        }
    </style>
    <script>
        $(function () {
            $('#header').load('admin_header.html');
        })
    </script>
    <script src="js/bootstrap.js"></script>
</head>
<header id="header"></header>
<body style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed">
<div style="background-color: #5bc0de;border-radius:50px; width: 60%; margin-left:20%; margin-top: 5% ">
    <h1 style="font-family: Lobster,cursive; padding-top:5%;padding-left: 5%">&nbsp;新增图书</h1>
    <div style="position:relative;margin-top: 5%; width: 60%;margin-left: 20%">
        <form action="book_add_do.html"  method="post" id="addbook">
            <div class="form-group">
                <label for="name" style="font-size:150%;margin-top:15px">图书名</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="请输入书名">
            </div>
            <div class="form-group">
                <label for="author" style="font-size:150%;margin-top:15px">作者</label>
                <input type="text" class="form-control" name="author" id="author" placeholder="请输入作者名">
            </div>
            <div class="form-group">
                <label for="publish" style="font-size:150%;margin-top:15px">出版社</label>
                <input type="text" class="form-control" name="publish" id="publish" placeholder="请输入出版社">
            </div>
            <div class="form-group">
                <label for="isbn" style="font-size:150%;margin-top:15px">ISBN</label>
                <input type="text" class="form-control" name="isbn" id="isbn" placeholder="请输入ISBN">
            </div>
            <div class="form-group">
                <label for="introduction" style="font-size:150%;margin-top:15px">简介</label>
                <textarea class="form-control" rows="3" name="introduction" id="introduction"
                          placeholder="请输入简介"></textarea>
            </div>
            <div class="form-group">
                <label for="price" style="font-size:150%;margin-top:15px">价格</label>
                <input type="text" class="form-control" name="price" id="price" placeholder="请输入价格">
            </div>

            <div class="form-group">
                <label for="number" style="font-size:150%;margin-top:15px">数量</label>
                <input type="text" class="form-control" name="number" id="number" placeholder="请输入图书数量">
            </div>
        </form>
        <button id="AddBtn" class="btn btn-success btn-lg" onclick="confirm();" style="border-radius: 15px;margin-top:15px;font-size: 20px;margin-bottom:10%;margin-left: 40%; width: 20%;height: 50px">添加</button>
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content"  style="border-radius: 10px">
                    <div class="modal-header">
                        <h2 class="modal-title" id="myModalLabel" style="font-family: 'Heiti SC',serif; ">确认添加图书</h2>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" style="font-size: 30px">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <dl class="row">
                            <dt class="col-sm-3">图书名:</dt>
                            <dd class="col-sm-9" id="com-B-name"></dd>
                            <dt class="col-sm-3">出版社:</dt>
                            <dd class="col-sm-9" id="com-B-publisher"></dd>
                            <dt class="col-sm-3">作者:</dt>
                            <dd class="col-sm-9" id="com-B-author"></dd>
                            <dt class="col-sm-3">ISBN:</dt>
                            <dd class="col-sm-9" id="com-B-ISBN"></dd>
                            <dt class="col-sm-3">价格:</dt>
                            <dd class="col-sm-9" id="com-B-price"></dd>
                            <dt class="col-sm-3">数量:</dt>
                            <dd class="col-sm-9" id="com-B-number"></dd>
                            <dt class="col-sm-3 text-truncate">简介:</dt>
                            <dd class="col-sm-9" id="com-B-introduction"></dd>
                        </dl>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-lg" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary btn-lg" onclick="$('#addbook').submit();">确认添加</button>
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
</style>
</html>
<script>
    function confirm() {
        let name=$("#name").val();
        let author=$("#author").val();
        let ISBN=$("#isbn").val();
        let publisher=$("#publish").val();
        let introduction=$("#introduction").val();
        let price=$("#price").val();
        let classId=$("#classId").val();
        let number=$("#number").val();
        if (name === '' || author === '' || publisher === '' || ISBN === '' || introduction === '' ||
            price === '' || classId === '' || number === '') {
            alert("请填入完整图书信息！");
            return false;
        }
        else {
            $('#com-B-name').text(name);
            $('#com-B-author').text(author);
            $('#com-B-publisher').text(publisher);
            $('#com-B-ISBN').text(ISBN);
            $('#com-B-price').text(price);
            $('#com-B-classId').text(classId);
            $('#com-B-number').text(number);
            $('#com-B-introduction').text(introduction);
            $('#myModal').modal("show");
        }
    }
</script>
