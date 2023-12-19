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

@WebServlet("/classify")
public class ClassifyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int type = -1;
        if(req.getParameter("category")!=null)
        {
            type = Integer.parseInt(req.getParameter("category"));
        }
        String category = "-1";
        switch (type)
        {
            case 1: category = "都市";break;
            case 2: category = "校园";break;
            case 3: category = "穿越";break;
            case 4: category = "奇幻";break;
            case 5: category = "热血";break;
            case -1:
            default:
                break;
        }
        List<MangaBean> list = UserService.getMangaByCategory(category);
        req.setAttribute("list",list);
        req.setAttribute("tagChoose", type);
        RequestDispatcher dispatcher = req.getRequestDispatcher("./classify/index.jsp");
        dispatcher.forward(req, resp);
    }
}
