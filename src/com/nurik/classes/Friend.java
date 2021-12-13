package com.nurik.classes;

public class Friend {
    Long id;
    User user;
    User friend;

    public Friend(Long id, User user, User friend) {
        this.id = id;
        this.user = user;
        this.friend = friend;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getFriend() {
        return friend;
    }

    public void setFriend(User friend) {
        this.friend = friend;
    }

    @Override
    public String toString() {
        return "Friend{" +
                "id=" + id +
                ", user=" + user +
                ", friend=" + friend +
                '}';
    }
}
