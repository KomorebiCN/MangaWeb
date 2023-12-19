package com.example.manga.servlet;

import com.example.manga.bean.MangaBean;
import com.example.manga.bean.UserBean;
import com.example.manga.service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/detail")
public class DetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int manga_id = Integer.parseInt(req.getParameter("manga_id"));
        UserBean user = (UserBean) req.getSession().getAttribute("user");
        MangaBean mangaBean = UserService.getMangaById(manga_id);
        if(mangaBean != null)
        {
            req.setAttribute("mangaBean", mangaBean);
            if(user!=null)
            {
                req.setAttribute("ifCollected",UserService.ifCollectedManga(user.getId(),manga_id));
            }
            RequestDispatcher dispatcher = req.getRequestDispatcher("./detail/index.jsp");
            dispatcher.forward(req, resp);
        }
        else
        {
            RequestDispatcher dispatcher = req.getRequestDispatcher("error.jsp?errorType=3");
            dispatcher.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int manga_id = Integer.parseInt(req.getParameter("manga_id"));
        UserBean user = (UserBean) req.getSession().getAttribute("user");
        UserService.doFavourite(user.getId(),manga_id,req.getParameter("action"));
        doGet(req,resp);
    }
}
