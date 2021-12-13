package com.nurik.servlets;

import com.nurik.classes.User;
import com.nurik.classes.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String n = req.getParameter("n");
        String p = req.getParameter("p");
        User user = db.getUserByEmail(n);
        String redirect = "login?mailError";
        if(user!=null){
            redirect = "login?passError";
            if(user.getPassword().equals(p)){
                redirect = "profile?id="+user.getId();
                req.getSession().setAttribute("current_user",user);
            }
        }
        resp.sendRedirect(redirect);
    }
}
