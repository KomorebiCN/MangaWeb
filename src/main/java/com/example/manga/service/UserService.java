package com.example.manga.service;

import com.example.manga.bean.ChapterBean;
import com.example.manga.bean.MangaBean;
import com.example.manga.bean.UserBean;
import com.example.manga.dao.ChapterDaoImpl;
import com.example.manga.dao.MangaDaoImpl;
import com.example.manga.dao.UserDaoImpl;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class UserService {
    public static int register(String user,String password,String email){
        UserDaoImpl userDao = new UserDaoImpl();
        UserBean userBean = new UserBean();
        LocalDate current = LocalDate.now();
        userBean.setDate(Date.valueOf(current));
        userBean.setUser(user);
        userBean.setPassword(password);
        userBean.setEmail(email);
        userBean.setSex("无");
        userBean.setType(1);
        return userDao.insertUser(userBean);
    }

    public static UserBean findUserByName(String userName)
    {
        UserDaoImpl userDao = new UserDaoImpl();
        return userDao.queryUserByName(userName);
    }

    public static UserBean findUserById(int id)
    {
        UserDaoImpl userDao = new UserDaoImpl();
        return userDao.queryUserById(id);
    }

    public static int getUserCounts()
    {
        UserDaoImpl userDao = new UserDaoImpl();
        return userDao.queryUsersCounts();
    }

    public static MangaBean getMangaById(int id)
    {
        MangaDaoImpl mangaDao = new MangaDaoImpl();
        ChapterDaoImpl chapterDao = new ChapterDaoImpl();
        MangaBean mangaBean = mangaDao.queryMangaById(id);
        mangaBean.setList(chapterDao.queryChaptersByMangaId(id));
        return mangaBean;
    }

    public  static List<MangaBean> getCollectionByUserId(int id)
    {
        MangaDaoImpl mangaDao = new MangaDaoImpl();
        List<Integer> manga_ids = mangaDao.queryIdsByUserId(id);
        List<MangaBean> list = new ArrayList<>();
        for (Integer mangaId : manga_ids) {
            list.add(getMangaById(mangaId));
        }
        return list;
    }

    public static List<MangaBean> getMangaByCategory(String category)
    {
        MangaDaoImpl mangaDao = new MangaDaoImpl();
        if(category.equals("-1"))category = "*";
        List<Integer> manga_ids = mangaDao.queryMangaIdsByCategory(category);
        List<MangaBean> list = new ArrayList<>();
        for (Integer mangaId : manga_ids) {
            list.add(getMangaById(mangaId));
        }
        return list;
    }

    public  static  boolean ifCollectedManga(int user_id,int manga_id)
    {
        MangaDaoImpl mangaDao = new MangaDaoImpl();
        return mangaDao.queryIfCollectedMangaByUserId(user_id, manga_id);
    }

    public  static boolean doFavourite(int user_id,int manga_id,String action)
    {
        MangaDaoImpl mangaDao = new MangaDaoImpl();
        if(action.equals("add"))
        {
            return mangaDao.addCollection(user_id,manga_id) > 0;
        }
        else if (action.equals("delete"))
        {
            return mangaDao.deleteCollection(user_id,manga_id) > 0;
        }
        else
        {
            return false;
        }
    }
}
