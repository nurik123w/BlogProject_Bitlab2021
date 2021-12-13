package com.nurik.classes;

import java.util.Date;

public class Comments {
    private Long id;
    private String content;
    private Date date;
    private User user;
    private int content_id;

    public Comments(Long id, String content, Date post_date, User user,int content_id) {
        this.id = id;
        this.content = content;
        this.date = post_date;
        this.user= user;
        this.content_id = content_id;
    }

    public User getUser() {
        return user;
    }

    public int getContent_id() {
        return content_id;
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

    public Date getPost_date() {
        return date;
    }

    public void setPost_date(Date post_date) {
        this.date = post_date;
    }


    @Override
    public String toString() {
        return "Comments{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", post_date=" + date +
                ", user=" + user +
                ", content_id=" + content_id +
                '}';
    }
}
