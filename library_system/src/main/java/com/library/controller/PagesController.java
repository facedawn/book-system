package com.library.controller;

import com.library.bean.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class PagesController {

    private boolean haslogin(HttpServletRequest request, boolean isAdmin) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("USER_SESSION");
        if (user != null) {
            if (user.getIs_admin() == isAdmin)
                return true;
            else
                return false;
        } else {
            return false;
        }
    }

    @RequestMapping(value = {"/", "/login.html", "/index"})
    public String index(HttpServletRequest request) {
        request.getSession().invalidate();
        return "index";
    }

    @RequestMapping(value = "/link")
    public String link(HttpServletRequest request) {
        return "link";
    }

    @RequestMapping("/reader_main.html")
    public String toReaderMain(HttpServletRequest request) {
        if (haslogin(request, false))
            return "reader_main";
        else
            return "index";
    }

    @RequestMapping("/admin_main.html")
    public String toAdminMain(HttpServletRequest request) {
        if (haslogin(request, true))
            return "admin_main";
        else
            return "index";
    }

    @RequestMapping("/reader_header.html")
    public String getUserHeader(HttpServletRequest request) {
        return "reader_header";
    }

    @RequestMapping("/admin_header.html")
    public String getAdminHeader(HttpServletRequest request) {
        return "admin_header";
    }

    @RequestMapping("/books_admin.html")
    public String toAdminBook(HttpServletRequest request) {
        if (haslogin(request, true))
            return "books_admin";
        else
            return "index";
    }

    @RequestMapping("/admin_book_add.html")
    public String toAdminBookAdd(HttpServletRequest request) {
        if (haslogin(request, true))
            return "admin_book_add";
        else
            return "index";
    }


    @RequestMapping("/admin_book_edit.html")
    public String toAdminBookEdit(HttpServletRequest request) {
        if (haslogin(request, true))
            return "admin_book_edit";
        else
            return "index";
    }


    @RequestMapping("/admin_reader_edit.html")
    public String toAdminReaderEdit(HttpServletRequest request) {
        if (haslogin(request, true))
            return "admin_reader_edit";
        else
            return "index";
    }

    @RequestMapping("/admin_repasswd.html")
    public String toAdminRepasswd(HttpServletRequest request) {
        if (haslogin(request, true))
            return "admin_repasswd";
        else
            return "index";
    }



    @RequestMapping("/reader_repasswd.html")
    public String toReaderRepasswd(HttpServletRequest request) {
        if (haslogin(request, false))
            return "reader_repasswd";
        else
            return "index";
    }

    @RequestMapping("/logout.html")
    public String Logout(HttpServletRequest request) {
        return "index";
    }

    @RequestMapping("admin_reader_add.html")
    public String ToAdminReaderAdd(HttpServletRequest request)
    {
        if (haslogin(request, true))
            return "admin_reader_add";
        else
            return "index";
    }
}
