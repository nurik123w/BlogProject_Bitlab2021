package com.nurik.servlets;

import com.nurik.classes.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
@WebServlet("/photo")
public class PhotoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String photo = req.getParameter("photo");
//        Long id = Long.parseLong(req.getParameter("id"));
//        String path = getServletContext().getRealPath("/"+ File.separator+photo);
//        System.out.println(path);
//        db.addPhoto(path,id);
//        req.getRequestDispatcher("/profile.jsp").forward(req,resp);
    }
}
