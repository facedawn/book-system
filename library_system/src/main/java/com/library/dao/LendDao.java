package com.library.dao;

import com.library.bean.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.*;

@Repository
public class LendDao {
    private final static String NAMESPACE = "com.library.dao.LendDao.";

    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    public List<Lend>getAllLendList()
    {
        return sqlSessionTemplate.selectList(NAMESPACE+"adminGetAllLendingLog");
    }

    public int userLendBook(String user_email,String bookId)
    {
        HashMap<String,String> temp=new HashMap<>();
        temp.put("user_email",user_email);
        temp.put("book_id",bookId);
        try{
        return sqlSessionTemplate.insert(NAMESPACE+"userLendBook",temp);}
        catch (Exception e)
        {
            return 0;
        }
    }

    public List<Lend> userLendingLog(String user_email)
    {
        return sqlSessionTemplate.selectList(NAMESPACE+"userLendingLog",user_email);
    }

    public List<Lend> userLendHistory(String user_email)
    {
        return sqlSessionTemplate.selectList(NAMESPACE+"userLendHistory",user_email);
    }

    public int userRenew(String book_id,String user_email)
    {
        HashMap<String,String>temp=new HashMap<>();
        temp.put("book_id",book_id);
        temp.put("user_email",user_email);
        return  sqlSessionTemplate.update(NAMESPACE+"userRenew",temp);
    }

    public int userBooking(String book_id,String user_email){
        HashMap<String,String>temp=new HashMap<>();
        temp.put("book_id",book_id);
        temp.put("user_email",user_email);
        return  sqlSessionTemplate.insert(NAMESPACE+"readerBooking",temp);
    }
    public int userHasBooking(String user_email){
        return sqlSessionTemplate.selectOne(NAMESPACE+"checkUserHasBooking",user_email);
    }

    public List<Booking> getAllBookings(){
        return sqlSessionTemplate.selectList(NAMESPACE + "bookingList");
    }

    public int admitBooking(String user_email,String book_id){
        HashMap<String,String>temp=new HashMap<>();
        temp.put("book_id",book_id);
        temp.put("user_email",user_email);
        return sqlSessionTemplate.update(NAMESPACE+"admitBooking",temp);
    }

    public int refuseBooking(String user_email,String book_id){
        HashMap<String,String>temp=new HashMap<>();
        temp.put("book_id",book_id);
        temp.put("user_email",user_email);
        return sqlSessionTemplate.update(NAMESPACE+"refuseBooking",temp);
    }

    public int findRestNum(String user_email,String book_id)
    {
        try{
            HashMap<String,String>temp=new HashMap<>();
            temp.put("user_email",user_email);
            temp.put("book_id",book_id);
        return sqlSessionTemplate.selectOne(NAMESPACE+"findRestNum",temp);}
        catch (Exception e)
        {
            return 0;
        }
    }

    public int userReturnBook(String user_email,String book_id)
    {
        try{
            HashMap<String,String>temp=new HashMap<>();
            temp.put("user_email",user_email);
            temp.put("book_id",book_id);
            return sqlSessionTemplate.delete(NAMESPACE+"userReturnBook",temp);
        }
        catch (Exception e)
        {
            return 0;
        }
    }

    public List<LendHistory>allLendHistory(){
        return sqlSessionTemplate.selectList(NAMESPACE+"adminGetAllLendHistory");
    }

    public int adminRecordDelete(String user_email, String book_id, String lending_time)
    {
        try{
            HashMap<String,String>temp=new HashMap<>();
            temp.put("user_email",user_email);
            temp.put("book_id",book_id);
            temp.put("lending_time",lending_time);
            return sqlSessionTemplate.delete(NAMESPACE+"adminRecordDelete",temp);
        }
        catch (Exception e)
        {
            return 0;
        }
    }
}
