<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2023/12/4
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url(image/background.jfif) no-repeat center/cover;
        }

        .box > h2 {
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: 20px ;
        }

        .box {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 350px;
            height: 380px;
            border-top: 1px solid rgba(255, 255, 255,0.5);
            border-left: 1px solid rgba(255, 255, 255,0.5);
            border-bottom: 1px solid rgba(255, 255, 255,0.2);
            border-right: 1px solid rgba(255, 255, 255,0.2);
            backdrop-filter: blur(10px) ;/*添加滤镜，实现毛玻璃效果*/
            background: rgba(50, 50, 50, 0.3);
            border-radius: 20px;
        }

        .box .input-box {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: start;
            margin-bottom: 10px ;
        }

        .box .input-box > label {
            margin-bottom: 5px ;
            color: rgba(255, 255, 255, 0.7);
            font-size: 13px;
        }

        .box .input-box > input {
            box-sizing: border-box;
            color: rgba(255, 255, 255, 0.7);
            font-size: 14px;
            height: 35px;
            width: 250px;
            background: rgba(255, 255, 255, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.8);
            border-radius: 5px;
            transition: 0.2s;/*变换的时间*/
            outline: none;/*轮廓*/
            padding: 0 10px;
            letter-spacing: 1px;
        }

        .box .input-box > input:focus {
            border: 1px solid rgba(0, 0, 0, 0.5);
        }

        .box .btn-box {
            width: 250px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: start;
        }

        .box .btn-box > a {
            font-size: 13px;
            text-decoration: none;
            color: rgba(255, 255, 255, 0.5);
            transition: 0.2s;
            width: 250px;
            text-align: end;
        }

        .box .btn-box > a:hover {
            color: rgba(0, 0, 0,0.5)
        }

        .box .btn-box > div {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: start;
            margin-top: 20px;
        }

        .box .btn-box > div > button {
            width: 120px;
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
    <script type="text/javascript" src="jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="index.js"></script>
</head>
<%
    request.getSession().invalidate();
%>
<body>
<div class="box">
    <h2>Login</h2>
    <div class="input-box">
        <label>账号</label>
        <input type="text" id="user"/>
    </div>
    <div class="input-box">
        <label>密码</label>
        <input type="password" id="password"/>
    </div>
    <div class="btn-box">
        <a href="${pageContext.request.contextPath}/homepage">游客登录</a>
        <div>
            <button id="submit">登录</button>
            <button onclick="turnRegister()">注册</button>
        </div>
    </div>
</div>
<script type="text/javascript">
    function turnRegister(){
        window.location = "register.jsp";
    }
</script>
</body>
</html>
