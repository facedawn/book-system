package library;
import java.sql.*;
import library.link;
import org.springframework.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
public class login {
	@RequestMapping(value="login",method=RequestMethod.POST)
	public @ResponseBody
	Object loginCheck(HttpServletRequest request)
	{
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		String sql="select * from user where user_name='"+username+"' and user_password='"+password+"'";
		try {
		link t=new link();
		Statement stmt=t.l();
		ResultSet rs=null;
		rs=stmt.executeQuery(sql);
		while(rs.next())
		{
			
		}}
		catch(Exception e)
		{
			
		}
		Object res = null;
		return res;
	}
}
