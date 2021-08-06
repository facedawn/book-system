package com.library.controller;

import com.library.bean.User;
import com.library.service.LoginService;

import com.library.service.UserService;
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
    private UserService userService;

    @Autowired
    public void setUserService(UserService userService){
        this.userService=userService;
    }
    @Autowired
    public void setLoginService(LoginService loginService){
        this.loginService=loginService;
    }

    @RequestMapping(value="/api/register",method = RequestMethod.POST)
    public @ResponseBody
    Object register(HttpServletRequest request){
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String email=request.getParameter("email");
        boolean success=loginService.registerSuccess(email,username,password);
        HashMap<String,String>res=new HashMap<>();
        if(success){
            res.put("stateCode","1");
            res.put("msg","register success");
        }
        else{
            res.put("stateCode","0");
            res.put("msg","register fail");
        }
        return res;
    }

    @RequestMapping(value="/api/loginCheck",method= RequestMethod.POST)
    public @ResponseBody
    Object loginCheck(HttpServletRequest request, HttpSession session){
        HashMap<String,String>res=new HashMap<>();
        String user_email=request.getParameter("username");
        String password=request.getParameter("password");
        User user=userService.getInfo(user_email);
        if(user==null){
            res.put("stateCode","0");
            res.put("msg","账号/密码错误!");
            return res;
        }
        boolean isReader;
        boolean isAdmin;
        isAdmin=loginService.hasMatchAdmin(user.getUser_name(),password);
        isReader=loginService.hasMatchReader(user.getUser_name(),password);
        user.setIs_admin(isAdmin);
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
