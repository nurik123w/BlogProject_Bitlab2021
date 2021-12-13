package com.nurik.classes;

import java.util.Date;

public class Replies {
    private Long id;
    private String content;
    private Date date;
    private User user;
    private int comment_id;

    public Replies(Long id, String content, Date date, User user, int comment_id) {
        this.id = id;
        this.content = content;
        this.date = date;
        this.user = user;
        this.comment_id = comment_id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    @Override
    public String toString() {
        return "Replies{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", date=" + date +
                ", user=" + user +
                ", comment_id=" + comment_id +
                '}';
    }
}
