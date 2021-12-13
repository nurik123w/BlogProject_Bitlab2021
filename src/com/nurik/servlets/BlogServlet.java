package com.nurik.servlets;

import com.nurik.classes.Content;
import com.nurik.classes.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/blog")
public class BlogServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String blog = req.getParameter("my_content");
        Long id = Long.parseLong(req.getParameter("id"));
        if(blog!=null){
            db.addContent(new Content(null,blog,null, Math.toIntExact(id)));
            resp.sendRedirect("/profile");
        }
    }
}
