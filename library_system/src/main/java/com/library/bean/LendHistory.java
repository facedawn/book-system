package com.library.bean;

import org.joda.time.DateTime;

import java.text.SimpleDateFormat;
import java.util.Date;

public class LendHistory {
    private String user_email;
    private int book_id;
    private Date lending_time;
    private Date return_time;

    public String getLending_time() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(lending_time);
    }


    public String getReturn_time() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(return_time);
    }

    public void setUser_email(String user_email) { this.user_email = user_email; }

    public void setBook_id(int book_id) { this.book_id = book_id; }

    public void setLending_time(Date lending_time) { this.lending_time = lending_time; }

    public void setReturn_time(Date return_time) { this.return_time = return_time; }

    public String getUser_email() { return user_email; }

    public int getBook_id() { return book_id; }

}
