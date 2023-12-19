package com.example.manga.bean;

import java.sql.Timestamp;
import java.util.List;

public class MangaBean {
    int id ;
    String name;
    String introduction;
    String category;
    String author;
    List<ChapterBean> list;

    public MangaBean(int id, String name, String introduction, String category, String author, List<ChapterBean> list) {
        this.id = id;
        this.name = name;
        this.introduction = introduction;
        this.category = category;
        this.author = author;
        this.list = list;
    }

    public MangaBean() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public List<ChapterBean> getList() {
        return list;
    }

    public void setList(List<ChapterBean> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "MangaBean{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", introduction='" + introduction + '\'' +
                ", category='" + category + '\'' +
                ", author='" + author + '\'' +
                ", list=" + list +
                '}';
    }
}
