<%@ page import="com.example.manga.bean.UserBean" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.manga.bean.MangaBean" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2023/12/3
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <style>
        @font-face {
            font-family: 'iconfont';  /* Project id 4351043 */
            src: url('//at.alicdn.com/t/c/font_4351043_owk2obwc9en.woff2?t=1701230511751') format('woff2'),
            url('//at.alicdn.com/t/c/font_4351043_owk2obwc9en.woff?t=1701230511751') format('woff'),
            url('//at.alicdn.com/t/c/font_4351043_owk2obwc9en.ttf?t=1701230511751') format('truetype');
        }

        .iconfont{
            font-family:"iconfont" !important;
            font-size:16px;font-style:normal;
            -webkit-font-smoothing: antialiased;
            -webkit-text-stroke-width: 0.2px;
            -moz-osx-font-smoothing: grayscale;
        }

        *{
            list-style: none;
            padding: 0;
            margin: 0;
            text-decoration: none;
        }

        body{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: rgba(250,250,250,1);
        }

        .nav{
            z-index: 2;
            width: 100%;
            height: 35px;
            position: fixed;
            top: 0;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.5);
            /*border-radius: 10px;*/
            backdrop-filter: blur(10px) ;
            background: rgba(255,255,255,0.5);
            padding: 10px;
        }
        .nav ul{
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            right: 5%;
        }
        .nav ul .nav-box{
            position: absolute;
            bottom: 0;
            left: 0;
            /* 如果导航栏就六个导航，那么每个导航的宽度都是整个导航
            的六分之一 */
            width: calc((100% / 4)*1);
            height: 10px;
            border-radius: 2px;
            transition: .5s;
        }
        .nav ul li{
            width: 100%;
            text-align: center;
        }

        .nav ul li i {
            font-size: 25px;
        }

        .nav ul li a{
            color: rgba(0,0,0,0.8);
            font: 100 25px '优设标题黑';
            display: block;
            width: 100%;
            height: 100%;
            line-height: 70px;
            transition: 0.2s;
        }

        .nav ul li a:hover {
            color: rgba(70, 100, 180,0.8);
        }

        .container {
            z-index: 1;
            display: flex;
            flex-direction: column;
            position: relative;
            margin: 70px auto 60px;
            align-items: center;
            width: 1160px;
            height: auto;
            background: rgba(250,250,250,0.9);
            backdrop-filter: blur(20px);
        }

        .account-info {
            width: 1000px;
            /*min-height: 360px;*/
            background: rgba(255,255,255,1);
            padding: 40px;
            box-sizing: border-box;
        }

        .page-title {
            color: #2e2e2e;
            font-size: 24px;
            font-weight: 400;
            height: 26px;
            letter-spacing: 0;
            line-height: 26px;
            margin: 0;
            box-sizing: border-box;
        }

        .user-head-box {
            justify-content: space-between;
            display: flex;
        }

        .user-head-icon {
            float: left;
            height: 56px;
            width: 56px;
            display: inline-block;
        }

        .user-head-icon > img {
            width: 56px;
            height: 56px;

        }

        .user-side {
            margin-left: 16px;
            display: inline-block;
        }

        .user-info {
            margin-top: 30px;
        }

        .userName {
            font-size: 18px;
            height: 24px;
            margin-right: 12px;
            color: rgba(0,0,0,.87);
            display: block;
        }

        .uid {
            color: rgba(0,0,0,.34);
            display: block;
            font-size: 12px;
            height: 16px;
            margin-top: 10px;
        }

        .favourite {
            margin-top: 12px;
            width: 1000px;
            /*min-height: 360px;*/
            background: rgba(255,255,255,1);
            padding: 40px;
            box-sizing: border-box;
            /*min-height: 960px;*/
        }

        .btn-box {
            margin-top: 12px;
            padding: 0 30px;
            display: flex;
            justify-content: space-between;
        }

        .btn-box > button {
            border: 1px solid rgba(0,0,0,.12);
            font-size: 12px;
            height: 30px;
            line-height: 10px;
            width: 130px;
            background-color: #fff;
            color: rgba(0,0,0,.7);
            border-radius: 3px;
            box-sizing: border-box;
            cursor: pointer;
        }

        .btn-box > button:hover {
            color: rgb(0,0,0);
            background-color: rgb(237,250,255);
        }

        .manga-card {
            width: 150px;
            box-sizing: border-box;
            display: inline-block;
            vertical-align: top;
            margin: 12px;
        }


        .manga-post {
        }

        .manga-post > a {
            color: #32aaff;
            text-decoration: none;
        }

        .post-box {
            background-color: #e7e7e7;
            border-radius: 2px;
            margin-bottom: 6px;
            padding-top: 133.33333333333334%;
            width: 100%;
            background-size: cover;
            position: relative;
        }

        .post {
            height: 100%;
            left: 0;
            position: absolute;
            top: 0;
            width: 100%;
        }

        .manga-title {
            color: rgba(0,0,0,.87);
            font-size: 14px;
            margin-bottom: 2px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .chapters {
            color: rgba(0,0,0,.34);
            font-size: 12px;
            text-overflow: ellipsis;
        }

        a {
            cursor: pointer;
        }

        .section-title {
            margin-bottom: 12px;
            box-sizing: border-box;
        }

    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-3.7.1.min.js"></script>
    <title>个人中心-账户信息</title>
</head>
<body>
<div class="nav">
    <ul>
        <li><a href="${pageContext.request.contextPath}/homepage"><i class="iconfont">&#xe61f;</i>主页</a></li>
<%--        <li><a href="${pageContext.request.contextPath}/account-center/my-favourite.jsp"><i class="iconfont">&#xe666;</i>追漫</a></li>--%>
        <li><a href="${pageContext.request.contextPath}/classify"><i class="iconfont">&#xe600;</i>分类</a></li>
        <li><a href="${pageContext.request.contextPath}/account-center" style="color: rgba(70, 100, 180,0.8);"><i class="iconfont">&#xe657;</i>个人</a></li>
    </ul>
</div>
<%
    UserBean user = (UserBean) request.getSession().getAttribute("user");
    List<MangaBean> mangaBeans = (List<MangaBean>) request.getAttribute("mangaBeans");
%>
<div class="container">
    <div class="account-info">
        <h1 class="page-title">账户信息</h1>
        <div class="user-info">
            <div class="user-head-box">
                <div class="user-head-icon">
                    <img src="${pageContext.request.contextPath}/account-center/user_head.png">
                </div>
                <div class="user-side">
                    <span class="userName"><%= user.getUser()%></span>
                    <span class="uid">UID: <%= user.getId()%></span>
                </div>

                <div class="user-side">
                    <span class="userName">性别</span>
                    <span class="uid"><%= user.getSex()%></span>
                </div>

                <div class="user-side">
                    <span class="userName">邮箱</span>
                    <span class="uid"><%= user.getEmail()%></span>
                </div>

                <div class="user-side">
                    <span class="userName">注册时间</span>
                    <span class="uid"><%= user.getDate()%></span>
                </div>
            </div>
        </div>
        <div class="btn-box">
            <button id="modify" class="modify">修改</button>
            <button id="admin" class="admin" <%= user.getType()==0 ? "":"style='display: none'"%>>后台</button>
        </div>
    </div>
    <div class="favourite">
        <div class="section-title">
            <h1 class="page-title">我的追漫</h1>
        </div>
        <div class="collect">
            <%
                for (int i = 0; i < mangaBeans.size(); i++) {
            %>
            <div class="manga-card">
                <div class="manga-post">
                    <a href="${pageContext.request.contextPath}/detail?manga_id=<%= mangaBeans.get(i).getId()%>">
                        <div class="post-box">
                            <div class="post" style="background: url('${pageContext.request.contextPath}/detail/mc<%= mangaBeans.get(i).getId()%>/post.jpg') no-repeat center/cover">
                            </div>
                        </div>
                    </a>
                </div>
                <div class="text-info">
                    <a href="${pageContext.request.contextPath}/detail?manga_id=<%= mangaBeans.get(i).getId()%>">
                        <div class="manga-title"><%= mangaBeans.get(i).getName()%></div>
                        <div class="chapters">已更新<%= mangaBeans.get(i).getList().size()%>话</div>
                    </a>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function (){
        $("#modify").click(function (){
            window.location.href="${pageContext.request.contextPath}/account-center/modify.jsp";
        });

        $("#admin").click(function (){
            window.location.href="${pageContext.request.contextPath}/admin/page";
        });

    });
</script>
</html>
