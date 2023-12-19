package com.example.manga.servlet;

import com.example.manga.bean.UserBean;
import com.example.manga.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user = req.getParameter("user");
        String password = req.getParameter("password");
        String email = req.getParameter("email");

        if(UserService.findUserByName(user)!=null){
            resp.sendRedirect("error.jsp?errorType=1");
        }
        else {
            if(UserService.register(user,password,email)>0)resp.sendRedirect("error.jsp?errorType=0");
            else resp.sendRedirect("error.jsp?errorType=-1");
        }

    }
}
