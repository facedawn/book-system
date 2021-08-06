package com.library.controller;

import com.library.bean.Book;
import com.library.bean.User;
import com.library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BookController {

    private BookService bookService;

    @Autowired
    public void setLoginService(BookService bookService){
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

    @RequestMapping(value="/api/querybook",method = RequestMethod.POST)
    public @ResponseBody
    Object queryBook(HttpServletRequest request){

        String bookname=request.getParameter("search");
        List<Book> books=new ArrayList<Book>();
        books=bookService.getBookByBookName(bookname);
        for(Book i:books)
        {
            System.out.println(i.getBook_name());
            i.setRes_num(bookService.getResBookNumByISBN(i.getISBN()));
        }
        return books;
    }

    @RequestMapping("/reader_querybook_do.html")
    public ModelAndView readerQueryBookDo(String searchWord) throws UnsupportedEncodingException {
        searchWord=new String(searchWord.getBytes("8859_1"), "utf8");
            List<Book> books = bookService.getAllBookInfoAndNumByVagueName(searchWord);

            ModelAndView modelAndView = new ModelAndView("reader_books");
            modelAndView.addObject("books", books);
            return modelAndView;
    }

    @RequestMapping("/admin_querybook_do.html")
    public ModelAndView adminQueryBookDo(String searchWord) throws UnsupportedEncodingException {
        searchWord=new String(searchWord.getBytes("8859_1"), "utf8");
        List<Book> books = bookService.getBookByBookName(searchWord);

        for(Book i:books)
        System.out.println(i.getBook_id());

        ModelAndView modelAndView = new ModelAndView("admin_books");
        modelAndView.addObject("books", books);
        return modelAndView;
    }



    @RequestMapping(value = {"reader_books.html"})
    public ModelAndView readerGetBookList(HttpServletRequest request)throws NullPointerException
    {if(Check(request,false))
    {
        ModelAndView modelAndView=new ModelAndView("index");
        return modelAndView;
    }

        ModelAndView modelAndView=new ModelAndView("reader_books");
        List<Book>books=bookService.getAllBookInfoAndNumByVagueName("");
        HttpSession session= request.getSession();
        User user = (User) session.getAttribute("USER_SESSION");

        String bookISBN=bookService.bookingBookID(user.getUser_email());
        System.out.println(bookISBN);
        modelAndView.addObject("books",books);
        modelAndView.addObject("bookingBookISBN",bookISBN);
        return modelAndView;
    }

    @RequestMapping(value = {"admin_books.html"})
    public ModelAndView adminGetLendBookList(HttpServletRequest request)
    {
        if(Check(request,true))
        {
            ModelAndView modelAndView=new ModelAndView("index");
            return modelAndView;
        }
        ModelAndView modelAndView=new ModelAndView("admin_books");
        List<Book>books=bookService.getBookByBookName("");
        modelAndView.addObject("books",books);
        return modelAndView;
    }

    @RequestMapping(value = {"reader_book_detail.html"})
    public ModelAndView readerGetBookDetail(HttpServletRequest request)
    {
        if(Check(request,false))
        {
            ModelAndView modelAndView=new ModelAndView("index");
            return modelAndView;
        }
        ModelAndView modelAndView=new ModelAndView("reader_book_detail");
        String ISBN=request.getParameter("ISBN");

        Book book=bookService.getBookByISBN(ISBN);
        book.setRes_num(bookService.getResBookNumByISBN(book.getISBN()));
        if (book==null)
        {
            return modelAndView;
        }

        //book.setRes_num(bookService.getResBookNumByISBN(book.getISBN()));


        modelAndView.addObject("detail",book);
        return modelAndView;
    }

    @RequestMapping(value = {"admin_book_detail.html"})
    public ModelAndView adminGetBookDetail(HttpServletRequest request)
    {
        if(Check(request,true))
        {
            ModelAndView modelAndView=new ModelAndView("index");
            return modelAndView;
        }
        String Id=request.getParameter("bookId");
        int bookId=Integer.parseInt(Id);
        Book book=bookService.getBookById(bookId);

        book.setRes_num(bookService.getResBookNumByISBN(book.getISBN()));

        ModelAndView modelAndView=new ModelAndView("admin_book_detail");
        modelAndView.addObject("detail",book);
        return modelAndView;
    }

    @RequestMapping(value = {"/book_add_do.html"} , method = RequestMethod.POST)
    public ModelAndView adminAddBook(HttpServletRequest request) throws UnsupportedEncodingException {
        if(Check(request,true))
        {
            ModelAndView modelAndView=new ModelAndView("index");
            return modelAndView;
        }
        ModelAndView modelAndView=new ModelAndView("admin_book_add");
        int bookNum=Integer.parseInt(request.getParameter("number"));
        String book_name=new String(request.getParameter("name").getBytes("8859_1"), "utf8");
        String book_auth=new String(request.getParameter("author").getBytes("8859_1"), "utf8");
        String book_intro=new String(request.getParameter("introduction").getBytes("8859_1"), "utf8");
        String book_pric=new String(request.getParameter("price").getBytes("8859_1"), "utf8");
        String book_pub=new String(request.getParameter("publish").getBytes("8859_1"), "utf8");
        String book_ISBN=new String(request.getParameter("isbn").getBytes("8859_1"), "utf8");
        Book book=new Book();
        book.setBook_name(book_name);
        book.setBook_auth(book_auth);
        book.setBook_intro(book_intro);
        book.setBook_pric(Double.valueOf(book_pric));
        book.setBook_pub(book_pub);
        book.setISBN(book_ISBN);

        int cnt=0;
        for(int i=0;i<bookNum;i++)
        {
            cnt+=bookService.addNewBook(book);
        }
        if(cnt==bookNum)
        {
            modelAndView.addObject("msg","插入成功");
        }
        else
        {
            modelAndView.addObject("msg","成功插入"+cnt+"本书，有"+(bookNum-cnt)+"本书插入失败。");
        }
        return modelAndView;
    }

    @RequestMapping("updatebook.html")
    public ModelAndView updateBookDetil(HttpServletRequest request)
    {
        if(Check(request,true))
        {
            ModelAndView modelAndView=new ModelAndView("index");
            return modelAndView;
        }
        String bookId=request.getParameter("bookId");
        Book book=bookService.getBookById(Integer.parseInt(bookId));
        ModelAndView modelAndView=new ModelAndView("admin_book_edit");
        modelAndView.addObject("detail",book);
        return modelAndView;
    }

    @RequestMapping("deletebook.html")
    public ModelAndView adminDeleteBook(HttpServletRequest request)
    {
        if(Check(request,true))
        {
            ModelAndView modelAndView=new ModelAndView("index");
            return modelAndView;
        }
        String bookId=request.getParameter("bookId");
        int res=bookService.deleteBook(Integer.parseInt(bookId));
        ModelAndView modelAndView=new ModelAndView("admin_books");
        List<Book>books=bookService.getBookByBookName("");
        if (res==0){
            modelAndView.addObject("StatusCode","0");
        }
        else {
            modelAndView.addObject("StatusCode","1");
        }
        modelAndView.addObject("books",books);
        return modelAndView;

    }

    @RequestMapping("book_edit_do.html")
    public ModelAndView submitBookEdit(HttpServletRequest request) throws UnsupportedEncodingException {
        if(Check(request,true))
        {
            ModelAndView modelAndView=new ModelAndView("index");
            return modelAndView;
        }
        ModelAndView modelAndView=new ModelAndView("admin_books");
        String book_name=new String(request.getParameter("name").getBytes("8859_1"), "utf8");
        String book_auth=new String(request.getParameter("author").getBytes("8859_1"), "utf8");
        String book_intro=new String(request.getParameter("introduction").getBytes("8859_1"), "utf8");
        String book_pric=new String(request.getParameter("price").getBytes("8859_1"), "utf8");
        String book_pub=new String(request.getParameter("publish").getBytes("8859_1"), "utf8");
        String book_ISBN=new String(request.getParameter("isbn").getBytes("8859_1"), "utf8");
        int book_id=Integer.parseInt(request.getParameter("ID"));

        if(bookService.updateBook(book_id,book_name,book_auth,book_pub,book_ISBN,book_intro,book_pric)==1)
        {
            modelAndView.addObject("msg","编辑成功");
        }
        else {
            modelAndView.addObject("msg", "编辑失败");
        }

        List<Book>books=bookService.getBookByBookName("");
        modelAndView.addObject("books",books);
        return modelAndView;
    }

    @RequestMapping("reader_querybookByAuth_do.html")
    public ModelAndView readerQueryBookByAuth(String searchWord) throws UnsupportedEncodingException {

        System.out.println(searchWord);
        searchWord=new String(searchWord.getBytes("8859_1"), "utf8");
        List<Book> books = bookService.getBookByBookAuth(searchWord);

        ModelAndView modelAndView = new ModelAndView("reader_books");
        modelAndView.addObject("books", books);
        return modelAndView;
    }

    @RequestMapping("reader_querybookByPub_do.html")
    public ModelAndView readerQueryBookByPub(String searchWord) throws UnsupportedEncodingException {

        searchWord=new String(searchWord.getBytes("8859_1"), "utf8");
        List<Book> books = bookService.getBookByBookPub(searchWord);

        ModelAndView modelAndView = new ModelAndView("reader_books");
        modelAndView.addObject("books", books);
        return modelAndView;
    }

    @RequestMapping("reader_querybookByISBN_do.html")
    public ModelAndView readerQueryBookByISBN(String searchWord) throws UnsupportedEncodingException {

        searchWord=new String(searchWord.getBytes("8859_1"), "utf8");
        List<Book> books = bookService.getBookByVISBN(searchWord);

        ModelAndView modelAndView = new ModelAndView("reader_books");
        modelAndView.addObject("books", books);
        return modelAndView;
    }
}