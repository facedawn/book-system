package com.library.controller;

import com.library.service.LoginService;
import com.mysql.jdbc.log.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

@Controller
public class LoginController {
    private LoginService loginService;

    @Autowired
    public void setLoginService(LoginService loginService){
        this.loginService=loginService;
    }

    @RequestMapping(value = {"/", "/login.html","/index"})
    public String index(HttpServletRequest request)
    {
        request.getSession().invalidate();
        return "index";
    }

    @RequestMapping(value="api/loginCheck",method= RequestMethod.POST)
    public @ResponseBody
    Object loginCheck(HttpServletRequest request){
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        boolean isReader=loginService.hasMatchReader(username,password);
        HashMap<String,String>res=new HashMap<>();
        if(isReader)
        {
            res.put("stateCode","1");
            res.put("msg","读者登录成功");
        }
        else
        {
            res.put("stateCode","1");
            res.put("msg","登录失败");
        }
        return res;
    }

}
