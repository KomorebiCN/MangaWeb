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

@WebServlet("/reader")
public class ReaderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int manga_id = Integer.parseInt(req.getParameter("manga_id"));
        int chapter_id = Integer.parseInt(req.getParameter("chapter_id"));
        MangaBean mangaBean = UserService.getMangaById(manga_id);
        int flag = 0;
        for (int i = 0,prev = 0, next = 1; i < mangaBean.getList().size(); i++) {
            if(chapter_id == mangaBean.getList().get(i).getId())
            {
                req.setAttribute("chapterBean", mangaBean.getList().get(i));
                req.setAttribute("manga_id", manga_id);
                req.setAttribute("manga_name", mangaBean.getName());
                req.setAttribute("chapter_prev_id",mangaBean.getList().get(prev).getId());
                if(i == mangaBean.getList().size()-1)
                {
                    req.setAttribute("chapter_next_id",mangaBean.getList().get(i).getId());
                }
                else
                {
                    req.setAttribute("chapter_next_id",mangaBean.getList().get(next).getId());
                }
                flag = 1;
                System.out.println(mangaBean.getName());
                RequestDispatcher dispatcher = req.getRequestDispatcher("/reader.jsp");
                dispatcher.forward(req, resp);
                break;
            }
            if(i != 0) prev++;
            if(i != mangaBean.getList().size()) next++;
        }
        if (flag == 0){
            resp.sendRedirect("error?errorType=4");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
