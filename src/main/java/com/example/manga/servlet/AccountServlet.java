package com.example.manga.servlet;

import com.example.manga.bean.UserBean;
import com.example.manga.service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/account-center")
public class AccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserBean user = (UserBean) session.getAttribute("user");
        req.setAttribute("mangaBeans", UserService.getCollectionByUserId(user.getId()));
        RequestDispatcher dispatcher = req.getRequestDispatcher("account-center/account-info.jsp");
        dispatcher.forward(req,resp);
    }
}
