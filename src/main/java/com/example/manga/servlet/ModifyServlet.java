package com.example.manga.servlet;

import com.example.manga.bean.UserBean;
import com.example.manga.service.AdminService;
import com.example.manga.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(urlPatterns = {"/admin/modify","/modify"})
public class ModifyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String user = req.getParameter("user");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String sex = req.getParameter("sex");
        String from = req.getParameter("from");
        int type = Integer.parseInt(req.getParameter("type"));

        UserBean userBean = new UserBean(id,user,password,email,sex,type,null);
        if(AdminService.ModifyUser(userBean)>0)
        {
            HttpSession session = req.getSession();

            UserBean account = (UserBean) session.getAttribute("user");
            if(account.getId() == userBean.getId())
            {
                session.setAttribute("user", UserService.findUserById(userBean.getId()));
            }//对自己的账户修改后，在页面上一并修改自己的登录信息

            resp.sendRedirect(from);
        }
        else
        {
            resp.sendRedirect("error.jsp?errorType=1");
        }
    }
}
