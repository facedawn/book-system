package com.library.controller;

import com.library.bean.FineLog;
import com.library.bean.User;
import com.library.service.BookService;
import com.library.service.FineLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FineLogController {

    private FineLogService fineLogService;

    @Autowired
    public void setLoginService(FineLogService fineLogService){
        this.fineLogService=fineLogService;
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

    @RequestMapping("admin_fine.html")
    public ModelAndView getAllFineLog(HttpServletRequest request)
    {
        if(Check(request,true))
        {
            ModelAndView modelAndView=new ModelAndView("index");
            return modelAndView;
        }
        ModelAndView modelAndView=new ModelAndView("admin_fine");
        List<FineLog> list= fineLogService.getAllFineLog();
        modelAndView.addObject("list",list);
        return modelAndView;
    }

    @RequestMapping("query_all_fine_log.html")
    public ModelAndView getFineLogByTime(HttpServletRequest request){
        if(Check(request,true))
        {
            ModelAndView modelAndView=new ModelAndView("index");
            return modelAndView;
        }
        String st = request.getParameter("begin");
        String ed = request.getParameter("end");
        ModelAndView modelAndView = new ModelAndView("admin_fine");

        List<FineLog> list = fineLogService.getFineLogByTime(st, ed);
        modelAndView.addObject("list", list);
        return modelAndView;
    }

    @RequestMapping("query_payed_fine_log.html")
    public ModelAndView getPayedFineLogByTime(HttpServletRequest request){
        if(Check(request,true))
        {
            ModelAndView modelAndView=new ModelAndView("index");
            return modelAndView;
        }
        String st = request.getParameter("begin");
        String ed = request.getParameter("end");
        ModelAndView modelAndView = new ModelAndView("admin_fine");

        List<FineLog> list = fineLogService.getPayedFineLogByTime(st, ed);
        modelAndView.addObject("list", list);
        return modelAndView;
    }

    @RequestMapping("query_unpayed_fine_log.html")
    public ModelAndView getUnPayedFineLogByTime(HttpServletRequest request){
        if(Check(request,true))
        {
            ModelAndView modelAndView=new ModelAndView("index");
            return modelAndView;
        }
        String st = request.getParameter("begin");
        String ed = request.getParameter("end");
        ModelAndView modelAndView = new ModelAndView("admin_fine");

        List<FineLog> list = fineLogService.getUnPayedFineLogByTime(st, ed);
        modelAndView.addObject("list", list);
        return modelAndView;
    }

    @RequestMapping(value={"/api/userPayAFine"}, method= RequestMethod.POST)
    public @ResponseBody
    Object userPayAFine(HttpServletRequest request){
        if(Check(request,true))
        {
            ModelAndView modelAndView=new ModelAndView("index");
            return modelAndView;
        }
        HashMap<String, String> result= new HashMap<>();
        String user_email = request.getParameter("user_email");
        String b = request.getParameter("book_id");
        String dt = request.getParameter("lend_time");

        int book_id = Integer.valueOf(b);
        int res = fineLogService.payAFine(user_email, book_id, dt);
        if(res != 0){
            result.put("StatusCode", "1");
            result.put("msg","修改缴费信息成功！");
        }
        else{
            result.put("StatusCode", "0");
            result.put("msg","修改缴费失败，请重试！");
        }
        return result;
    }

}
