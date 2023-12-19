<%@ page import="java.util.List" %>
<%@ page import="com.example.manga.bean.MangaBean" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2023/12/4
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="jquery-3.7.1.min.js"></script>
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
            background: rgb(250,250,250) center/cover;
        }

        .nav{
            width: 100%;
            height: 35px;
            position: fixed;
            top: 0;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.5);
            /*border-radius: 10px;*/
            backdrop-filter: blur(10px) ;
            background: rgba(255,255,255,0.5);
            padding: 10px;
            z-index: 2;
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


        /* 轮播图主体 */
        .swipe{
            /* 相对定位 */
            position: relative;
            margin-top:56px;
            width: 100%;
            z-index: 1;
            /* 溢出隐藏 */
            overflow: hidden;
        }
        /* 模糊背景 */
        .swipe .bg{
            /* 绝对定位 */
            position: absolute;
            top:0;
            width: 500%;
            height: 100%;
            z-index: 1;
            background-image: url("image/background.jfif");
            background-size: 6000px;
            background-position: center center;
            /* 模糊滤镜 */
            filter: blur(140px);
        }
        /* 图片区域 */
        .swipe section{
            position: relative;
            z-index: 2;
            width: 100%;
            max-width: 1500px;
            height: 600px;
            /* 居中 */
            margin: 0 0;
        }
        /* 图片盒子 */
        .swipe .img-box{
            width: 100%;
            height: 100%;
        }
        /* 图片 */
        .swipe .img-box .img{
            width: 100%;
            height: 100%;
            /* 保持原有尺寸比例, 裁切长边 */
            object-fit: cover;
            max-width: 100%;   /* 图片最大宽度为容器宽度 */
            max-height: 100%;  /* 图片最大高度为容器高度 */
        }
        /* 指示器 */
        .swipe .select{
            position: absolute;
            width: 100%;
            height: 30px;
            line-height: 30px;
            bottom: 20px;
            text-align: center;
        }
        .swipe .select .item{
            display: inline-block;
            width: 10px;
            height: 10px;
            background-color: #fff;
            border-radius: 50%;
            margin: 0 10px;
            /* 阴影 */
            box-shadow: 0 2px 5px rgba(0,0,0,0.4);
        }
        /* 鼠标移入指示器 */
        .swipe .select .item:hover{
            background-color: #ff4400;
        }
        /* 指示器选中状态 */
        .swipe .select .item.checked{
            background-color: #ff4400;
        }
        /* 两侧翻页按钮 */
        .swipe .btn{
            width: 40px;
            height: 100px;
            color: #fff;
            /* 绝对定位 垂直居中 */
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            font-size: 50px;
            background-color: rgba(0,0,0,0.05);
            /* 弹性布局 居中 */
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 3;
            /* 鼠标移入光标变小手 */
            cursor: pointer;
            /* 动画过渡 */
            transition: 0.3s;
        }
        .swipe .btn.left{
            left: -60px;
        }
        .swipe .btn.right{
            right: -60px;
        }
        .swipe .btn:hover{
            background-color: rgba(0,0,0,0.2);
        }

        /* 响应式 屏幕尺寸小于1620px时以下代码生效(让两个按钮移动到图片主体内部) */
        @media screen and (max-width:1620px){
            .swipe .btn.left{
                left: 20px;
            }
            .swipe .btn.right{
                right: 20px;
            }
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

        .list {
            display: flex;
            width: 100%;
            margin-top: 20px;
        }

        .recommend-box {
            z-index: 1;
            display: flex;
            flex-direction: column;
            position: relative;
            margin: 70px auto 60px;
            align-items: center;
            width: 1160px;
            height: auto;
            background: rgba(255,255,255,1);
            backdrop-filter: blur(20px);
        }

        .title {
            width: 100%;
            display: flex;
        }

        .text {
            font-size: 32px;
        }

    </style>
    <title>主页</title>
</head>
<body>
<div class="nav">
    <ul>
        <li><a href="${pageContext.request.contextPath}/homepage" style="color: rgba(70, 100, 180,0.8);"><i class="iconfont">&#xe61f;</i>主页</a></li>
        <li><a href="${pageContext.request.contextPath}/classify"><i class="iconfont">&#xe600;</i>分类</a></li>
        <li><a href="${pageContext.request.contextPath}/account-center"><i class="iconfont">&#xe657;</i>个人</a></li>
    </ul>
</div>
<div class="swipe" id="swipe">
    <div class="bg" id="swipe_bg"></div>
    <section>
        <div class="img-box" id="swipe_img_box">
            <a href="#" class="link" id="swipe_link">
                <img src="image/01.jpg" alt="" class="img" id="swipe_img">
            </a>
        </div>
        <div class="select" id="swipe_select">
        </div>
        <div class="btn left" id="swipe_btn_left">
            <i class="fa fa-angle-left" aria-hidden="true"></i>
        </div>
        <div class="btn right" id="swipe_btn_right">
            <i class="fa fa-angle-right" aria-hidden="true"></i>
        </div>
    </section>
</div>
<%
    List<MangaBean> mangaBeans = (List<MangaBean>) request.getAttribute("list");
%>
<div class="recommend-box">
    <div class="title">
        <div class="text">
            站长推荐
        </div>
    </div>
    <div class="list">
        <%
            for (int i = 0; i < mangaBeans.size() && i < 6; i++) {
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
</body>
<script type="text/javascript">
    // 当前轮播图编号
    let current_index=-1;
    // 自动轮播定时器
    let swipe_timer=null;
    // 轮播图的图片地址与跳转链接
    let links=[
        {'image':'image/01.jpg','target':'#1'},
        {'image':'image/02.jpg','target':'#2'},
        {'image':'image/03.jpg','target':'#3'},
        {'image':'image/04.jpg','target':'#4'},
        {'image':'image/05.jpg','target':'#5'},
        {'image':'image/06.jpg','target':'#6'}
    ];

    // 需要操作到的元素
    let swipe=document.getElementById('swipe');
    let swipe_bg=document.getElementById('swipe_bg');
    let swipe_img_box=document.getElementById('swipe_img_box');
    let swipe_link=document.getElementById('swipe_link');
    let swipe_img=document.getElementById('swipe_img');
    let swipe_select=document.getElementById('swipe_select');
    let swipe_btn_left=document.getElementById('swipe_btn_left');
    let swipe_btn_right=document.getElementById('swipe_btn_right');

    // 事件
    // 切换图片
    let select=(index)=>{
        // 停止播放
        stop();
        // 转数字
        index=Number(index);
        // 越界超过最大数量,直接返回
        if(index>=links.length){
            return;
        }
        // 选中当前已选中的,直接返回
        if(current_index==index){
            return;
        }
        // 取消当前指示点的选中状态
        if(current_index>-1){
            swipe_select.children[current_index].classList.remove('checked');
        }
        // 变更当前轮播图的编号
        current_index=index;
        // 找到当前元素
        let current_link=links[current_index];
        // 背景变化
        swipe_bg.style.backgroundImage='url('+current_link.image+')';
        // 前景变化
        swipe_img.setAttribute('src',current_link.image);
        // 链接变化
        swipe_link.setAttribute('href',current_link.target);
        // 增加新的指示点的选中状态
        swipe_select.children[current_index].classList.add('checked');
    };
    // 自动切换图片
    let autoSelect=(index)=>{
        // 转数字
        index=Number(index);
        // 越界超过最大数量，直接返回
        if(index>=links.length){
            return;
        }
        // 选中当前已选中的，直接返回
        if(current_index==index){
            return;
        }
        // 取消当前指示点的选中状态
        swipe_select.children[current_index].classList.remove('checked');
        // 变更当前轮播图的编号
        current_index=index;
        // 找到当前元素
        let current_link=links[current_index];
        // 前景图片
        // 第一步调整过渡时间
        swipe_img.style.transition='opacity 0.5s ease-in 0s';
        // 第二步调整不透明度为0.2
        swipe_img.style.opacity=0.2;
        // 第三步延迟变换img图片，并重新定义透明度以及过渡时间和过渡方式
        setTimeout(() => {
            // 背景变化
            swipe_bg.style.backgroundImage='url('+current_link.image+')';
            // 前景变化
            swipe_img.setAttribute('src',current_link.image);
            // 链接变化
            swipe_link.setAttribute('href',current_link.target);
            // 不透明度变化
            swipe_img.style.transition='opacity 0.7s ease-out 0s';
            swipe_img.style.opacity=1;
            // 增加新的指示点选中状态
            // 如果已经通过手动点击了，选中则此处不再执行
            if(!document.querySelector('.swipe .checked')){
                swipe_select.children[current_index].style.transition='background-color 0.5s';
                swipe_select.children[current_index].classList.add('checked');
            }
        }, 500);
    };
    // 播放
    let play=()=>{
        // 3秒切换一次
        swipe_timer=setInterval(()=>{
            // 设置新的index
            let index=current_index+1;
            // 右翻越界，切到第一张
            if(index>=links.length){
                index=0;
            }
            // 加载新图片（这里选择自动，增加切换效果）
            autoSelect(index);
        },3000);
    };
    // 停止
    let stop=()=>{
        if(swipe_timer){
            clearInterval(swipe_timer);
            swipe_timer=null;
        }
    };
    // 初始化
    let init=()=>{
        for(let i=0;i<links.length;i++){
            // 创建a元素
            let item=document.createElement('a');
            // 修改属性
            item.setAttribute('class','item');
            item.setAttribute('href','#');
            item.setAttribute('data-index',i);
            // 追加元素
            swipe_select.appendChild(item);
        }
        // 默认第一张
        select(0);
        // 绑定各个事件并开始轮播
        bind();
        play();
    };
    // 绑定
    let bind=()=>{
        // 左翻事件监听
        swipe_btn_left.addEventListener('click',()=>{
            // 设置新的index
            let index=current_index-1;
            // 左翻越界，切到最后一张
            if(index<0){
                index=links.length-1;
            }
            // 加载新图片
            select(index);
        });
        // 右翻事件监听
        swipe_btn_right.addEventListener('click',()=>{
            // 设置新的index
            let index=current_index+1;
            // 右翻越界，切到第一张
            if(index>=links.length){
                index=0;
            }
            // 加载新图片
            select(index);
        });
        // 循环绑定指示器点击事件
        for(const key in swipe_select.children){
            if(swipe_select.children.hasOwnProperty(key)){
                const element=swipe_select.children[key];
                element.addEventListener('click',(e)=>{
                    // 取消默认点击跳转
                    e.preventDefault();
                    // 跳转到当前指示点中data-index所指定的图片
                    select(e.target.dataset.index);
                });
            }
        }
        // 绑定鼠标移入事件
        swipe.addEventListener('mouseover',(e)=>{
            // 防止鼠标从子元素移出时触发
            if(e.relatedTarget&&swipe.compareDocumentPosition(e.relatedTarget)==10){
                stop();
            }
        });
        // 绑定鼠标移出事件
        swipe.addEventListener('mouseout',(e)=>{
            // 防止鼠标从子元素移出时触发
            if(e.relatedTarget&&swipe.compareDocumentPosition(e.relatedTarget)==10){
                play();
            }
        });
        // 绑定鼠标移动事件
        swipe.addEventListener('mousemove',(e)=>{
            stop();
        });
    };

    // 页面加载完毕，执行初始化
    window.addEventListener('load',()=>{
        init();
    })
</script>
</html>
