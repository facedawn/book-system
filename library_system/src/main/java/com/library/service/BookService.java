package com.library.service;

import com.library.bean.Book;
import com.library.dao.BookDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BookService {
    @Autowired
    private BookDao bookdao;
    public List<Book> getBookByBookName(String book_name)
    {
        book_name="%"+book_name+"%";
        return bookdao.getBookByBookName(book_name);
    }

    public List<Book> getBookByBookAuth(String book_auth)
    {
        book_auth="%"+book_auth+"%";
        return bookdao.getBookByBookAuth(book_auth);
    }

    public List<Book> getBookByVISBN(String ISBN)
    {
        ISBN="%"+ISBN+"%";
        return bookdao.getBookByISBN(ISBN);
    }

    public List<Book> getBookByBookPub(String book_pub)
    {
        book_pub="%"+book_pub+"%";
        return bookdao.getBookByBookPub(book_pub);
    }


    public List<String> getAllISBN()
    {
        return bookdao.getAllISBN();
    }

    public int getResBookNumByISBN(String ISBN)
    {
        return bookdao.getResBookNumByISBN(ISBN);
    }

    public Book getBookById(int bookId)
    {
        return bookdao.getBookById(bookId);
    }

    public Book getBookByISBN(String ISBN)
    {
        return bookdao.getBookInfoByISBN(ISBN);
    }

    public List<Book>getAllBookInfoAndNumByVagueName(String bookName)
    {
        bookName="%"+bookName+"%";
        List<Book>books=bookdao.getAllBookInfoAndNumByVagueName(bookName);
        for(Book i:books)
        {
            i.setRes_num(bookdao.getResBookNumWithSameISBN(i.getISBN()));
        }
        return books;
    }

    public int addNewBook(Book book)
    {
        return bookdao.addNewBook(book);
    }

    public int deleteBook(int bookId){
        return bookdao.deleteBook(bookId);
    }

    public int updateBook(int book_id,String book_name,String book_auth,String book_pub,String book_ISBN,String book_intro,String book_pric)
    {
        Book book=new Book();
        book.setBook_id(book_id);
        book.setBook_name(book_name);
        book.setBook_auth(book_auth);
        book.setBook_pub(book_pub);
        book.setISBN(book_ISBN);
        book.setBook_intro(book_intro);
        book.setBook_pric(Double.valueOf(book_pric));
        return bookdao.updateBook(book);
    }
    public String bookingBookID(String user_email){
        return bookdao.bookingBookID(user_email);
    }
}

