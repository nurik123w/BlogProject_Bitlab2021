package com.nurik.classes;

import java.sql.*;
import java.util.ArrayList;

public class db {
    private static Connection con;
    static {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog_project?useUnicode=true&serverTimezone=UTC","root","");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public static User getUserByEmail(String email){
        User u = null;
        try{
            PreparedStatement pt = con.prepareStatement("SELECT * FROM user WHERE email=?");
            pt.setString(1,email);
            ResultSet rs = pt.executeQuery();
            while (rs.next()){
                u = new User(
                  rs.getLong("id"),
                  rs.getString("name"),
                  rs.getString("surname"),
                  rs.getString("email"),
                  rs.getString("password"),
                  rs.getDate("birthdate"),
                  rs.getString("city"),
                  rs.getString("gender"),
                  rs.getString("job"),
                  rs.getString("address"),
                  rs.getString("img")
                );
            }
            pt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return u;
    }
    public static boolean addUser(User u){
        int row = 0;
        try{
            PreparedStatement pt = con.prepareStatement("INSERT INTO user (id,name ,surname,email,password,birthdate,city,gender,job,address) VALUES (null,?,?,?,?,?,?,?,?,?)");
            pt.setString(1,u.getName());
            pt.setString(2,u.getSurname());
            pt.setString(3,u.getEmail());
            pt.setString(4,u.getPassword());
            pt.setDate(5,new java.sql.Date(u.getBirthdate().getTime()));
            pt.setString(6,u.getCity());
            pt.setString(7,u.getGender());
            pt.setString(8,u.getJob());
            pt.setString(9,u.getAddress());
            row =  pt.executeUpdate();
            pt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return row>0;
    }
    public static void updateUser(User u){
        try{
            PreparedStatement pt = con.prepareStatement("UPDATE user SET name =?, surname=? ,email=?,password=?, birthdate=? , city=?, gender=?, job=?, address=? WHERE id = ?");
            pt.setString(1,u.getName());
            pt.setString(2,u.getSurname());
            pt.setString(3,u.getEmail());
            pt.setString(4,u.getPassword());
            pt.setDate(5,new java.sql.Date(u.getBirthdate().getTime()));
            pt.setString(6,u.getCity());
            pt.setString(7,u.getGender());
            pt.setString(8,u.getJob());
            pt.setString(9,u.getAddress());
            pt.setLong(10,u.getId());
            pt.executeUpdate();
            pt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void addContent(Content c){
        try{
            PreparedStatement pt = con.prepareStatement("INSERT INTO content (id,content,date_of_post,user_id) VALUES (null,?,null,?)");
            pt.setString(1,c.getContent());
            pt.setInt(2,c.getUser_id());
            pt.executeUpdate();
            pt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public static ArrayList<User> getAllUsers(){
        ArrayList<User> users =new ArrayList<>();
        try{
            PreparedStatement pt = con.prepareStatement("SELECT * FROM user");
            ResultSet rs = pt.executeQuery();
            while (rs.next()){
                users.add(new User(
                        rs.getLong("id"),
                        rs.getString("name"),
                        rs.getString("surname"),
                        rs.getString("email"),
                        null,
                        rs.getDate("birthdate"),
                        rs.getString("city"),
                        rs.getString("gender"),
                        rs.getString("job"),
                        rs.getString("address"),
                        rs.getString("img")
                ));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return users;
    }
    public static ArrayList<Content> getAllContentsByUserId(Long id){
        ArrayList<Content> content = new ArrayList<>();
        try{
            PreparedStatement pt = con.prepareStatement("SELECT * FROM content WHERE user_id=? ORDER BY id DESC ");
            pt.setLong(1,id);
            ResultSet rs = pt.executeQuery();
            while (rs.next()){
                content.add(new Content(
                        rs.getLong("id"),
                        rs.getString("content"),
                        rs.getTimestamp("date_of_post"),
                        Math.toIntExact(id)
                ));
            }
            pt.close();
        }catch (Exception e ){
            e.printStackTrace();
        }
        return content;
    }
    public static Content getContentById(Long id){
      Content content = null;
        try{
            PreparedStatement pt = con.prepareStatement("SELECT * FROM content WHERE id=?");
            pt.setLong(1,id);
            ResultSet rs = pt.executeQuery();
            while (rs.next()){
                content = new Content(
                      id,
                      rs.getString("content"),
                      rs.getTimestamp("date_of_post"),
                      rs.getInt("user_id")
                );
            }
            pt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return content;
    }

    public static void updateContentById(Content c){
        try{
            PreparedStatement pt = con.prepareStatement("UPDATE content SET content=?, date_of_post=null  WHERE id = ?");
            pt.setString(1,c.getContent());
            pt.setLong(2,c.getId());
            pt.executeUpdate();
            pt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public static void deleteContentById(Long id){
        try{
            PreparedStatement pt = con.prepareStatement("DELETE FROM content WHERE id=?");
            pt.setLong(1,id);
            pt.executeUpdate();
            pt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void addComment(Comments c){
        try{
            PreparedStatement pt = con.prepareStatement("INSERT INTO comments (id,content,post_date,user_id,content_id) VALUES (null,?,null,?,?)");
            pt.setString(1,c.getContent());
            pt.setInt(2, Math.toIntExact(c.getUser().getId()));
            pt.setInt(3,c.getContent_id());
            pt.executeUpdate();
            pt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    public static ArrayList<Comments> getAllComments(){
        ArrayList<Comments> comments = new ArrayList<>();
        try{
            PreparedStatement pt = con.prepareStatement("select c.id , c.content, c.post_date, c.user_id ,u.name, u.surname, u.img ,  c.content_id\n" +
                    "from comments c\n" +
                    "INNER JOIN user u on c.user_id = u.id ORDER BY c.id DESC ");
            ResultSet rs = pt.executeQuery();
            while (rs.next()){
                comments.add(new Comments(
                   rs.getLong("id"),
                   rs.getString("content"),
                   rs.getTimestamp("post_date"),
                   new User(
                           rs.getLong("user_id"),
                           rs.getString("name"),
                           rs.getString("surname"),
                           rs.getString("img")
                   ),
                   rs.getInt("content_id")
                ));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return comments;
    }

    public static User getUserById(int id){
        User user = null;
        try{
            PreparedStatement pt = con.prepareStatement("SELECT id,name,surname, img FROM user WHERE id = ?");
            pt.setLong(1,id);
            ResultSet rs = pt.executeQuery();
            while (rs.next()){
                user = new User(
                     rs.getLong("id"),
                     rs.getString("name"),
                     rs.getString("surname"),
                     rs.getString("img")
                );
            }
            pt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }


    public static void addPhoto(String p,Long id){
        try{
            PreparedStatement pt = con.prepareStatement("UPDATE user SET img=? WHERE id=?");
            pt.setString(1,p);
            pt.setLong(2,id);
            pt.executeUpdate();
            pt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<User> getResult(String s){
       ArrayList<User> result = new ArrayList<>();
        try{
            PreparedStatement pt = con.prepareStatement("SELECT * FROM user WHERE name LIKE '"+s+"%'");

            ResultSet rs = pt.executeQuery();
            while (rs.next()){
                result.add(new User(
                        rs.getLong("id"),
                        rs.getString("name"),
                        rs.getString("surname"),
                        rs.getString("email"),
                        null,
                        rs.getDate("birthdate"),
                        rs.getString("city"),
                        rs.getString("gender"),
                        rs.getString("job"),
                        rs.getString("address")
                ));
            }
            pt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return  result;
    }

    public static void addFriend(int u,int f){
        try{
            PreparedStatement pt = con.prepareStatement("INSERT INTO friends (id,user_id,friend_id) VALUES (null,?,?)");
            pt.setInt(1,u);
            pt.setInt(2,f);
            pt.executeUpdate();
            pt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<Friend> getAllFriendsByUserId(Long id){
        ArrayList<Friend> f = new ArrayList<>();
        try{
            PreparedStatement pt = con.prepareStatement("SELECT f.id, f.user_id , u.name , u.surname , f.friend_id, fr.name AS friendName, fr.surname AS friendSurname\n" +
                    "from friends f\n" +
                    "INNER JOIN user u on f.user_id = u.id\n" +
                    "INNER JOIN user fr on f.friend_id = fr.id\n WHERE user_id=?");
            pt.setLong(1,id);
            ResultSet rs = pt.executeQuery();
            while (rs.next()){
               f.add(new Friend(
                       rs.getLong("id"),
                       new User(
                               rs.getLong("user_id"),
                               rs.getString("name"),
                               rs.getString("surname"),
                               null
                       ),
                       new User(
                               rs.getLong("friend_id"),
                               rs.getString("friendName"),
                               rs.getString("friendSurname"),
                               null
                       )
               ));
            }
            pt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    public static Friend checkFriend(int user_id , int friend_id){
        Friend friend = null;
        try{
            PreparedStatement pt = con.prepareStatement("SELECT * FROM friends  WHERE  user_id = ? AND friend_id=?");
            pt.setInt(1,user_id);
            pt.setInt(2,friend_id);
            ResultSet rs = pt.executeQuery();
            while (rs.next()){
                friend = new Friend(
                        rs.getLong("id"),
                        null,
                        null
                );
            }
            pt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return friend;
    }

    public static boolean deleteComment(int id){
        int rows = 0;
        try{
            PreparedStatement pt = con.prepareStatement("DELETE FROM comments WHERE id=?");
            pt.setInt(1,id);
            rows = pt.executeUpdate();
            pt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return rows>0;
    }

    public static void addReplies(Replies replies){
        try{
            PreparedStatement pt = con.prepareStatement("INSERT INTO replies(id,content,post_date,user_id,comment_id)VALUES (null,?,null,?,?)");
            pt.setString(1,replies.getContent());
            pt.setInt(2, Math.toIntExact(replies.getUser().getId()));
            pt.setInt(3,replies.getComment_id());
            pt.executeUpdate();
            pt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<Replies> getAllReplies(){
        ArrayList<Replies> replies = new ArrayList<>();
        try{
            PreparedStatement pt = con.prepareStatement("select c.id , c.content, c.post_date, c.user_id ,u.name, u.surname, u.img ,  c.comment_id\n" +
                    "from replies c\n" +
                    "INNER JOIN user u on c.user_id = u.id ORDER BY c.id DESC ");
            ResultSet rs = pt.executeQuery();
            while (rs.next()){
                replies.add(new Replies(
                    rs.getLong("id"),
                    rs.getString("content"),
                    rs.getTimestamp("post_date"),
                        new User(
                                rs.getLong("user_id"),
                                rs.getString("name"),
                                rs.getString("surname"),
                                rs.getString("img")
                        ),
                    rs.getInt("comment_id")
                ));
            }
            pt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return replies;
    }
    public static void deleteReply(int id){
        try{
            PreparedStatement pt = con.prepareStatement("DELETE FROM replies WHERE id=?");
            pt.setInt(1,id);
            pt.executeUpdate();
            pt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
