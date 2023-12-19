package com.example.manga.dao;

import com.example.manga.bean.ChapterBean;
import com.example.manga.util.DBUtil;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ChapterDaoImpl implements IChapterDao{
    @Override
    public List<ChapterBean> queryChaptersByMangaId(int mangaId) {
        String sql = "select * from chapter where manga_id = ? order by nth asc";
        List<Map<String, Object>> maps = DBUtil.queryToMap(sql,mangaId);
        return mapsToList(maps);
    }

    public ChapterBean mapsToChapterBean (Map<String, Object> map)
    {
        ChapterBean chapterBean = new ChapterBean();
        chapterBean.setId((Integer) map.get("id"));
        chapterBean.setName((String) map.get("name"));
        chapterBean.setNth((Integer) map.get("nth"));
        chapterBean.setManga_id((Integer) map.get("manga_id"));
        chapterBean.setUpdate((Timestamp) map.get("update"));
        chapterBean.setPageNum((Integer) map.get("pageNum"));
        return chapterBean;
    }

    public List<ChapterBean> mapsToList(List<Map<String, Object>> maps)
    {
        List<ChapterBean> list = new ArrayList<>();
        while (!maps.isEmpty())
        {
            Map<String,Object> map = maps.get(0);
            list.add(mapsToChapterBean(map));
            maps.remove(map);
        }
        return list;
    }
}
