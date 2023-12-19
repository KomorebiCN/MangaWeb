package com.example.manga.bean;

import java.util.ArrayList;
import java.util.List;

public class PageBean {
    private int totalRows;
    private int pageSize;
    private int currentPage;
    private int totalPages;
    private int prev;
    private int next;
    private List<UserBean> list;

    public PageBean(int totalRows, int pageSize, int currentPage, List<UserBean> list) {
        this.totalRows = totalRows;
        this.pageSize = pageSize;
        this.currentPage = currentPage;
        this.list = list;
        this.prev = Math.max(currentPage - 1, 1);
        this.totalPages = totalRows % pageSize == 0 ? totalRows / pageSize : totalRows / pageSize + 1;
        this.next = Math.min(currentPage + 1, this.totalPages);
    }

    public PageBean(int pageSize, int currentPage) {
        this(0,pageSize,currentPage,new ArrayList<>());
    }

    public PageBean() {
    }

    public int getTotalRows() {
        return totalRows;
    }

    public void setTotalRows(int totalRows) {
        this.totalRows = totalRows;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public List<UserBean> getList() {
        return list;
    }

    public void setList(List<UserBean> list) {
        this.list = list;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public int getPrev() {
        return prev;
    }

    public void setPrev(int prev) {
        this.prev = prev;
    }

    public int getNext() {
        return next;
    }

    public void setNext(int next) {
        this.next = next;
    }
}
