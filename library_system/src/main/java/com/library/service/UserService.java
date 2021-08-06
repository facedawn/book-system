package com.library.service;

import com.library.bean.User;
import com.library.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserDao userDao;

    public List<User> getAllReader()
    {
        return userDao.getAllReader();
    }

    public List<User> getVagueReaderByEmail(String user_email)
    {
        user_email="%"+user_email+"%";

        return userDao.getVagurReaderByEmail(user_email);
    }

    public int adminAddReader(User user)
    {
        return userDao.adminAddReader(user);
    }

    public int DeleteReaders(String user_email)
    {
        return userDao.DeleteReaders(user_email);
    }

    public User adminGetReader(String user_email)
    {
        return userDao.adminGetReader(user_email);
    }

    public User getInfo(String user_email)
    {
        return userDao.getInfo(user_email);
    }

    public int userUpdate(String user_email,String user_name)
    {
        User user = new User();
        user.setUser_name(user_name);
        user.setUser_email(user_email);
        user.setIs_admin(false);
        user.setRest_lend_num(20);
        return userDao.updateUser(user);
    }

    public int repassword(String old_password,String new_password,String user_email)
    {
        return userDao.repassword(old_password,new_password,user_email);
    }

    public int readerUpdateInfo(String user_email,String user_name)
    {
        return userDao.readerUpdateInfo(user_email,user_name);
    }
}
