

$(document).ready(function(){
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
        var url = "login";

//设置往form表单中添的元素，name=value的方式
        var params = {
            "user":$("#user").val(),
            "password":$("#password").val()
        }
        // console.log(params);

//调用函数，发送post请求
        httpPost(url,params);
    });
});
