package com.example.manga.filter;

import com.example.manga.bean.UserBean;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebFilter(urlPatterns = {"/account-center/*","/detail"})
public class UserFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        UserBean user = (UserBean) request.getSession().getAttribute("user");
        if(user == null)
        {
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }
        else
        {
            if(user.getType() == 1 || user.getType() == 0)
            {
                filterChain.doFilter(servletRequest,servletResponse);
            }
            else
            {
                response.sendRedirect("../index.jsp");
            }
        }
    }
}