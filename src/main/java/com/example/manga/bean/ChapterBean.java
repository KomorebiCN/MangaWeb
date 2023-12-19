package com.example.manga.bean;

import java.sql.Timestamp;

public class ChapterBean {
    int manga_id;
    int id;
    int nth;
    String name;
    int pageNum;
    Timestamp update;

    public ChapterBean(int manga_id, int id, int nth, String name, int pageNum, Timestamp update) {
        this.manga_id = manga_id;
        this.id = id;
        this.nth = nth;
        this.name = name;
        this.pageNum = pageNum;
        this.update = update;
    }

    public ChapterBean() {
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getManga_id() {
        return manga_id;
    }

    public void setManga_id(int manga_id) {
        this.manga_id = manga_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNth() {
        return nth;
    }

    public void setNth(int nth) {
        this.nth = nth;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Timestamp getUpdate() {
        return update;
    }

    public void setUpdate(Timestamp update) {
        this.update = update;
    }

    @Override
    public String toString() {
        return "ChapterBean{" +
                "manga_id=" + manga_id +
                ", id=" + id +
                ", nth=" + nth +
                ", name='" + name + '\'' +
                ", pageNum=" + pageNum +
                ", update=" + update +
                '}';
    }
}
