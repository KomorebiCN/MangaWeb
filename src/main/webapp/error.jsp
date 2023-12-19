<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2023/12/4
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" import="java.io.*,java.util.*" %>
<html>
<head>
    <title>错误</title>
    <link rel="stylesheet" href="style.css">
    <script type="text/javascript" src="jquery-3.7.1.min.js"></script>
    <style>
        .box {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 350px;
            height: 200px;
            border-top: 1px solid rgba(255, 255, 255,0.5);
            border-left: 1px solid rgba(255, 255, 255,0.5);
            border-bottom: 1px solid rgba(255, 255, 255,0.2);
            border-right: 1px solid rgba(255, 255, 255,0.2);
            backdrop-filter: blur(10px) ;/*添加滤镜，实现毛玻璃效果*/
            background: rgba(50, 50, 50, 0.3);
            border-radius: 20px;
        }
        .box > p {
            font-size: 26px;
            color: rgba(255,255,255,0.8);
        }
        .box .btn-box {
            width: 250px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .box .btn-box > div {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: start;
            margin-top: 20px;
        }

        .box .btn-box > div > button {
            width: 80px;
            height: 35px;
            border: 1px solid rgba(117,151,188,0.5);
            background: rgba(117,151,188,0.5);
            color: rgba(255, 255, 255, 0.9);
            border-radius: 5px;
            transition: 0.2s;
        }

        .box .btn-box > div > button:nth-of-type(2) {
            margin-left: 10px;
        }

        .box .btn-box > div > button:hover {
            border: 1px solid rgba(89,79,140,0.5);
            background: rgba(89,79,140,0.5);
            cursor: pointer;
        }

    </style>
</head>
<body>
<div class="box">
    <%
        String msg = request.getParameter("errorType");
        String toUrl = null;
        if (msg.equals("1"))
        {
            toUrl="turnRegister()";
            out.print("<p>该账号已存在，注册失败</p>");
        }
        else if(msg.equals("2"))
        {
            toUrl="turnLogin()";
            out.print("<p>账号或密码错误</p>");
        }
        else if(msg.equals("0"))
        {
            toUrl="turnLogin()";
            out.print("<p>注册成功</p>");
        }
        else if(msg.equals("-1"))
        {
            toUrl="turnRegister()";
            out.print("<p>注册异常，请稍后重试</p>");
        }
        else if(msg.equals("3"))
        {
            toUrl="turnLogin()";
            out.print("<p>所找的漫画不存在</p>");
        }
        else if(msg.equals("4"))
        {
            toUrl="turnHome()";
            out.print("<p>所找的章节不存在</p>");
        }
    %>
    <div class="btn-box">
        <div>
            <button onclick="<%=toUrl%>">返回</button>
        </div>
    </div>
</div>
<script type="text/javascript">
    function turnRegister(){
        window.location = "register.jsp";
    }
    function turnLogin(){
        window.location = "index.jsp";
    }
    function turnHome(){
        window.location = "homepage.jsp";
    }
</script>
</body>
</html>
