package com.library.controller;

import com.library.bean.*;
import com.library.service.BookService;
import com.library.service.LendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
public class LendController {

    private LendService lendService;
    private BookService bookService;
    @Autowired
    public void setLoginService(LendService lendService){
        this.lendService=lendService;
    }

    @Autowired
    public void setBookService(BookService bookService){
        this.bookService=bookService;
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

    @RequestMapping("admin_lend_list.html")
    public ModelAndView adminGetAllLendList(HttpServletRequest request)
    {
        if(Check(request,true))
        {
            ModelAndView modelAndView=new ModelAndView("index");
            return modelAndView;
        }
        ModelAndView modelAndView=new ModelAndView("admin_lend_list");
        List<Lend>res=lendService.getAllLendList();
        modelAndView.addObject("lendList",res);

        return modelAndView;
    }

    @RequestMapping(
            value = {"api/AddRecord"},
            method = {RequestMethod.POST}
    )
    @ResponseBody
    public Object adminAddLendList(HttpServletRequest request) {
        HashMap<String, String> result = new HashMap<>();
        String bookId = request.getParameter("bookId");
        String user_email = request.getParameter("readerId");
        Book b = this.bookService.getBookById(Integer.parseInt(bookId));
        if (b == null) {
            result.put("StatusCode", "0");
            result.put("Message", "图书不存在！");
            return result;
        } else if (!b.isIn_library()) {
            result.put("StatusCode", "01");
            result.put("Message", "图书已借出！");
            return result;
        } else if (this.lendService.userLendBook(user_email, bookId) == 1) {
            result.put("StatusCode", "1");
            result.put("Message", "新增借书记录成功！");
            return result;
        }
        result.put("StatusCode", "10");
        result.put("Message", "读者用户不存在！");
        return result;
    }

    @RequestMapping("reader_lend_list.html")
    public ModelAndView getReaderLendList(HttpServletRequest request)throws NullPointerException
    {
        if(Check(request,false))
        {
            ModelAndView modelAndView=new ModelAndView("index");
            return modelAndView;
        }
        HttpSession session= request.getSession();
        User user = (User) session.getAttribute("USER_SESSION");
        String user_email=user.getUser_email();
        List<Lend> lendList;
        lendList= lendService.userLendingLog(user_email);

        ModelAndView modelAndView=new ModelAndView("reader_lend_list");

        modelAndView.addObject("nowLendList",lendList);
        lendList= lendService.userLendHistory(user_email);
        modelAndView.addObject("oldLendList",lendList);
        return modelAndView;
    }

    @RequestMapping("reader_renew_do")
    public ModelAndView readerRenew(HttpServletRequest request)
    {
        if(Check(request,false))
        {
            ModelAndView modelAndView=new ModelAndView("index");
            return modelAndView;
        }
        ModelAndView modelAndView=new ModelAndView("reader_lend_list");
        String user_email=request.getParameter("user_email");
        String book_id=request.getParameter("book_id");
        //查续借数量
        if(lendService.findRestNum(user_email,book_id)<=0)
        {
            modelAndView.addObject("msg","续借次数不足");
            return modelAndView;
        }
        if(lendService.userRenew(book_id,user_email)==1)
        {
            modelAndView.addObject("msg","续借成功");
            return getReaderLendList(request);
        }
        else
        {
            modelAndView.addObject("msg","续借失败");
            return modelAndView;
        }

    }

    @RequestMapping("bookreturn.html")
    public ModelAndView bookReturn(HttpServletRequest request)
    {
        if(Check(request,true))
        {
            ModelAndView modelAndView=new ModelAndView("index");
            return modelAndView;
        }
        ModelAndView modelAndView=new ModelAndView("admin_lend_list");
        if(lendService.userReturnBook(request.getParameter("user_email"),request.getParameter("book_id"))==1)
        {
            modelAndView.addObject("msg","删除成功");
        }
        else
        {
            modelAndView.addObject("msg","删除失败");
        }
        return modelAndView;
    }

    @RequestMapping("recordDelete.html")
    public ModelAndView deleteRecord(HttpServletRequest request)
    {
        ModelAndView modelAndView=new ModelAndView("admin_lend_history");
        if(lendService.adminRecordDelete(request.getParameter("user_email"),request.getParameter("book_id"),request.getParameter("lend_time"))==1)
        {
            modelAndView.addObject("msg","删除成功");
        }
        else
        {
            modelAndView.addObject("msg","删除失败");
        }
        return modelAndView;
    }

    @RequestMapping("admin_bookings.html")
    public ModelAndView getAllBookings(HttpServletRequest request)
    {
        if(Check(request,true))
        {
            ModelAndView modelAndView=new ModelAndView("index");
            return modelAndView;
        }
        ModelAndView modelAndView=new ModelAndView("admin_bookings");
        List<Booking> res=lendService.getAllBookings();

        modelAndView.addObject("Bookings",res);
        return modelAndView;
    }




    @RequestMapping(
            value = {"api/BookingDealing"},
            method = {RequestMethod.POST}
    )
    @ResponseBody
    public Object dealingBooking(HttpServletRequest request){
        String bookID=request.getParameter("bookId");
        String userEmail=request.getParameter("email");
        HashMap<String, String> result = new HashMap<>();
        String decision=request.getParameter("decision");
        if (decision.equals("admit")){
            lendService.admitBooking(userEmail,bookID);
            result.put("StatusCode","1");
            result.put("Message","成功借出！");
        }
        if (decision.equals("refuse")){
            lendService.refuseBooking(userEmail,bookID);
            result.put("StatusCode","0");
            result.put("Message","拒绝借出！");
        }
        return result;
    }

    @RequestMapping("lend_history.html")
    public ModelAndView getLendHistory(HttpServletRequest request)
    {
        if(Check(request,true))
        {
            ModelAndView modelAndView=new ModelAndView("index");
            return modelAndView;
        }
        ModelAndView modelAndView=new ModelAndView("admin_lend_history");
        List<LendHistory> res=lendService.allLendHistory();

        modelAndView.addObject("records",res);
        return modelAndView;
    }


    //读者预约流程
    //1. 读者点击可预约书籍（在库书籍）,每个读者最多只能同时预约一本书
    //2。预约记录添加到管理员界面
    //3。管理员处理（拒绝或批准），若拒绝，则置状态为拒绝
    //4。若统一，则置记录状态为同意，并插入借阅到lend表中
    //5。status 1:代表待处理， 0：代表已接受 -1：代表已拒绝
    @RequestMapping(
            value = {"api/readerBooking"},
            method = {RequestMethod.POST}
    )
    @ResponseBody
    public Object readerBooking(HttpServletRequest request,HttpSession session){
        String bookISBN=request.getParameter("bookISBN");
        HashMap<String, String> result = new HashMap<>();
        Book book=bookService.getBookByISBN(bookISBN);
        if(book==null)
        {
            result.put("StatusCode","-1");
            result.put("Message","书已借完");
            return result;
        }
        int bookId=book.getBook_id();
        String userId=request.getParameter("userId");
        User user=(User) session.getAttribute("USER_SESSION");
        System.out.println("user.getRest_lend_num()");
        if (user.getRest_lend_num()<=0){
            result.put("StatusCode","-2");
            result.put("Message","已达到最大借阅数量！");
            return result;
        }
        if (lendService.userBookingTimes(userId)>0){
            result.put("StatusCode","-1");
            result.put("Message","读者一次只能预约一本书！");
            return result;
        }
        boolean bookingSuccess= lendService.userBooking(String.valueOf(bookId),userId);
        if (bookingSuccess){
            result.put("StatusCode","1");
            result.put("Message","预约成功！");
            session.setAttribute("BookingISBN",bookId);
            return result;
        }
        result.put("StatusCode","0");
        result.put("Message","预约失败！");
        return result;
    }
}
