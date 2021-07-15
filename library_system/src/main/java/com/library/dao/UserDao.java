package com.library.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.HashMap;
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
        return sqlSessionTemplate.selectOne(NAMESPACE+"getMatchCount",map);
    }

    public int getMatchAdmin(String username,String password)
    {
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("user_name",username);
        map.put("user_password",password);
        return sqlSessionTemplate.selectOne(NAMESPACE+"getMatchAdmin",map);
    }
}
