<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="css/reader_books.css">
<%@ page import="java.sql.*"%>
<%@ page import="library.*" %>
<html>
<head>
    <title>图书查询</title>
    <script src="js/jquery-3.2.1.js"></script>
    <script>
        $(function () {
            $('#header').load('userHeader');
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
        </div>
        <div class="mid" id="searchRes">

        </div>
    </div>

</body>

<script>

</script>

</html>