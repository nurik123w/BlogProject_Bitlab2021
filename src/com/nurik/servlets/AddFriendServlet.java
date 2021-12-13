package com.nurik.servlets;

import com.nurik.classes.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/addFriend")
public class AddFriendServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int u_id = Integer.parseInt(req.getParameter("user_id"));
        int f_id = Integer.parseInt(req.getParameter("friend_id"));
        db.addFriend(u_id,f_id);
    }
}
