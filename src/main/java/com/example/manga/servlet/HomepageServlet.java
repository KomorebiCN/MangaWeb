package com.example.manga.servlet;

import com.example.manga.bean.MangaBean;
import com.example.manga.service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/homepage")
public class HomepageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<MangaBean> list = UserService.getMangaByCategory("-1");
        req.setAttribute("list",list);
        RequestDispatcher dispatcher = req.getRequestDispatcher("./homepage.jsp");
        dispatcher.forward(req, resp);
    }
}
