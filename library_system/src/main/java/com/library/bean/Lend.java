package com.library.bean;

import java.text.SimpleDateFormat;
import java.util.Date;
public class Lend {
    private String user_email;
    private int book_id;
    private Date lending_time;
    private Date return_time;
    private int rest_num;

    public int getBook_id() {
        return book_id;
    }

    public String getLending_time() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
        String res=sdf.format(lending_time);
        return res;
    }

    public String getReturn_time() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
        String res=sdf.format(return_time);
        return res;
    }

    public int getRest_num() {
        return rest_num;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public void setLending_time(Date lending_time) {
        this.lending_time = lending_time;
    }

    public void setRest_num(int rest_num) {
        this.rest_num = rest_num;
    }

    public void setReturn_time(Date return_time) {
        this.return_time = return_time;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }
}