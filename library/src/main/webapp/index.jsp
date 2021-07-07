<%@ page contentType="text/html;charset=UTF-8"  language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*"%>
<html>

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/login.js"></script>
    <title>登陆界面</title>
    
</head>


<body>
<%
    String mode=request.getParameter("mode");
	String username=request.getParameter("username");
	String password=request.getParameter("password");
    out.println("<p>username:</p>"+username);  
	out.println("<p>password:</p>"+password);  
	out.println("<p>mode:</p>"+mode);  
	

 try {  
            Class.forName("com.mysql.jdbc.Driver");  //驱动程序名
            String url = "jdbc:mysql://localhost:3306/book_system"; //数据库名
            String sqlusername = "root";  //数据库用户名
            String sqlpassword = "123456";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, sqlusername, sqlpassword);  //连接状态
            
            if(conn != null){  
                out.print("数据库连接成功！");  
                out.print("<br />");            
                Statement stmt = null;  
                ResultSet rs = null;  
                String sql = "select * from user";  //查询语句
				stmt = conn.createStatement(); 
                if(mode.equals( "login"))
	            {
		            //在数据库找匹配，返回匹配结果

                    sql="select * from user where user.user_name='"+username+"' and user_password='"+password+"'";
                     
                    rs = stmt.executeQuery(sql); 
					int cnt=0;
                    while (rs.next())
                    {
                        out.println("Welcome, "+rs.getString("user_name"));
						cnt++;
						%>
						<script>top.location="userMain.jsp";</script>
						<%
                    }
					if(cnt==0)
					{
						out.println("<p>failed</p>");
					}
	            }
                else
                {
                    //update数据库，有同名则返回失败 
					sql = "insert user(user_name,user_password) value ('"+username+"','"+password+"');";
					out.println("<p>"+sql+"</p>");
                    int res=stmt.executeUpdate(sql);
                    if(res!=0)
                    {
                        out.println("<p>success</p>");
                    }
					else
					{
						out.println("<p>The user name has been occupied</p>");
					}
                }
               
            }
            else{  
                out.print("连接失败！");  
            }  
        }catch (Exception e) {        
            out.print("数据库连接异常！");  
        }

%>
    <div class="pic middiv" style="height: 10%;">
        <p style="font-size:larger;">图书管理系统登录</p>
        <a href="./link.jsp">查看数据库</a>
    </div>
    <div class="outborder">
        <div class="text middiv">
            <p id="main-tips">提示信息<br><br><br><br><br><br><br><br><br><br><br><br><br>提示信息</p>
        </div>
        <div class="login middiv">
            <!--<img src="src\black.png" style="width: 100%; height: 30%; object-fit: cover;">-->
            <div id="top-tips">请登录</div><br>
            <div style="margin: 10%;">
                <label>username:</label>
                <form method="post" action="index.jsp">
                <input type="text" name="username" id="username" size="30" onkeydown="return disableTextSubmit(event)">
                <input id="hiddenText" name="mode" value="login" type="text" style="display:none" />
                <br>
                <label>password:</label>
                <input type="password" name="password" id="password" size="30" onkeydown="return disableTextSubmit(event)">
                <br><br>
                <input id="register" class="button" type="button" value="去注册" onclick='return to_register();';>
                <input id="in" class="button" type="submit" value="登录">
                <input id="submitregister" class="button" type="submit" value="注册" onclick='return submit_register();'
                    style="display: none;margin:0 auto">
                </form>
                <br>
                <p id="notice"></p>
            </div>
            </div>
        </div>
</body>

</html>