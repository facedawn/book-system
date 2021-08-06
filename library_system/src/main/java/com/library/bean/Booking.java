package com.library.bean;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Booking {
    private String user_email;
    private int book_id;
    private Date booking_time;
    private Date dealing_time;
    private int status;

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getBooking_time() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
        String res=sdf.format(booking_time);
        return res;
    }

    public void setBooking_time(Date booking_time) {
        this.booking_time = booking_time;
    }

    public String getDealing_time() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
        String res=sdf.format(dealing_time);
        return res;
    }

    public void setDealing_time(Date dealing_time) {
        this.dealing_time = dealing_time;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
