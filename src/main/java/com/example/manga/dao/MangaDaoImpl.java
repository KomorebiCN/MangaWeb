package com.example.manga.dao;

import com.example.manga.bean.MangaBean;
import com.example.manga.bean.UserBean;
import com.example.manga.util.DBUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class MangaDaoImpl implements IMangaDao{
    @Override
    public MangaBean queryMangaById(int id) {
        String sql = "select * from manga where id = ?";
        List<Map<String, Object>> maps = DBUtil.queryToMap(sql, id);
        if(!maps.isEmpty())
        {
            Map<String, Object> map = maps.get(0);
            return mapToMangaBean(map);
        }
        return null;
    }

    public MangaBean mapToMangaBean (Map<String, Object> map)
    {
        MangaBean mangaBean = new MangaBean();
        mangaBean.setId((Integer) map.get("id"));
        mangaBean.setName((String) map.get("name"));
        mangaBean.setIntroduction((String) map.get("introduction"));
        mangaBean.setAuthor((String) map.get("author"));
        mangaBean.setCategory((String) map.get("category"));
        return mangaBean;
    }

    public List<MangaBean> mapsToList(List<Map<String, Object>> maps)
    {
        List<MangaBean> list = new ArrayList<>();
        while (!maps.isEmpty())
        {
            Map<String,Object> map = maps.get(0);
            list.add(mapToMangaBean(map));
            maps.remove(map);
        }
        return list;
    }

    @Override
    public List<Integer> queryMangaIdsByCategory(String category) {
        String sql;
        List<Map<String,Object>> maps;
        if (category.equals("*")) {
            sql = "select id from manga";
            maps = DBUtil.queryToMap(sql);
        } else {
            sql = "select id from manga where category = ?";
            maps = DBUtil.queryToMap(sql,category);
        }

        List<Integer> list = new ArrayList<>();
        while (!maps.isEmpty())
        {
            Map<String,Object> map = maps.get(0);
            list.add((Integer) map.get("id"));
            maps.remove(map);
        }
        return list;
    }

    @Override
    public List<Integer> queryIdsByUserId(int id) {
        String sql = "select manga_id from collection where user_id = ?";
        List<Map<String, Object>> maps = DBUtil.queryToMap(sql,id);
        List<Integer> list = new ArrayList<>();
        while (!maps.isEmpty())
        {
            Map<String,Object> map = maps.get(0);
            list.add((Integer) map.get("manga_id"));
            maps.remove(map);
        }
        return list;
    }

    @Override
    public boolean queryIfCollectedMangaByUserId(int user_id, int manga_id) {
        String sql = "select count(*) from collection where user_id = ? and manga_id = ?";
        List<List> list = DBUtil.queryToList(sql, user_id, manga_id);
        boolean IF =(long) list.get(0).get(0) > 0;
        return IF;
    }

    @Override
    public int addCollection(int user_id, int manga_id) {
        String sql = "insert into collection values(?,?)";
        return DBUtil.update(sql,user_id,manga_id);
    }

    @Override
    public int deleteCollection(int user_id, int manga_id) {
        String sql = "delete from collection where user_id = ? and manga_id = ?";
        return DBUtil.update(sql,user_id,manga_id);
    }
}
