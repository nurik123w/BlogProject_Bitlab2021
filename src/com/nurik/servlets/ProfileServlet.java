package com.nurik.servlets;

import com.google.gson.Gson;
import com.nurik.classes.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       req.setCharacterEncoding("UTF-8");
        User u = null;
        if((u = (User) req.getSession().getAttribute("current_user"))!=null){

            ArrayList<Content> content = db.getAllContentsByUserId(u.getId());
            ArrayList<Friend> friends = db.getAllFriendsByUserId(u.getId());

            if(content!=null){
                req.setAttribute("content",content);
            }

            req.setAttribute("user",friends);
            req.getRequestDispatcher("profile.jsp").forward(req,resp);

        }else {
            resp.sendRedirect("404.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
