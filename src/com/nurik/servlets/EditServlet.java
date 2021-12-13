package com.nurik.servlets;

import com.nurik.classes.User;
import com.nurik.classes.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/edit")
public class EditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("edit.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String mail = req.getParameter("mail");
        String bdate = req.getParameter("bdate");
        String city =  req.getParameter("city");
        String job = req.getParameter("job");
        String address = req.getParameter("address");
        Date date = null;
        try {
            date = new SimpleDateFormat("yyyy-MM-dd").parse(bdate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        User user = db.getUserByEmail(mail);
        if(user!=null){
            user = new User(user.getId(),name,surname,mail, user.getPassword(),date,city, user.getGender(),job,address);
            db.updateUser(user);
            req.getSession().setAttribute("current_user",user);
            resp.sendRedirect("/profile");
        }
    }
}
