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
            $('#header').load('header.jsp');
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
            <form method="get" action="reader_books.jsp">
            <input class="inline" name="book_name" type="text" size="20">
            <input type="submit" size="5">
            </form>
        </div>
        <div class="mid" id="searchRes">
            <%
            	//查数据库把书列出来
            	//要分页
            	try{
            	String book_name=request.getParameter("book_name");
            	link test=new link();
            	Statement stmt=test.l();
            	ResultSet rs=null;
            	String sql;
            	sql="select * from book where book_name like '%"+book_name+"%';";
            	//sql="select * from book where book_name like '%数学%';";
            	out.println(sql);
            	rs=stmt.executeQuery(sql);
            	out.println("<table>");
            	while(rs.next())
            	{
            		out.println("<tr>");
            		out.println("<td>"+rs.getString("book_name")+"</td>");
            		out.println("<td>"+rs.getString("book_auth")+"</td>");
            		out.println("<td>"+rs.getString("book_pub")+"</td>");
            		out.println("<td>"+rs.getString("ISBN")+"</td>");
            		out.println("<td>"+rs.getDouble("book_pric")+"</td>");
            		out.println("<td>"+rs.getString("book_intro")+"</td>");
            		out.println("</tr>");
            	}
            	out.println("</table>");
            	}
            	catch(Exception e){
            		out.println("异常");
            	}
            	
            %>
        </div>
    </div>

</body>
</html>