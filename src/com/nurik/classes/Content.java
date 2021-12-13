package com.nurik.classes;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Content {
    private Long id;
    private String content;
    private Date postDate;
    private int user_id;

    SimpleDateFormat format = new SimpleDateFormat("MM-dd HH:mm");

    public Content(Long id, String content, Date postDate, int user_id) {
        this.id = id;
        this.content = content;
        this.postDate = postDate;
        this.user_id = user_id;
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

    public String getPostDate() {
        return format.format(postDate);
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "Content{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", postDate=" + postDate +
                ", user_id=" + user_id +
                ", format=" + format +
                '}';
    }
}
