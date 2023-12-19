package com.example.manga.dao;

import com.example.manga.bean.MangaBean;

import java.util.List;

public interface IMangaDao {
    MangaBean queryMangaById (int id);
    List<Integer> queryMangaIdsByCategory (String category);
    List<Integer> queryIdsByUserId (int id);
    boolean queryIfCollectedMangaByUserId (int user_id, int manga_id);
    int addCollection(int user_id , int manga_id);
    int deleteCollection(int user_id, int manga_id);
}
