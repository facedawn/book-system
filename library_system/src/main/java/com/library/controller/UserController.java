package com.library.controller;

import com.library.bean.User;
import com.library.service.LoginService;
import com.library.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;


@Controller
public class UserController {
    private UserService userService;

    @Autowired
    public void setUserService(UserService userService){
        this.userService=userService;
    }

    private boolean Check(HttpServletRequest request,boolean is_admin)
    {
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("USER_SESSION");
        if(user==null||!(user.getIs_admin()==is_admin))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    @RequestMapping("admin_readers.html")
    public ModelAndView getAllReader()
    {
        ModelAndView modelAndView=new ModelAndView("admin_readers");
        List<User> res=userService.getAllReader();

        modelAndView.addObject("readers",res);
        return modelAndView;
    }

    @RequestMapping("queryReader.html")
    public ModelAndView queryReader(HttpServletRequest request)
    {
        ModelAndView modelAndView=new ModelAndView("admin_readers");
        String searchWord=request.getParameter("search");

        List<User>res= userService.getVagueReaderByEmail(searchWord);
        modelAndView.addObject("readers",res);
        return modelAndView;
    }


    @RequestMapping(value={"/api/AddReader"}, method= RequestMethod.POST)
    public @ResponseBody
    Object adminAddReader(HttpServletRequest request)
    {
        HashMap<String,String > result= new HashMap<>();
        User user=new User();
        user.setUser_name(request.getParameter("name"));
        user.setUser_email(request.getParameter("mail"));
        user.setUser_password(request.getParameter("password"));
        if(!user.getUser_email().equals(""))
        {
            if(userService.adminAddReader(user)!=0)
            {
                result.put("StatusCode","1");
                result.put("msg","新读者注册成功！");
                return result;
            }
        }
        result.put("StatusCode","0");
        result.put("msg","新读者邮箱已注册，请重试！");
        return result;
    }

    @RequestMapping("reader_delete.html")
    public ModelAndView adminDeleteReader(HttpServletRequest request)
    {
        ModelAndView modelAndView=new ModelAndView("admin_readers");
        String user_email=request.getParameter("readerId");
        if(userService.DeleteReaders(user_email)==0){
            modelAndView.addObject("StatusCode","0");
        }else {
            modelAndView.addObject("StatusCode","1");
        }
        List<User> user=userService.getAllReader();
        modelAndView.addObject("readers",user);
        return modelAndView;
    }

    @RequestMapping("admin_lend_list_add.html")
    public ModelAndView adminAddLendList(HttpServletRequest request)
    {
        ModelAndView modelAndView=new ModelAndView("admin_lend_list_add");
        return modelAndView;
    }


    @RequestMapping("reader_edit.html")
    public ModelAndView adminEditReader(HttpServletRequest request)
    {
        ModelAndView modelAndView=new ModelAndView("admin_reader_edit");
        String user_email=request.getParameter("readerId");
        User user=userService.adminGetReader(user_email);
        modelAndView.addObject("readerInfo",user);
        return modelAndView;
    }

    @RequestMapping("reader_edit_do.html")
    public ModelAndView submitEdit(HttpServletRequest request)
    {
        ModelAndView modelAndView=new ModelAndView("admin_readers");
        String user_email=request.getParameter("email");
        String user_name=request.getParameter("name");
        userService.userUpdate(user_email,user_name);

        List<User> user=userService.getAllReader();
        modelAndView.addObject("readers",user);
        return modelAndView;
    }

    @RequestMapping("reader_repasswd_do")
    public ModelAndView readerRepasswordDo(HttpServletRequest request)
    {
        User user=(User)request.getSession().getAttribute("USER_SESSION");
        String user_email=user.getUser_email();
        String old_password=request.getParameter("oldPasswd");
        String new_password=request.getParameter("newPasswd");
        try{
            if(userService.repassword(old_password,new_password,user_email)==1) {
                ModelAndView modelAndView=new ModelAndView("index");
                modelAndView.addObject("StatusCodde","1");
                return modelAndView;
            }
            else{
                ModelAndView modelAndView=new ModelAndView("reader_repasswd");
                modelAndView.addObject("StatusCodde","0");
                modelAndView.addObject("msg","修改失败");
                return modelAndView;
            }
        }
        catch(Exception e)
        {
            ModelAndView modelAndView=new ModelAndView("reader_repasswd");
            modelAndView.addObject("msg","修改失败");
            return modelAndView;
        }
    }

    @RequestMapping("admin_repasswd_do")
    public ModelAndView adminRepasswordDo(HttpServletRequest request)
    {
        User user=(User)request.getSession().getAttribute("USER_SESSION");
        String user_email=user.getUser_email();
        String old_password=request.getParameter("oldPasswd");
        String new_password=request.getParameter("newPasswd");
        try{
            if(userService.repassword(old_password,new_password,user_email)==1) {
                ModelAndView modelAndView=new ModelAndView("index");
                modelAndView.addObject("SatusCode","1");
                return modelAndView;
            }
            else{
                ModelAndView modelAndView=new ModelAndView("admin_repasswd");
                modelAndView.addObject("StatusCode","0");
                modelAndView.addObject("msg","修改失败");
                return modelAndView;
            }
        }
        catch(Exception e)
        {
            ModelAndView modelAndView=new ModelAndView("admin_repasswd");
            modelAndView.addObject("msg","修改失败");
            return modelAndView;
        }
    }

    @RequestMapping("reader_info.html")
    public ModelAndView getReaderInfo(HttpServletRequest request)
    {
        ModelAndView modelAndView=new ModelAndView("reader_info");
        User user=(User)request.getSession().getAttribute("USER_SESSION");
        modelAndView.addObject("readerinfo",user);
        return modelAndView;
    }

    @RequestMapping("reader_info_edit.html")
    public ModelAndView resetReaderInfo(HttpServletRequest request)
    {
        ModelAndView modelAndView=new ModelAndView("reader_info_edit");
        User user=(User)request.getSession().getAttribute("USER_SESSION");
        modelAndView.addObject("readerinfo",user);
        return modelAndView;
    }

    @RequestMapping("reader_edit_do_r.html")
    public ModelAndView readerUpdateInfo(HttpServletRequest request,HttpSession session)
    {
        ModelAndView modelAndView=new ModelAndView("reader_info_edit");
        String user_email=request.getParameter("email");
        String user_name=request.getParameter("name");
        User user=(User)session.getAttribute("USER_SESSION");
        if(userService.readerUpdateInfo(user_email,user_name)==1){
            user=userService.getInfo(user.getUser_email());
            session.setAttribute("USER_SESSION",user);
            modelAndView.addObject("readerinfo",user);
            modelAndView.addObject("msg","修改成功");
        }
        else
        {
            modelAndView.addObject("readerinfo",user);
            modelAndView.addObject("msg","修改失败");
        }
        return modelAndView;
    }
}
