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

@WebServlet("/editBlog")
public class EditBlogServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       req.setCharacterEncoding("UTF-8");
        User u = (User) req.getSession().getAttribute("current_user");
        ArrayList<Content> contents = db.getAllContentsByUserId(u.getId());
        Content content1 =  contents.stream().filter(f->f.getId().equals(Long.parseLong(req.getParameter("index")))).findFirst().get();
        req.setAttribute("content",content1);
        req.getRequestDispatcher("editBlog.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
       Long id = 0L;
       try{
           id = Long.parseLong(req.getParameter("id"));
           System.out.println(id);
       }catch (Exception e){
           e.printStackTrace();
       }
       String blog = req.getParameter("blog");
       Content content = db.getContentById(id);
       if(content!=null){
           content.setContent(blog);
           db.updateContentById(content);
           resp.sendRedirect("/profile");
       }
    }
}
