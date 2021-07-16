<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的主页</title>
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

</body>
</html>