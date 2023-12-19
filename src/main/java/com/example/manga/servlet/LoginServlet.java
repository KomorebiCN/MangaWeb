package com.example.manga.servlet;

import com.example.manga.bean.*;
import com.example.manga.service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user = req.getParameter("user");
        String pswd = req.getParameter("password");
        UserBean userBean = UserService.findUserByName(user);
        if (userBean!=null)
        {
            if(userBean.getPassword().equals(pswd))
            {
                HttpSession session = req.getSession();
                session.setAttribute("user",userBean);
                //ServletContext application = getServletContext();

                switch (userBean.getType())
                {
                    case 0://管理员
                    case 1://普通用户
                        resp.sendRedirect("./homepage");
                        break;
                    default:
                        resp.sendRedirect("index.jsp");
                        break;
                }
            }
            else
            {
                resp.sendRedirect("error.jsp?errorType=2");
            }
        }
        else
        {
            resp.sendRedirect("error.jsp?errorType=2");
        }
    }
}
