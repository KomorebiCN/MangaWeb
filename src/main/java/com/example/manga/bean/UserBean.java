package com.example.manga.bean;

import java.sql.Date;

public class UserBean {
    private int id;
    private String user;
    private String password;
    private String email;
    private String sex;
    private int type;
    private Date date;

    public UserBean(int id, String user, String password, String email, String sex, int type, Date date) {
        this.id = id;
        this.user = user;
        this.password = password;
        this.email = email;
        this.sex = sex;
        this.type = type;
        this.date = date;
    }

    public UserBean() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
