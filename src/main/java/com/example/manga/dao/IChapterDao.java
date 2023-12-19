package com.example.manga.dao;

import com.example.manga.bean.ChapterBean;

import java.util.List;

public interface IChapterDao {
    List<ChapterBean> queryChaptersByMangaId(int mangaId);
}
