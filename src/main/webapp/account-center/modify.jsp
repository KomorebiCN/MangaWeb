
<%@ page import="com.example.manga.bean.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2023/12/5
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改</title>
    <script type="text/javascript" src="../jquery-3.7.1.min.js"></script>
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
            background: url("../image/background.jfif") center/cover;

        }

        .box > h2 {
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: 20px ;
        }


        .box .input-box {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: start;
            margin-bottom: 10px ;
        }

        .box .choice-box {
            width: 250px;
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

        .box .choice-box > label {
            margin-bottom: 5px ;
            color: rgba(255, 255, 255, 0.7);
            font-size: 13px;
        }

        .box .choice-box > input {
            box-sizing: border-box;
            color: rgba(255, 255, 255, 0.7);
            font-size: 14px;
            height: 10px;
            width: 250px;
            background: rgba(255, 255, 255, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.8);
            transition: 0.2s;/*变换的时间*/
            outline: none;/*轮廓*/
            padding: 0 10px;
            letter-spacing: 1px;
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

        .box .choice-box > div {
            justify-items: center;
        }

        .box .choice-box > div > span {
            font-size: 14px;
            position: relative;
            left: 10px;
            color: rgba(255, 255, 255, 0.7);
        }

        .box .input-box > input:focus {
            border: 1px solid rgba(0, 0, 0, 0.5);
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

        .box {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 350px;
            height: 560px;
            border-top: 1px solid rgba(255, 255, 255,0.5);
            border-left: 1px solid rgba(255, 255, 255,0.5);
            border-bottom: 1px solid rgba(255, 255, 255,0.2);
            border-right: 1px solid rgba(255, 255, 255,0.2);
            backdrop-filter: blur(10px) ;/*添加滤镜，实现毛玻璃效果*/
            background: rgba(50, 50, 50, 0.3);
            border-radius: 20px;
        }

        .box .btn-box {
            width: 250px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: start;
        }

        .box .btn-box > div {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: start;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<%
    UserBean userBean = (UserBean) request.getSession().getAttribute("user");
%>
<div class="box">
    <h2>Modify Self</h2>
    <div class="input-box">
        <label>账号</label>
        <input type="text" id="user" value="<%=userBean.getUser()%>"/>
    </div>
    <div class="input-box">
        <label>密码</label>
        <input type="text" id="password" value="<%=userBean.getPassword()%>"/>
    </div>
    <div class="input-box">
        <label>电子邮箱</label>
        <input type="text" id="email" value="<%=userBean.getEmail()%>"/>
    </div>
    <div class="choice-box">
        <label>性别</label>
        <div><input type="radio" name="sex" value="男" id="maleRadio" <%= userBean.getSex().equals("男") ? "checked":""%>/><span>男</span></div>
        <div><input type="radio" name="sex" value="女" id="femaleRadio"<%= userBean.getSex().equals("女") ? "checked":""%>/><span>女</span></div>
        <div><input type="radio" name="sex" value="无" id="noSexRadio"<%= userBean.getSex().equals("无") ? "checked":""%>/><span>无</span></div>

    </div>
    <div class="btn-box">
        <div>
            <button onclick="turnBack()">返回</button>
            <button id="submit">修改</button>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    function turnBack(){
        window.location = "${pageContext.request.contextPath}/account-center";
    }

    $(document).ready(function(){

        function Check(url,params){
            if(params["user"]==""){
                window.alert("账号不能为空");
            }
            else if (params["password"].length <6 || params["password"].length >15)
            {
                window.alert("密码长度应在6到15个字符之间");
            }
            else if (!/^.*[A-Za-z]{1,}.*$/.test(params["password"]))
            {
                window.alert("密码应包含至少一个字母");
            }
            else {
                if (params["email"]=="") {
                    window.alert("邮箱不能为空");
                } else if (!/\w+([+-.']\w)*@\w+([+-.']\w)*\.\w+([+-.']\w)*/.test(params["email"])) {
                    window.alert("邮箱填写错误");
                } else {
                    httpPost(url, params);
                }
            }
        }

        //发送POST请求跳转到指定页面
        function httpPost(url,params) {
            var loginForm = document.createElement("form"); //增加表单，隐藏方式
            loginForm.action = url;
            loginForm.method = "post";
            loginForm.style.display = "none"; //隐藏这个form

            //通过for..in来遍历params这个数组对象
            for(var key in params){
                var opt = document.createElement("input");
                opt.type = "text";
                opt.value = params[key];//虽然不知道为什么，但这里value得写在name前面才能提交成功
                opt.name = key;
                loginForm.appendChild(opt);
            }

            document.body.appendChild(loginForm);//把增加的这个form表单添加到body中
            // console.log(loginForm);
            loginForm.submit(); //提交表单
            return loginForm;
        }

        $("#submit").click(function(){
            //通过虚拟表单的形式提交post请求，从而实现页面的跳转
            var url = "${pageContext.request.contextPath}/modify";
            var sex = $("input[name='sex']:checked").val();
            var type = $("input[name='type']:checked").val();
            //设置往form表单中添的元素，name=value的方式
            var params = {
                "id":<%=userBean.getId()%>,
                "user":$("#user").val(),
                "password":$("#password").val(),
                "email":$("#email").val(),
                "sex":sex,
                "type":<%= userBean.getType()%>,
                "from":"${pageContext.request.contextPath}/account-center"
            }
            // console.log(params);

            //调用函数，发送post请求
            Check(url,params);
        });
    });
</script>
</html>
