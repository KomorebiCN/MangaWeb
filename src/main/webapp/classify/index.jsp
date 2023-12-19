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

        .user-head-icon > img {
            width: 56px;
            height: 56px;

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
            width: 180px;
            box-sizing: border-box;
            display: inline-block;
            vertical-align: top;
            margin-right: 16px;
            margin-bottom: 24px;
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

        .styles {
            display: flex;
            line-height: 2;
            margin: 24px 0;
            user-select: none;
            width: 100%;
        }

        .tagContainer {
            font-size: 14px;
            margin-bottom: 10px;
            white-space: nowrap;
            line-height: 2;
            user-select: none;
        }

        .tag {
            border-radius: 5px;
            color: rgba(0,0,0,.87);
            margin: 0 4px;
            padding: 0 10px;
            cursor: pointer;
            display: inline-block;
            vertical-align: middle;
            transition: all .2s;
            white-space: normal;
        }

        .tag:hover {
            background-color: #32aaff;
            color: #fff!important;
        }

        .list {
            display: flex;
            width: 100%;
        }

    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-3.7.1.min.js"></script>
    <%
        List<MangaBean> list = (List<MangaBean>) request.getAttribute("list");
        int type = (int) request.getAttribute("tagChoose");
    %>
    <title>漫画分类-全部</title>
</head>
<body>
<div class="nav">
    <ul>
        <li><a href="${pageContext.request.contextPath}/homepage"><i class="iconfont">&#xe61f;</i>主页</a></li>
        <li><a href="${pageContext.request.contextPath}/classify" style="color: rgba(70, 100, 180,0.8);"><i class="iconfont">&#xe600;</i>分类</a></li>
        <li><a href="${pageContext.request.contextPath}/account-center" ><i class="iconfont">&#xe657;</i>个人</a></li>
    </ul>
</div>
<div class="container">
    <section class="styles">
        <div class="tagContainer">
            <div class="tag" style="<%= type== -1 ? "color: rgba(50,170,255,1);":""%>" data-type = "-1">全部</div>
            <div class="tag" style="<%= type== 1 ? "color: rgba(50,170,255,1);":""%>" data-type = "1">都市</div>
            <div class="tag" style="<%= type== 2 ? "color: rgba(50,170,255,1);":""%>" data-type = "2">校园</div>
            <div class="tag" style="<%= type== 3 ? "color: rgba(50,170,255,1);":""%>" data-type = "3">穿越</div>
            <div class="tag" style="<%= type== 4 ? "color: rgba(50,170,255,1);":""%>" data-type = "4">奇幻</div>
            <div class="tag" style="<%= type== 5 ? "color: rgba(50,170,255,1);":""%>" data-type = "5">热血</div>
        </div>
    </section>
    <div class="list">
        <%
            for (int i = 0; i < list.size(); i++) {
        %>
        <div class="manga-card">
            <div class="manga-post">
                <a href="${pageContext.request.contextPath}/detail?manga_id=<%= list.get(i).getId()%>">
                    <div class="post-box">
                        <div class="post" style="background: url('${pageContext.request.contextPath}/detail/mc<%= list.get(i).getId()%>/post.jpg') no-repeat center/cover">
                        </div>
                    </div>
                </a>
            </div>
            <div class="text-info">
                <a href="${pageContext.request.contextPath}/detail?manga_id=<%= list.get(i).getId()%>">
                    <div class="manga-title"><%= list.get(i).getName()%></div>
                    <div class="chapters">已更新<%= list.get(i).getList().size()%>话</div>
                </a>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function (){
        $(".tag").click(function (){
            let type = $(this).data("type");
            window.location.href = "${pageContext.request.contextPath}/classify?category="+type;
        });
    });
</script>
</html>
