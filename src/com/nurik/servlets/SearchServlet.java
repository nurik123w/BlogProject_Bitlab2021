package com.nurik.servlets;

import com.google.gson.Gson;
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

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String srch = req.getParameter("search");
        PrintWriter printWriter = resp.getWriter();
        ArrayList<User> user  = db.getResult(srch.trim());
        if (user!=null){
            Gson gson = new Gson();
           String parsedUser =  gson.toJson(user);
           printWriter.println(parsedUser);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
