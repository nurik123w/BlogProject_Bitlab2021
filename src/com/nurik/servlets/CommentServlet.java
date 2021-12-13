package com.nurik.servlets;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.nurik.classes.Comments;
import com.nurik.classes.Content;
import com.nurik.classes.User;
import com.nurik.classes.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;


@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        ArrayList<Comments> comments = db.getAllComments();
        PrintWriter printWriter = resp.getWriter();
        if(comments!=null){
            Gson gson = new Gson();
            String parsed = gson.toJson(comments);
            printWriter.println(parsed);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String content = req.getParameter("content");
        int user_id = Integer.parseInt(req.getParameter("user_id"));
        int content_id = Integer.parseInt(req.getParameter("content_id"));
        User user = db.getUserById(user_id);

        Comments c = new Comments(null,content,null,user,content_id);
        if(c!=null){
            db.addComment(c);
        }
    }
}
