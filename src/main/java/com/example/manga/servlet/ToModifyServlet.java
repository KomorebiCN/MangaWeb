package com.example.manga.servlet;

import com.example.manga.bean.UserBean;
import com.example.manga.service.AdminService;
import com.google.gson.Gson;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/toModify")
public class ToModifyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        UserBean userBean = AdminService.findUserById(id);
        Gson gson = new Gson();
        req.setAttribute("userBean", gson.toJson(userBean));
        RequestDispatcher dispatcher = req.getRequestDispatcher("modify.jsp");
        dispatcher.forward(req, resp);
    }
}
