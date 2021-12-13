package com.nurik.servlets;

import com.nurik.classes.Content;
import com.nurik.classes.User;
import com.nurik.classes.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/deleteBlog")
public class DeleteBlogServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        User u = (User) req.getSession().getAttribute("current_user");
        ArrayList<Content> contents = db.getAllContentsByUserId(u.getId());
        Content content1 =  contents.stream().filter(f->f.getId().equals(Long.parseLong(req.getParameter("index")))).findFirst().get();
        db.deleteContentById(content1.getId());
        resp.sendRedirect("/profile");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
