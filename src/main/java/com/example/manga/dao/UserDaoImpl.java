package com.example.manga.dao;

import com.example.manga.bean.UserBean;
import com.example.manga.util.DBUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.sql.Date;

public class UserDaoImpl implements IUserDao{
    @Override
    public UserBean queryUserByName(String user_name) {
        String sql = "select * from user where user_name = ?";
        List<Map<String, Object>> maps = DBUtil.queryToMap(sql, user_name);
        if(!maps.isEmpty())
        {
            Map<String,Object> map = maps.get(0);
            return mapToUserBean(map);
        }
        return null;
    }

    @Override
    public UserBean queryUserById(int id) {
        String sql = "select * from user where id = ?";
        List<Map<String, Object>> maps = DBUtil.queryToMap(sql, id);
        if(!maps.isEmpty())
        {
            Map<String,Object> map = maps.get(0);
            return mapToUserBean(map);
        }
        return null;
    }

    @Override
    public int insertUser(UserBean userBean){
        String sql = "insert into user values(null,?,?,?,?,?,?)";
        return DBUtil.update(sql,userBean.getUser(),userBean.getPassword(),userBean.getType(),userBean.getEmail(),userBean.getSex(),userBean.getDate());
    }

    @Override
    public int updateUser(UserBean userBean) {
        String sql = "update user set user_name = ? , password = ? , type = ? , email = ? , sex = ? where id = ? ";
        return DBUtil.update(sql,userBean.getUser(),userBean.getPassword(),userBean.getType(),userBean.getEmail(),userBean.getSex(),userBean.getId());
    }


    @Override
    public List<UserBean> queryUsersByOffset(int offset, int size) {
        String sql = "select * from user limit ?,?";
        List<Map<String, Object>> maps = DBUtil.queryToMap(sql,offset,size);
        return mapsToList(maps);
    }

    @Override
    public List<UserBean> queryUsersByName(int offset, int size, String searchContent) {
        String sql = "select * from user where user_name like ?";
        List<Map<String, Object>> maps = DBUtil.queryToMap(sql,searchContent);
        return mapsToList(maps);
    }

    public List<UserBean> mapsToList(List<Map<String, Object>> maps)
    {
        List<UserBean> list = new ArrayList<>();
        while (!maps.isEmpty())
        {
            Map<String,Object> map = maps.get(0);
            list.add(mapToUserBean(map));
            maps.remove(map);
        }
        return list;
    }

    @Override
    public int queryUsersCounts() {
        String sql = "select count(*) as counts from user";
        List<Map<String, Object>> maps = DBUtil.queryToMap(sql);
        return Math.toIntExact((long) maps.get(0).get("counts"));
    }

    @Override
    public int queryUsersCountsForSearch(String searchContent) {
        String sql = "select count(*) as counts from user where user_name like ?";
        List<Map<String, Object>> maps = DBUtil.queryToMap(sql,searchContent);
        return Math.toIntExact((long) maps.get(0).get("counts"));
    }

    @Override
    public int deleteUser(UserBean userBean) {
        String sql = "delete from user where id = ?";
        return DBUtil.update(sql,userBean.getId());
    }

    @Override
    public int deleteUserById(int id) {
        String sql = "delete from user where id = ?";
        return DBUtil.update(sql,id);
    }

    public UserBean mapToUserBean(Map<String ,Object> map)
    {
        UserBean userBean = new UserBean();
        userBean.setSex((String) map.get("sex"));
        userBean.setUser((String) map.get("user_name"));
        userBean.setEmail((String) map.get("email"));
        userBean.setPassword((String) map.get("password"));
        userBean.setType((int)map.get("type"));
        userBean.setId((int)map.get("id"));
        userBean.setDate((Date)map.get("date"));
        return userBean;
    }

}
