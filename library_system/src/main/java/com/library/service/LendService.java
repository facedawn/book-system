package com.library.service;

import com.library.bean.*;
import com.library.dao.BookDao;
import com.library.dao.LendDao;
import com.sun.nio.sctp.SendFailedNotification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class LendService {
    @Autowired
    private LendDao lenddao;

    public List<Lend> getAllLendList()
    {
        return lenddao.getAllLendList();
    }

    public int userLendBook(String user_email,String bookId)
    {
        return lenddao.userLendBook(user_email,bookId);
    }

    public List<Lend> userLendingLog(String user_email)
    {
        try{
            List<Lend> lendList=lenddao.userLendingLog(user_email);
            return lendList;
        }
        catch (Exception e)
        {
            return null;
        }
    }

    public List<Lend> userLendHistory(String user_email)
    {
        return lenddao.userLendHistory(user_email);
    }

    public int userRenew(String book_id,String user_email)
    {
        return lenddao.userRenew(book_id,user_email);
    }

    public boolean userBooking(String book_id,String user_email ){
        return lenddao.userBooking(book_id,user_email)>0;
    }

    public int userBookingTimes(String user_email){
        return lenddao.userHasBooking(user_email);
    }

    public List<Booking> getAllBookings(){
        return lenddao.getAllBookings();
    }
    public int admitBooking(String user_mail,String book_id){
        return lenddao.admitBooking(user_mail,book_id);
    }
    public int refuseBooking(String user_mail,String book_id){
        return lenddao.refuseBooking(user_mail,book_id);
    }

    public int findRestNum(String user_email,String book_id)
    {
        return lenddao.findRestNum(user_email,book_id);
    }

    public int userReturnBook(String user_email,String book_id)
    {
        return lenddao.userReturnBook(user_email,book_id);
    }

    public List<LendHistory>allLendHistory(){
        return lenddao.allLendHistory();
    }

    public int adminRecordDelete(String user_email, String book_id, String lending_time){
        return lenddao.adminRecordDelete(user_email,book_id,lending_time);
    }
}
