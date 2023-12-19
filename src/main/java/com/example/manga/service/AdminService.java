package com.example.manga.service;

import com.example.manga.bean.UserBean;
import com.example.manga.dao.UserDaoImpl;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class AdminService extends UserService{

    public static List<UserBean> findUsersByPage(int currentPage, int pageSize)
    {
        int offset = (currentPage - 1)*pageSize;
        UserDaoImpl userDao = new UserDaoImpl();
        return userDao.queryUsersByOffset(offset,pageSize);
    }

    public static List<UserBean> searchUsersByPageThroughName(int currentPage, int pageSize, String searchContent)
    {
        int offset = (currentPage - 1)*pageSize;
        UserDaoImpl userDao = new UserDaoImpl();
        searchContent = "%" + searchContent + "%";
        return userDao.queryUsersByName(offset,pageSize,searchContent);
    }

    public static int getUserCountsForSearch(String searchContent)
    {
        UserDaoImpl userDao = new UserDaoImpl();
        searchContent = "%" + searchContent + "%";
        return userDao.queryUsersCountsForSearch(searchContent);
    }

    public static int ModifyUser(UserBean userBean)
    {
        UserDaoImpl userDao = new UserDaoImpl();
        return userDao.updateUser(userBean);
    }

    public static int deleteUserById(int id)
    {
        UserDaoImpl userDao = new UserDaoImpl();
        return userDao.deleteUserById(id);
    }

    public static int addUser(String user,String password,String email,String sex,int type){
        UserDaoImpl userDao = new UserDaoImpl();
        UserBean userBean = new UserBean();
        LocalDate current = LocalDate.now();
        userBean.setDate(Date.valueOf(current));
        userBean.setUser(user);
        userBean.setPassword(password);
        userBean.setEmail(email);
        userBean.setSex(sex);
        userBean.setType(type);
        return userDao.insertUser(userBean);
    }
}
