package com.library.dao;

import com.library.bean.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class UserDao {
    @Resource
    private SqlSessionTemplate sqlSessionTemplate;

    private final static String NAMESPACE="com.library.dao.UserDao.";

    public int getMatchCount(String username,String password)
    {
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("user_name",username);
        map.put("user_password",password);
        try{
            return sqlSessionTemplate.selectOne(NAMESPACE+"getMatchCount",map);
        }catch (Exception e){
            return 0;
        }
    }

    public int getMatchAdmin(String username,String password)
    {
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("user_name",username);
        map.put("user_password",password);
        try {
            return sqlSessionTemplate.selectOne(NAMESPACE+"getMatchAdmin",map);
        }catch (Exception e){
            return 0;
        }
    }

    public int register(String email,String username,String password)
    {
        Map<String,Object> map=new HashMap<>();
        map.put("user_name",username);
        map.put("user_password",password);
        map.put("email",email);

        return sqlSessionTemplate.insert(NAMESPACE+"register",map);
    }

    public List<User> getAllReader()
    {
        return sqlSessionTemplate.selectList(NAMESPACE+"getAllUserInfo");
    }

    public List<User>getVagurReaderByEmail(String user_email)
    {
        return sqlSessionTemplate.selectList(NAMESPACE+"getVagueReaderInfo",user_email);
    }

    public int adminAddReader(User user)
    {
        try{
            return sqlSessionTemplate.insert(NAMESPACE+"adminAddReader",user);
        }
        catch (Exception e)
        {  return 0;}

    }

    public int DeleteReaders(String user_email)
    {
        try{
            return sqlSessionTemplate.delete(NAMESPACE+"adminDeleteReader",user_email);
        }catch (Exception e){
            return 0;
        }
    }

    public User adminGetReader(String user_email)
    {
        return sqlSessionTemplate.selectOne(NAMESPACE+"getReaderInfo",user_email);
    }

    public int updateUser(User user)
    {
        return sqlSessionTemplate.update(NAMESPACE+"userUpdate",user);
    }

    public User getInfo(String user_email)
    {
        try{
            return sqlSessionTemplate.selectOne(NAMESPACE+"getInfo",user_email);
        }catch (Exception e){
            return null;
        }

    }

    public int repassword(String oldPassword,String newPassword,String user_email)
    {
        HashMap<String,String> temp=new HashMap<>();
        temp.put("old_password",oldPassword);
        temp.put("new_password",newPassword);
        temp.put("user_email",user_email);
        return sqlSessionTemplate.update(NAMESPACE+"resetPassword",temp);
    }

    public int readerUpdateInfo(String user_email,String user_name)
    {
        HashMap<String,String >temp=new HashMap<>();
        temp.put("user_email",user_email);
        temp.put("user_name",user_name);
        return sqlSessionTemplate.update(NAMESPACE+"userUpdate",temp);
    }
}
