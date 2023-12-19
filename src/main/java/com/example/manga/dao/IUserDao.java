package com.example.manga.dao;

import com.example.manga.bean.UserBean;

import java.util.List;

public interface IUserDao {
    UserBean queryUserByName(String user_name);
    UserBean queryUserById(int id);
    int insertUser(UserBean user);
    int updateUser(UserBean userBean);
    List<UserBean> queryUsersByOffset(int offset,int size);
    List<UserBean> queryUsersByName(int offset,int size,String searchContent);
    int queryUsersCounts();
    int queryUsersCountsForSearch(String searchContent);
    int deleteUser(UserBean userBean);
    int deleteUserById(int id);
}
