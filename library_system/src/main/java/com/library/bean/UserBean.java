package com.library.bean;

public class UserBean {
    private long user_id;
    private String password;
    private String username;
    private boolean is_Admin;

    public long getUserId() {
        return user_id;
    }

    public void setUserId(long user_id) {
        this.user_id = user_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setIs_Admin(boolean is_Admin){this.is_Admin=is_Admin;}

    public boolean getIs_Admin(){return this.is_Admin;}

}
