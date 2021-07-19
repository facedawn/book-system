package com.library.controller;

import com.library.bean.UserBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class PagesController {

    private boolean haslogin(HttpServletRequest request,boolean isAdmin)
    {
        HttpSession session = request.getSession();
        UserBean user = (UserBean) session.getAttribute("USER_SESSION");
        if(user!=null)
        {
            if(user.getIs_Admin()==isAdmin)
                return true;
            else
                return false;
        }
        else
        {
            return false;
        }
    }

    @RequestMapping(value = {"/", "/login.html","/index"})
    public String index(HttpServletRequest request)
    {
        request.getSession().invalidate();
        return "index";
    }

    @RequestMapping(value = "/link")
    public String link(HttpServletRequest request)
    {
        if(haslogin(request,true))
            return "link";
        else
            return "index";
    }
    @RequestMapping("/reader_main.html")
    public String toReaderMain(HttpServletRequest request)
    {
        if(haslogin(request,false))
            return "userMain";
        else
            return "index";
    }
    @RequestMapping("/admin_main.html")
    public String toAdminMain(HttpServletRequest request)
    {
        if(haslogin(request,true))
            return "adminMain";
        else
            return "index";
    }
    @RequestMapping("/userHeader")
    public String getUserHeader(HttpServletRequest request)
    {
        return "userHeader";
    }
    @RequestMapping("/adminHeader")
    public String getAdminHeader(HttpServletRequest request)
    {
        return "adminHeader";
    }
    @RequestMapping("/reader_books.html")
    public String toReaderBooks(HttpServletRequest request)
    {
        if(haslogin(request,false))
            return "readerBooks";
        else
            return "index";
    }
    @RequestMapping("/books_admin.html")
    public String toAdminBook(HttpServletRequest request)
    {
        if(haslogin(request,true))
            return "bookAdmin";
        else
            return "index";
    }
}
