package com.example.manga.servlet;

import com.example.manga.service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/add")
public class AddServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user = req.getParameter("user");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String sex = req.getParameter("sex");
        int type = Integer.parseInt(req.getParameter("type"));
        if(AdminService.addUser(user,password,email,sex,type)>0)
        {
            resp.sendRedirect("page");
        }
        else
        {
            resp.sendRedirect("error.jsp?errorType=2");
        }
    }
}
