package com.nurik.servlets;

import com.nurik.classes.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/friends")
public class FriendsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int index = Integer.parseInt(req.getParameter("index"));
        ArrayList<User> users = db.getAllUsers();
        User user = users.stream().filter(f->f.getId().equals(Long.parseLong(req.getParameter("index")))).findAny().get();
        ArrayList<Content> content = db.getAllContentsByUserId(user.getId());
        ArrayList<Comments> comments = db.getAllComments();
        Friend f = null;
        if((f=db.checkFriend(id,index))!=null){
            req.setAttribute("friend","following");
        }else{
            req.setAttribute("friend","follow");
        }
        req.setAttribute("comments",comments);
        req.setAttribute("content",content);
        req.setAttribute("user",user);
        req.getRequestDispatcher("friends.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
