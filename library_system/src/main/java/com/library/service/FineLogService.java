package com.library.service;

import com.library.bean.FineLog;
import com.library.dao.BookDao;
import com.library.dao.FineLogDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FineLogService {
    @Autowired
    private FineLogDao fineLogDao;

    public List<FineLog> getAllFineLog()
    {
        return fineLogDao.getAllFineLog();
    }

    public List<FineLog> getFineLogByTime(String st, String ed) { return fineLogDao.getFineLogByTime(st, ed); }

    public List<FineLog> getAllUnPayedFineLog() { return  fineLogDao.getAllUnPayedFineLog(); }

    public int payAFine(String user_email, int book_id, String dt){ return fineLogDao.payAFine(user_email, book_id, dt); }

    public List<FineLog> getUnPayedFineLogByUser(String user_email){ return fineLogDao.getUnPayedFineLogByUser(user_email); }

    public List<FineLog> getFineLogByUser(String user_email){ return  fineLogDao.getFineLogByUser(user_email); }

    public List<FineLog> getPayedFineLogByTime (String st, String ed) { return fineLogDao.getPayedFineLogByTime(st, ed); }

    public List<FineLog> getUnPayedFineLogByTime (String st, String ed) { return fineLogDao.getUnPayedFineLogByTime(st, ed); }
}
