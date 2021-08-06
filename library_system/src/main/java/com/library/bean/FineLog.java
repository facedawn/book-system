package com.library.bean;

import org.joda.time.DateTime;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FineLog {
    private String user_email;
    private int book_id;
    private Date lend_time;
    private Date return_time;
    private double fine_amount;
    private boolean pay_situ;

    public String getLend_time() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
        String res=sdf.format(lend_time);
        return res;
    }

    public String getReturn_time() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
        String res=sdf.format(return_time);
        return res;
    }

    public void setUser_email(String user_email) { this.user_email = user_email; }

    public void setBook_id(int book_id) { this.book_id = book_id; }

    public void setLend_time(Date lend_time) { this.lend_time = lend_time; }

    public void setReturn_time(Date return_time) { this.return_time = return_time; }

    public void setFine_amount(double fine_amount) { this.fine_amount = fine_amount; }

    public void setPay_situ(boolean fine_situ) { this.pay_situ = fine_situ; }

    public String getUser_email() { return user_email; }

    public int getBook_id() { return book_id; }

    public double getFine_amount() { return fine_amount; }

    public boolean getPay_situ() { return pay_situ; }
}
