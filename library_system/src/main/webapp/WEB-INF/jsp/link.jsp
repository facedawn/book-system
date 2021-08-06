<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<title>通过JSP打开数据表</title>
<script src="js/jquery-3.2.1.js"></script>
</head>
<body>


    <script type="text/javascript">
        function upload(){
            $.ajax({
                type: "POST",
                url: "api/querybook.html",
                data: {search:"积分"},
                dataType:"json",
                success: function(data){
                var dataObj = data, //返回的result为json格式的数据
                con = "";

                $.each(dataObj, function(index, item){
                     con += "<li>书名："+item.book_name+"</li>";
                     con += "<li>作者："+item.book_auth+"</li>";
                     con += "<li>出版社："+item.book_pub+"</li>";
                     con += "<li>ISBN："+item.isbn+"</li>";
                     con += "<li>价格： "+item.book_pric+"</li>";
                     con += "<li>剩余数量： "+item.resnum+"</li>";
                     con += "<li>简介： "+item.book_intro+"</li>";
                });
                console.log(con);    //可以在控制台打印一下看看，这是拼起来的标签和数据
                 $("#con").html(con); //把内容入到这个div中即完成
                }
            })
        }
        </script>
        <input type="button" onclick="upload();"></input>
        <br>
        <div id="con"></div>
</body>
</html>