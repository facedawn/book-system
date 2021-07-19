<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍管理</title>
    <link rel="stylesheet" type="text/css" href="css/reader_books.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script>
        $(function () {
            $('#header').load('adminHeader');
        })
    </script>
</head>
<body background="img/background.jpg" style=" background-repeat:no-repeat ;
background-size:100% 100%;
background-attachment: fixed;">
<div id="header"></div>
<div class="mid" id="context">
        <div class="mid" id="searchBox">
            <p class="inline" >书名:    </p>

            <input class="inline" name="book_name" type="text" size="20">
            <input id="submit" type="submit" size="5">
            <input id="add" type="button" value="新增图书" style="float:right;color:red"></input>
        </div>
        <div class="mid" id="searchRes">

        </div>
    </div>

</body>