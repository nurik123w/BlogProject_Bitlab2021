package com.nurik.servlets;

import com.google.gson.Gson;
import com.nurik.classes.Comments;
import com.nurik.classes.Replies;
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

@WebServlet(value="/sendReply")
public class SendReplyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        ArrayList<Replies> replies = db.getAllReplies();
        PrintWriter printWriter = resp.getWriter();
        if(replies!=null){
            Gson gson = new Gson();
            String parsed = gson.toJson(replies);
            printWriter.println(parsed);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String content = req.getParameter("content");
        int user_id = Integer.parseInt(req.getParameter("user_id"));
        int comment_id = Integer.parseInt(req.getParameter("comment_id"));
        User user = db.getUserById(user_id);

        Replies replies = new Replies(null,content,null,user,comment_id);
        if(replies!=null){
            db.addReplies(replies);
        }
    }
}
