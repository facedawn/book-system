package com.library.bean;

public class User {
    private String user_email;
    private String user_password;
    private String user_name;
    private boolean is_admin;
    private int rest_lend_num;


    public String getUser_email() {
        return user_email;
    }

    public String getUser_name() {
        return user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public void setIs_admin(boolean is_admin) { this.is_admin=is_admin; }

    public boolean getIs_admin() { return this.is_admin; }

    public void setUser_Email(String e) { user_email = e; }

    public String getUser_Email() { return user_email; }

    public void setRest_lend_num(int n) { rest_lend_num = n; }

    public int getRest_lend_num() { return rest_lend_num; }

}
