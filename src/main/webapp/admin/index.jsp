<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.example.manga.bean.PageBean" %>
<%@ page import="com.example.manga.bean.UserBean" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2023/12/4
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="../jquery-3.7.1.min.js"></script>
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
            box-sizing: border-box;
        }

        body{
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url("../image/background.jfif") center/cover;
        }

        .nav{
            z-index: 2;
            width: 100%;
            height: 35px;
            box-sizing: content-box;
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

        main.table {
            width: 82vw;
            height: 86vh;
            background-color: #fff5;
            box-shadow: 0 8px #0005;
            border-radius: 16px;
            overflow: hidden;
        }

        .header {
            width: 100%;
            height: 10%;
            background-color: #fff5;
            padding: 0 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header .input-group {
            width: 35%;
            height: 50%;
            background-color: #fff5;
            padding: 0 20px;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: 0.2s;
        }

        .header .input-group:hover {
            width: 45%;
            background-color: #fff8;
            box-shadow: 0 5px 40px #0002;
        }

        .header .input-group .searchBtn {
            width: 100%;
            background-color: transparent;
            border: none;
            outline: none;
        }

        .shell {
            width: 95%;
            max-height: calc(90% - 25px);
            background-color: #fffb;
            margin: 8px auto;
            border-radius: 10px;
            overflow: auto;
        }

        table {
            width: 100%;
        }

        td {
            width: 36px;
            height: 36px;
            margin-right: 10px;
            border-radius: 5%;
            vertical-align: middle;
        }

        table,th,td {
            border-collapse: collapse;
            padding: 5px;
            text-align: center;
        }

        thead th {
            position: sticky;
            top: 0;
            left: 0;
            background-color: rgb(153, 152, 157);
            cursor: pointer;
        }

        tbody tr:nth-child(even) {
            background-color: #0000000b;
        }

        tbody tr:hover {
            background-color: #fff6 !important;
        }

        p {
            padding: 5px 0;
            border-radius: 10px;
            text-align: center;
            cursor: pointer;
        }

        tr p {
            background-color: #86e49d;
            color: #006b21;
        }

        .btn-box {
            width: 250px;
            display: flex;
            justify-content: center;
            align-items: start;
        }

        .btn-box > .pageButton {
            width: 50px;
            height: 35px;
            border: 1px solid rgba(117,151,188,0.5);
            background: rgba(117,151,188,0.5);
            color: rgba(255, 255, 255, 0.9);
            border-radius: 5px;
            transition: 0.2s;
        }

        .btn-box > .pageButton:hover {
            border: 1px solid rgba(89,79,140,0.5);
            background: rgba(89,79,140,0.5);
            cursor: pointer;
        }

    </style>
    <title>管理员后台</title>
</head>
<body>
<div class="nav">
    <ul>
        <li><a href="${pageContext.request.contextPath}/homepage"><i class="iconfont">&#xe61f;</i>主页</a></li>
<%--        <li><a href="${pageContext.request.contextPath}/account-center/my-favourite.jsp"><i class="iconfont">&#xe666;</i>追漫</a></li>--%>
        <li><a href="${pageContext.request.contextPath}/classify"><i class="iconfont">&#xe600;</i>分类</a></li>
        <li><a href="${pageContext.request.contextPath}/account-center"><i class="iconfont">&#xe657;</i>个人</a></li>
    </ul>
</div>
<%
    Gson gson = new Gson();
    String pageBeanJson = (String) request.getAttribute("pageBean");
    String searchContent = (String) request.getAttribute("searchContent");
    if(searchContent == null)
    {
        searchContent = "";
    }
    PageBean pageBean = gson.fromJson(pageBeanJson,PageBean.class);
    List<UserBean> list = pageBean.getList();
%>
<main class="table">
    <section class="header">
        <h1>用户管理</h1>
        <div class="input-group">
            <input id="searchContent" class="searchBtn" type="search" placeholder="通过用户名搜索..." value="<%= searchContent %>">
        </div>
        <div class="btn-box">
            <input type="button" class="pageButton" id="prev" value="上一页">
            <input type="button" class="pageButton" id="next" value="下一页">
        </div>
        <div class="btn-box">
            <input type="button" class="pageButton" style="width: 67px;" id="addUser" value="添加用户">
        </div>
    </section>
    <section class="shell">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>用户名</th>
<%--                <th>密码</th>--%>
                <th>性别</th>
                <th>电子邮箱</th>
                <th>注册日期</th>
                <th>类型</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <%
                for(int i = 0;i < list.size();i++){
            %>
            <tr>
                <td>
                    <%=list.get(i).getId()%>
                </td>
                <td>
                    <%=list.get(i).getUser()%>
                </td>
<%--                <td>--%>
<%--                    <%=list.get(i).getPassword()%>--%>
<%--                </td>--%>
                <td>
                    <%=list.get(i).getSex()%>
                </td>
                <td>
                    <%=list.get(i).getEmail()%>
                </td>
                <td>
                    <%=list.get(i).getDate()%>
                </td>
                <td>
                    <%=list.get(i).getType()==1 ? "普通":"管理员"%>
                </td>
                <td>
                    <p class="deleteButton" data-id = "<%=list.get(i).getId()%>">
                        删除
                    </p>
                    <p class="modifyButton" data-id = "<%=list.get(i).getId()%>">
                        编辑
                    </p>
                </td>
            </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </section>
</main>
</body>
<script type="text/javascript">
    $(document).ready(function(){

        console.log("<%= searchContent %>");

        //发送POST请求跳转到指定页面
        function httpPost(url,params) {
            var pageForm = document.createElement("form"); //增加表单，隐藏方式
            pageForm.action = url;
            pageForm.method = "post";
            pageForm.style.display = "none";
            for(var key in params){
                var opt = document.createElement("input");
                opt.type = "text";
                opt.value = params[key];//虽然不知道为什么，但这里value得写在name前面才能提交成功
                opt.name = key;
                pageForm.appendChild(opt);
            }

            document.body.appendChild(pageForm);//把增加的这个form表单添加到body中
            pageForm.submit(); //提交表单
            return pageForm;
        }

        $("#searchContent").on("keyup", function(event) {//使用keyup的原因是在回车弹起时进行搜索而不是一按就立即搜索
            if (event.keyCode === 13) {//回车是13
                var url = "page";
                var params = {
                    "currentPage":<%=pageBean.getCurrentPage()%>,
                    "pageSize":<%=pageBean.getPageSize()%>
                }
                var searchContent = $("#searchContent").val()
                if(searchContent !== "")
                {
                    params["searchContent"] = searchContent;
                }
                httpPost(url,params);
            }
        })

        $(".deleteButton").click(function(){
            var url = "delete";
            var id = $(this).data("id");
            var params = {
                "id":id
            }
            if(confirm("确认要删除id为"+id+"的账号吗？"))
            {
                httpPost(url,params);
            }
        })

        $(".modifyButton").click(function(){
            var url = "toModify";
            var id = $(this).data("id");
            var params = {
                "id":id
            }
            httpPost(url,params);
        })

        $("#addUser").click(function (){
            window.location.href = "add.jsp";//这里不能用原生JS的跳转方式，真实醉了，debug了好久
        });

        $("#next").click(function(){
            var url = "page";
            var params = {
                "currentPage":<%=pageBean.getNext()%>,
                "pageSize":<%=pageBean.getPageSize()%>
            }
            var searchContent = $("#searchContent").val()
            if(searchContent !== "")
            {
                params["searchContent"] = searchContent;
            }
            httpPost(url,params);
        })

        $("#prev").click(function(){
            var url = "page";
            var params = {
                "currentPage":<%=pageBean.getPrev()%>,
                "pageSize":<%=pageBean.getPageSize()%>
            }
            var searchContent = $("#searchContent").val()
            console.log(searchContent);
            if(searchContent !== "")
            {
                params["searchContent"] = searchContent;
            }

            httpPost(url,params);
        })});
</script>
</html>
