<%@ page import="com.example.manga.bean.ChapterBean" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2023/12/3
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%
        int manga_id = (int) request.getAttribute("manga_id");
        String manga_name = (String) request.getAttribute("manga_name");
        ChapterBean chapterBean = (ChapterBean) request.getAttribute("chapterBean");
        int chapter_prev_id = (int) request.getAttribute("chapter_prev_id");
        int chapter_next_id = (int) request.getAttribute("chapter_next_id");
    %>
    <title><%= manga_name%> 第<%= chapterBean.getNth()%>话</title>
    <script type="text/javascript" src="jquery-3.7.1.min.js"></script>
    <style>
        * {
            border: 0;
            margin: 0;
        }

        body {
            background: rgba(0,0,0,0.7);
        }

        .manga_container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        img {
            width: 60%;
        }

        .btn-box {
            position: fixed;
            display: flex;
            justify-content: space-between;
            bottom: 0;
            width: 100%;
            padding: 45px 90px;
            box-sizing: border-box;
        }

        .btn-next , .btn-prev {
            position: relative;
            border-radius: 40px;
            padding: 5px 16px;
            width: 100px;
            background-color: rgba(0,0,0,.95);
            border: 1px solid #3e3e3e;
            color: hsla(0,0%,100%,.7);
            font-size: 12px;
            cursor: pointer;
            transform-origin: center center;
            font-family: inherit;
            transition: 0.1s;
        }

        .btn-next:hover , .btn-prev:hover {
            color: hsla(0,0%,100%,1);
        }

        img {
            min-height: 100px;
            min-width: 100px;
        }

    </style>
</head>
<body>
<div class="manga_container">
    <img src="./mc<%= manga_id%>/<%=chapterBean.getId()%>/<%= 0%>.jpg">
    <img src="./mc<%= manga_id%>/<%=chapterBean.getId()%>/<%= 1%>.jpg">
    <%
        for (int i = 2; i < chapterBean.getPageNum(); i++) {
    %>
    <img data-src="./mc<%= manga_id%>/<%=chapterBean.getId()%>/<%= i%>.jpg">
    <%
        }
    %>
</div>
<div class="btn-box">
    <button id="prev" class="btn-prev" <%= chapter_prev_id == chapterBean.getId()? "disabled":""%>>上一话</button>
    <button id="next" class="btn-next" <%= chapter_next_id == chapterBean.getId()? "disabled":""%>>下一话</button>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function (){
        $("#prev").click(function (){
            window.location.href = "${pageContext.request.contextPath}/reader?manga_id=<%= manga_id%>&chapter_id=<%= chapter_prev_id%>";
        });
        $("#next").click(function (){
            window.location.href = "${pageContext.request.contextPath}/reader?manga_id=<%= manga_id%>&chapter_id=<%= chapter_next_id%>";
        });
        var imgs = $("img");
        $(window).scroll(function (){
            var scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
            var winHeight= window.innerHeight;
            for(var i=2;i < imgs.length;i++){
                if(imgs[i].offsetTop - 2000 < scrollTop + winHeight ){
                    imgs[i].src = imgs[i].getAttribute('data-src');
                }
            }
            console.log(scrollTop,winHeight);
        });

    });
</script>
</html>
