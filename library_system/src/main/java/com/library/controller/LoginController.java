package com.library.controller;

import com.library.bean.UserBean;
import com.library.service.LoginService;
import com.mysql.jdbc.log.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class LoginController {
    private LoginService loginService;

    @Autowired
    public void setLoginService(LoginService loginService){
        this.loginService=loginService;
    }


    @RequestMapping(value="/api/loginCheck",method= RequestMethod.POST)
    public @ResponseBody
    Object loginCheck(HttpServletRequest request, HttpSession session){
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        UserBean user=new UserBean();
        user.setUsername(username);
        user.setPassword(password);
        boolean isReader=loginService.hasMatchReader(username,password);
        boolean isAdmin=loginService.hasMatchAdmin(username,password);
        user.setIs_Admin(isAdmin);
        //System.out.print(isAdmin);
        HashMap<String,String>res=new HashMap<>();
        if(isAdmin)
        {
            res.put("stateCode","1");
            res.put("msg","管理员登录成功");
            session.setAttribute("USER_SESSION",user);
        }
        else if(isReader)
        {
            res.put("stateCode","2");
            res.put("msg","读者登录成功");
            session.setAttribute("USER_SESSION",user);
        }
        else
        {
            res.put("stateCode","0");
            res.put("msg","登录失败");
        }
        return res;
    }

}
