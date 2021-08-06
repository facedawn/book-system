package com.library.dao;

import com.library.bean.Book;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.print.attribute.standard.MediaSize;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BookDao {

    private final static String NAMESPACE = "com.library.dao.BookDao.";

    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public ArrayList<Book> getAllBooks(){
        List<Book> b = sqlSessionTemplate.selectList(NAMESPACE + "getAllBooks");
        return (ArrayList<Book>) b;
    }

    public List<Book> getBookByISBN(String ISBN)
    {
        List<Book>res=sqlSessionTemplate.selectList(NAMESPACE+"getAllBookInfoAndNumByVagueISBN",ISBN);
        return res;
    }

    public List<Book> getBookByBookPub(String book_pub)
    {
        List<Book>res=sqlSessionTemplate.selectList(NAMESPACE+"getAllBookInfoAndNumByVaguePub",book_pub);
        return res;
    }

    public List<Book> getBookByBookAuth(String book_auth)
    {
        List<Book>res=sqlSessionTemplate.selectList(NAMESPACE+"getAllBookInfoAndNumByVagueAuth",book_auth);
        return res;
    }

    public List<Book> getBookByBookName(String book_name)
    {
        List<Book>res=sqlSessionTemplate.selectList(NAMESPACE+"getBookByVagueName",book_name);
        return res;
    }

    public List<String> getAllISBN()
    {
        List<String>res=sqlSessionTemplate.selectList(NAMESPACE+"getAllISBN");
        return res;
    }

    public int getResBookNumByISBN(String ISBN)
    {
        List<Integer>res=sqlSessionTemplate.selectList(NAMESPACE+"getResBookNumWithSameISBN",ISBN);

        if(res.size()==0)
            return 0;
        int cnt=res.get(0);
        return cnt;
    }

    public Book getBookById(int bookId)
    {
        try{
            List<Book>res=sqlSessionTemplate.selectList(NAMESPACE+"getBookByBookId",bookId);
            return res.get(0);
        }catch (Exception e){
            return null;
        }
    }

    public List<Book>getAllBookInfoAndNumByVagueName(String bookName)
    {
        List<Book>res=sqlSessionTemplate.selectList(NAMESPACE+"getAllBookInfoAndNumByVagueName",bookName);
        return res;
    }

    public Book getBookInfoByISBN(String ISBN)
    {
        List<Book>res=sqlSessionTemplate.selectList(NAMESPACE+"getBookByISBN",ISBN);
        if(res.isEmpty())
            return null;
        else
            return res.get(0);
    }

    public int addNewBook(Book book)
    {
        return sqlSessionTemplate.insert(NAMESPACE+"addNewBook",book);
    }

    public int deleteBook(int bookId){
        try{
            return sqlSessionTemplate.delete(NAMESPACE+"adminDeleteBook",bookId);
        }catch (Exception e){
            return 0;
        }
    }

    public int updateBook(Book book)
    {
        return sqlSessionTemplate.update(NAMESPACE+"changeBookSettings",book);
    }

    public int getResBookNumWithSameISBN(String ISBN)
    {
        try{
            return sqlSessionTemplate.selectOne(NAMESPACE+"getResBookNumWithSameISBN",ISBN);
        }
        catch (Exception e)
        {
            return 0;
        }
    }

    public String bookingBookID(String user_email){
        return sqlSessionTemplate.selectOne(NAMESPACE+"bookingBookID",user_email);
    }
}