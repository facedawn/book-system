package com.library.bean;

public class Book{
    private int book_id;
    private String book_name;
    private String book_auth;
    private String book_pub;
    private String ISBN;
    private double book_pric;
    private String book_intro;
    private boolean in_library;
    private int res_num;
    public void setRes_num(int resnum) { this.res_num = resnum; }

    public void setBook_auth(String book_auth) {
        this.book_auth = book_auth;
    }

    public void setBook_intro(String book_intro) {
        this.book_intro = book_intro;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public void setBook_pric(double book_pric) {
        this.book_pric = book_pric;
    }

    public void setBook_pub(String book_pub) {
        this.book_pub = book_pub;
    }

    public void setIn_library(boolean in_library) {
        this.in_library = in_library;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getBook_auth() {
        return book_auth;
    }

    public String getBook_intro() {
        return book_intro;
    }

    public String getBook_name() {
        return book_name;
    }

    public String getBook_pub() {
        return book_pub;
    }

    public String getISBN() {
        return ISBN;
    }

    public double getBook_pric() {
        return book_pric;
    }

    public boolean isIn_library() {
        return in_library;
    }

    public int getRes_num() { return res_num; }
}