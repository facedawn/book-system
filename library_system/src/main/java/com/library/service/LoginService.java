package com.library.service;

import com.library.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

    @Autowired
    private UserDao userDao;

    public boolean hasMatchReader(String username,String password)
    {
        return userDao.getMatchCount(username,password)>0;
    }

    public boolean hasMatchAdmin(String username,String password)
    {
        return userDao.getMatchAdmin(username,password)>0;
    }

    public boolean registerSuccess(String email,String username,String password)
    {
        return userDao.register(email,username,password)>=1;
    }
}
