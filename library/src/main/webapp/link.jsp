<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<title>通过JSP打开数据表</title>
</head>
<body>

 <%  
        try {  
            Class.forName("com.mysql.jdbc.Driver");  //驱动程序名
            String url = "jdbc:mysql://localhost:3306/book_system?useSSL=true&characterEncoding=utf8"; //数据库名
            String username = "root";  //数据库用户名
            String password = "123456";  //数据库用户密码
            Connection conn = DriverManager.getConnection(url, username, password);  //连接状态

            if(conn != null){  
                out.print("数据库连接成功！");  
                out.print("<br />");            
                Statement stmt = null;  
                ResultSet rs = null;  
                String sql = "select * from user";  //查询语句
                stmt = conn.createStatement();  
                rs = stmt.executeQuery(sql);  
                out.print("查询结果：");  
                out.print("<br />");  
                out.println("user_id"+"  user_name "+"  "+"user_password");  
                out.print("<br />");  
                while (rs.next()) {  
                 out.println(rs.getInt("user_id")+"  &nbsp "+rs.getString("user_name")+"  &nbsp "+rs.getString("user_password")); //将查询结果输出  
                 out.print("<br />");  
                }  
            }
            else{  
                out.print("连接失败！");  
            }  
        }catch (Exception e) {        
            out.print("数据库连接异常！");  
        }  
%>   
</body>
</html>