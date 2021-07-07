package library;
import java.sql.*;
public class link {
	public Statement l() {
		 try {  
	 Class.forName("com.mysql.jdbc.Driver");  //驱动程序名
     String url = "jdbc:mysql://localhost:3306/book_system?useSSL=true&characterEncoding=utf8"; //数据库名
     String sqlusername = "root";  //数据库用户名
     String sqlpassword = "123456";  //数据库用户密码
     Connection conn = DriverManager.getConnection(url, sqlusername, sqlpassword);  //连接状态
     Statement stmt = null;  
     if(conn != null){      
         ResultSet rs = null;  
         String sql = "select * from user";  //查询语句
         stmt = conn.createStatement(); 
 		return stmt;

     	}
     }
		 catch (Exception e) {        
	             
	       }
		 return null;
	}
}

