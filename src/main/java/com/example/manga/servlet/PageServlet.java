package com.example.manga.servlet;

import com.example.manga.bean.PageBean;
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
import java.util.List;

@WebServlet("/admin/page")
public class PageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int currentPage = 1;
        int pageSize = 10;
        String searchContent = req.getParameter("searchContent");
        if(searchContent == null)
        {
            int totalRows = AdminService.getUserCounts();
            List<UserBean> list = AdminService.findUsersByPage(currentPage,pageSize);
            PageBean pageBean = new PageBean(totalRows,pageSize,currentPage,list);
            Gson gson = new Gson();
            req.setAttribute("pageBean", gson.toJson(pageBean));
            RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
            dispatcher.forward(req, resp);
        }
        else
        {
            int totalRows = AdminService.getUserCountsForSearch(searchContent);
            List<UserBean> list = AdminService.searchUsersByPageThroughName(currentPage,pageSize,searchContent);
            PageBean pageBean = new PageBean(totalRows,pageSize,currentPage,list);
            Gson gson = new Gson();
            req.setAttribute("pageBean", gson.toJson(pageBean));
            req.setAttribute("searchContent", searchContent);
            RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
            dispatcher.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int currentPage = Integer.parseInt(req.getParameter("currentPage"));
        int pageSize = Integer.parseInt(req.getParameter("pageSize"));
        String searchContent = req.getParameter("searchContent");
        if(searchContent == null)
        {
            int totalRows = AdminService.getUserCounts();
            List<UserBean> list = AdminService.findUsersByPage(currentPage,pageSize);
            PageBean pageBean = new PageBean(totalRows,pageSize,currentPage,list);
            Gson gson = new Gson();
            req.setAttribute("pageBean", gson.toJson(pageBean));
            RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
            dispatcher.forward(req, resp);
        }
        else
        {
            int totalRows = AdminService.getUserCountsForSearch(searchContent);
            List<UserBean> list = AdminService.searchUsersByPageThroughName(currentPage,pageSize,searchContent);
            PageBean pageBean = new PageBean(totalRows,pageSize,currentPage,list);
            Gson gson = new Gson();
            req.setAttribute("pageBean", gson.toJson(pageBean));
            req.setAttribute("searchContent", searchContent);
            RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
