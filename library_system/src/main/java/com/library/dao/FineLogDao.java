package com.library.dao;

import com.library.bean.FineLog;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class FineLogDao {
    private final static String NAMESPACE = "com.library.dao.FineLogDao.";

    @Resource
    private SqlSessionTemplate sqlSessionTemplate;
    public List<FineLog> getAllFineLog()
    {
        return sqlSessionTemplate.selectList(NAMESPACE+"getAllFineLog");
    }

    public List<FineLog> getFineLogByTime(String st, String ed) {
        Map<String, Object> mp = new HashMap<>();
        st = st.replace('/', '-');
        ed = ed.replace('/', '-');
        mp.put("right_side", ed + " 23:59:59");
        mp.put("left_side", st+ " 00:00:00");
        return sqlSessionTemplate.selectList(NAMESPACE + "getFineLogByTime", mp);
    }

    public List<FineLog> getUnPayedFineLogByTime(String st, String ed) {
        Map<String, Object> mp = new HashMap<>();
        st = st.replace('/', '-');
        ed = ed.replace('/', '-');
        mp.put("right_side", ed + " 23:59:59");
        mp.put("left_side", st+ " 00:00:00");
        return sqlSessionTemplate.selectList(NAMESPACE + "getUnPayedFineLogByTime", mp);
    }

    public List<FineLog> getPayedFineLogByTime(String st, String ed) {
        Map<String, Object> mp = new HashMap<>();
        st = st.replace('/', '-');
        ed = ed.replace('/', '-');
        mp.put("right_side", ed + " 23:59:59");
        mp.put("left_side", st+ " 00:00:00");
        return sqlSessionTemplate.selectList(NAMESPACE + "getPayedFineLogByTime", mp);
    }

    public List<FineLog> getAllUnPayedFineLog() { return sqlSessionTemplate.selectList(NAMESPACE + "getAllUnPayedFineLog"); }

    public int payAFine(String user_email, int book_id, String dt){
        Map<String, Object> mp = new HashMap<>();
        dt = dt.replace('/', '-');
        mp.put("user_email", user_email);
        mp.put("book_id", book_id);
        mp.put("left_side", dt + " 00:00:00");
        mp.put("right_side", dt + " 23:59:59");
        return sqlSessionTemplate.update(NAMESPACE + "payAFine", mp);
    }

    public List<FineLog> getUnPayedFineLogByUser(String user_email){
        Map<String, Object> mp = new HashMap<>();
        mp.put("user_email", user_email);
        return sqlSessionTemplate.selectList(NAMESPACE + "getUnPayedFineLogByUser", mp);
    }

    public List<FineLog> getFineLogByUser(String user_email){
        Map<String, Object> mp = new HashMap<>();
        mp.put("user_email", user_email);
        return sqlSessionTemplate.selectList(NAMESPACE + "getFineLogByUser", mp);
    }
}
