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

@WebServlet("/sign")
public class SignServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/sign.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String mail = req.getParameter("mail");
        String pass = req.getParameter("pass");
        String retype = req.getParameter("rePass");
        String bdate = req.getParameter("bdate");
        String city =  req.getParameter("city");
        String gender =  req.getParameter("gender");
        String job = req.getParameter("job");
        String address = req.getParameter("address");
        Date date = null;
        try {
            date = new SimpleDateFormat("yyyy-MM-dd").parse(bdate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        User user = db.getUserByEmail(mail);
        String redirect = "/sign?exists";
        if(user==null){
           redirect = "sign?gayDetected";
              if(!gender.equals("gay")){
                redirect = "sign?passError";
                   if(pass.equals(retype)) {
                      if(db.addUser(new User(null, name, surname, mail, pass, date, city, gender,job,address))) {
                          redirect = "sign?success";
                      }
                   }
             }
        }
        resp.sendRedirect(redirect);
    }
}
