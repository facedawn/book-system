<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑《 ${detail.book_name}》</title>
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
    <div class="panel panel-primary" style="margin-bottom:10%">
        <div class="panel-heading" style="background-color:grey;color:black">
            <h3 class="panel-title">编辑《 ${detail.book_name}》</h3>
        </div>
        <div class="panel-body">
            <form action="book_edit_do.html?bookId=${detail.book_id}" method="post" id="addbook" >
                 <div class="input-group" style="margin-top:20px">
                     <span  class="input-group-addon" style="width:10%">ID</span>
                     <input type="text" class="form-control" name="ID" id="ID" value="${detail.book_id}" readonly>
                 </div>
                <div class="input-group" style="margin-top:20px">
                    <span  class="input-group-addon" style="width:10%">书名</span>
                    <input type="text" class="form-control" name="name" id="name" value="${detail.book_name}">
                </div>
                <div class="input-group" style="margin-top:20px">
                    <span class="input-group-addon" style="width:10%">作者</span>
                    <input type="text" class="form-control" name="author" id="author" value="${detail.book_auth}" >
                </div>
                <div class="input-group" style="margin-top:20px">
                    <span  class="input-group-addon" style="width:10%">出版社</span>
                    <input type="text" class="form-control" name="publish" id="publish"  value="${detail.book_pub}" >
                </div>
                <div class="input-group" style="margin-top:20px">
                    <span class="input-group-addon" style="width:10%">ISBN</span>
                    <input type="text" class="form-control" name="isbn" id="isbn"  value="${detail.ISBN}" >
                </div>
                <div class="input-group" style="margin-top:20px">
                    <span  class="input-group-addon" style="width:10%">简介</span>
                    <input type="text" class="form-control" name="introduction" id="introduction"  value="${detail.book_intro}" >
                </div>

                <div class="input-group" style="margin-top:20px">
                    <span  class="input-group-addon" style="width:10%;">价格</span>
                    <input type="text" class="form-control" name="price"  id="price" value="${detail.book_pric}">
                </div>
                <input type="submit" value="确定" class="btn btn-success btn-lg" style="margin-top:20px;width: 20%;height:5%;margin-left:40%">
                <script>
                    $("#addbook").submit(function () {
                        if($("#name").val()==''||$("#author").val()==''||$("#publish").val()==''||$("#isbn").val()==''||$("#introduction").val()==''||$("#language").val()==''||$("#price").val()==''||$("#pubstr").val()==''||$("#classId").val()==''||$("#number").val()==''){
                            alert("请填入完整图书信息！");
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
