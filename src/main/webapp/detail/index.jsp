<%@ page import="com.example.manga.bean.MangaBean" %>
<%@ page import="com.example.manga.bean.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2023/12/3
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery-3.7.1.min.js"></script>
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


        body{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: white no-repeat center/cover;

        }

        *{
            list-style: none;
            padding: 0;
            margin: 0;
            text-decoration: none;
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
            display: block;
            position: relative;
            margin: 70px auto 60px;
            width: 1160px;
            height: auto;
            background: rgba(250,250,250,0.9);
            backdrop-filter: blur(20px);
        }

        .detail-header {
            background: rgba(255,255,255,0.7);
            box-shadow: 0 1px 3px 0 rgba(106,115,133,.08) ;
            padding: 20px;
            white-space: nowrap;
            display: flex;
        }

        .manga-post-box {
            height: 320px;
            width: 240px;
            display: block;
            background-size: cover;
            background: #fafafa 50%;
            vertical-align: top;
        }

        .manga-post-box > img {
            width: 100%;
            overflow-clip-margin: content-box;
            overflow: clip;
        }

        .manga-info {
            min-height: 320px;
            padding-left: 28px;
            width: calc(100% - 240px);
            box-sizing: border-box;
            display: inline-block;
            vertical-align: top;
        }

        .manga-info > h1 {
            color: rgba(0,0,0,.87);
            font-size: 28px;
            font-weight: 400;
            margin: 0 0 11px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            display: block;
            margin-block-start: 0.67em;
            margin-block-end: 0.67em;
            margin-inline-start: 0;
            margin-inline-end: 0;
        }

        .manga-info > h2 {
            color: rgba(0,0,0,.56);
            font-size: 16px;
            font-weight: 400;
            margin: 0;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            display: block;
            margin-block-start: 0.83em;
            margin-block-end: 0.83em;
            margin-inline-start: 0;
            margin-inline-end: 0;
        }

        .last-update {
            display: block;
            color: rgba(0,0,0,.34);
            font-size: 14px;
            line-height: 2;
            margin-top: 14px;
            white-space: nowrap;
        }

        .last-update > img {
            height: 16px;
            margin-right: 8px;
            width: 16px;
            vertical-align: middle;
            overflow-clip-margin: content-box;
            overflow: clip;
            color: rgba(0,0,0,.34);
            font-size: 14px;
            line-height: 2;
            white-space: nowrap;
        }

        .last-update > span {
            vertical-align: middle;
            color: rgba(0,0,0,.34);
            font-size: 14px;
            line-height: 2;
            margin-top: 14px;
            white-space: nowrap;
        }

        .introduction-box {
            height: 76px;
            overflow: hidden;
            position: relative;
            display: block;
            color: rgba(0,0,0,.56);
            font-size: 14px;
            margin-top: 8px;
            white-space: normal;
        }

        .button-box {
            margin-top: 21px;
            position: relative;
            display: block;
            white-space: nowrap;
        }

        .begin-read {
            font-size: 16px;
            height: 44px;
            margin-right: 16px;
            width: 200px;
            background-color: #3af;
            color: #fff;
            box-sizing: border-box;
            cursor: pointer;
            padding: 10px 20px;
            vertical-align: middle;
            font-family: inherit;
            outline: none;
            white-space: nowrap;
            border-radius: 3px;
            border: 1px solid transparent;
        }

        .begin-read:hover {
            background: rgb(20,157,255);
        }

        .do-favourite {
            border: 1px solid rgba(0,0,0,.12);
            font-size: 16px;
            height: 44px;
            line-height: 22px;
            width: 144px;
            background-color: #fff;
            color: rgba(0,0,0,.7);
            border-radius: 3px;
            box-sizing: border-box;
            cursor: pointer;
            padding: 10px 20px;
            overflow: hidden;
            vertical-align: middle;
            font-family: inherit;
            outline: none;
        }

        .do-favourite > img {
            cursor: pointer;
            font-family: inherit;
        }

        .section-list {
            box-shadow: 0 0 3px 0 rgba(106,115,133,.08);
            box-sizing: border-box;
            background: #fff;
            padding: 20px;
            display: block;
        }

        .section-title {
            align-items: center;
            color: rgba(0,0,0,.87);
            display: flex;
            font-size: 24px;
            height: 30px;
        }

        .heading {
            color: rgba(0,0,0,.87);
            font-size: 24px;
        }

        .episode-list {
            margin-top: 20px;
            display: block;
        }

        .chapters {
            display: flex;
            flex-flow: row wrap;
            margin-top: 12px;
        }

        .items {
            align-items: center;
            border: 1px solid rgba(0, 0, 0, .12);
            border-radius: 3px;
            box-sizing: border-box;
            color: rgba(0,0,0,.87);
            display: flex;
            font-size: 14px;
            height: 42px;
            line-height: 1.5;
            margin-bottom: 16px;
            margin-right: 16px;
            overflow: visible;
            padding: 0 12px;
            position: relative;
            text-align: center;
            width: 23%;
            background-color: initial;
            cursor: pointer;
            transform-origin: center center;
            font-family: inherit;
            outline: none;
        }

        .short-title {
            opacity: .8;
            text-overflow: ellipsis;
            color: rgba(0,0,0,.87);
            font-size: 14px;
            line-height: 1.5;
            text-align: center;
        }

        button:hover {
            background-color: rgb(237,250,255);
        }
    </style>
    <title>漫画详情</title>
</head>
<body>
<%
    UserBean user = (UserBean) request.getSession().getAttribute("user");
    MangaBean mangaBean = (MangaBean) request.getAttribute("mangaBean");
    boolean ifCollected = (boolean) request.getAttribute("ifCollected");
%>
<div class="nav">
    <ul>
        <li><a href="${pageContext.request.contextPath}/homepage"><i class="iconfont">&#xe61f;</i>主页</a></li>
<%--        <li><a href="${pageContext.request.contextPath}/account-center/my-favourite.jsp"><i class="iconfont">&#xe666;</i>追漫</a></li>--%>
        <li><a href="${pageContext.request.contextPath}/classify"><i class="iconfont">&#xe600;</i>分类</a></li>
        <li><a href="${pageContext.request.contextPath}/account-center"><i class="iconfont">&#xe657;</i>个人</a></li>
    </ul>
</div>
<div class="container">
    <div class="detail-header">
        <div class="manga-post-box">
            <img src="./detail/mc<%= mangaBean.getId()%>/post.jpg">
        </div>
        <div class="manga-info" data-id="<%= mangaBean.getId()%>">
            <h1><%= mangaBean.getName()%></h1>
            <h2><%= mangaBean.getAuthor()%></h2>
            <div class="last-update">
                <img src="${pageContext.request.contextPath}/detail/planet.png"><span>已更新<%= mangaBean.getList().size()%>话</span>
            </div>
            <div class="introduction-box">
                <div class="introduction-text">
                    <%= mangaBean.getIntroduction()%>
                </div>
            </div>
            <div class="button-box">
                <button class="begin-read">开始阅读</button>
                <button id="doFavourite" class="do-favourite">
                    <div>
                        <img src=""><span><%= ifCollected ? "已追":"追漫"%></span>
                    </div>
                </button>
            </div>
        </div>
    </div>
    <div class="section-list">
        <div class="section-title">
            <div class="heading">章节列表</div>
        </div>
        <div class="episode-list">
            <div class="chapters">
                <%
                    for(int i=1;i <= mangaBean.getList().size();i++)
                    {
                %>
                <button class="items" data-id="<%= mangaBean.getList().get(i-1).getId()%>"><div class="short-title">
                    第<%= mangaBean.getList().get(i-1).getNth()%>话</div>
                </button>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function (){
        $(".items").click(function (){
            var chapterId = $(this).data('id');
            var mangaId = <%= mangaBean.getId()%>;
            window.location.href = "${pageContext.request.contextPath}/reader?manga_id="+mangaId+"&chapter_id="+chapterId;
        });

        $(".begin-read").click(function (){
            var chapterId = <%= mangaBean.getList().get(0).getId()%>;
            var mangaId = <%= mangaBean.getId()%>;
            window.location.href = "${pageContext.request.contextPath}/reader?manga_id="+mangaId+"&chapter_id="+chapterId;
        })

        function httpPost(url,params) {
            var modifyForm = document.createElement("form");
            modifyForm.action = url;
            modifyForm.method = "post";
            modifyForm.style.display = "none";
            for(var key in params){
                var opt = document.createElement("input");
                opt.type = "text";
                opt.value = params[key];//虽然不知道为什么，但这里value得写在name前面才能提交成功
                opt.name = key;
                modifyForm.appendChild(opt);
            }

            document.body.appendChild(modifyForm);
            modifyForm.submit();
            return modifyForm;
        }

        $("#doFavourite").click(function(){
            var url = "detail";
            var params = {
                "user_id":"<%= user.getId()%>",
                "manga_id":"<%= mangaBean.getId()%>",
                "action":"<%= ifCollected? "delete":"add"%>"
            }
            httpPost(url,params);
        });


    });
</script>
</html>
