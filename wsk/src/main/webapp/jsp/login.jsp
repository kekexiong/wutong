<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login</title>

    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="common/css/css-login.css">
</head>
<body>
<div class="container">
    <div class="form row">
        <div class="form-horizontal col-md-offset-3" id="login_form">
            <h3 class="form-title">梧桐管理系统登录</h3>
            <div class="col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" type="text" placeholder="Username" id="username"
                           name="username" autofocus="autofocus" maxlength="20" value="${cookie.userName.value}"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" type="password" placeholder="Password" id="password"
                           name="password" maxlength="9" value="${cookie.password.value}"/>
                </div>
                <div class="form-group">
                    <i></i>
                </div>
                <div class="form-group">
                    <div class="col-xs-5 pull_left">
                        <div class="form-group">
                            <input class="form-control" type="tel" id="verify_input" placeholder="输入验证码" maxlength="4">
                        </div>
                    </div>
                    <div class="col-xs-7 pull_left">
                        <a href="javascript:void(0);" title="点击更换验证码">
                            <img id="imgVerify" class="preview" src="" alt="获取验证码" height="36" width="100%"
                                 onclick="getVerify(this);">
                        </a>
                    </div>
                </div>
                <div class="form-group">
                    <i></i>
                    <span id="tiShi"></span>
                </div>
                <div class="form-group">
                    <label class="checkbox">
                        <input type="checkbox" id="remember" name="remember" value="1"/>记住我
                    </label>
                </div>
                <div class="form-inline">
                    <ul class="nav navbar-nav pull-right">
                        <li class="active"><a href="retrieve_pwd.jsp">忘记密码 <span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav pull-right">
                        <li class="active"><a href="#">注册 <span class="sr-only">(current)</span></a></li>
                    </ul>
                </div>
                <div class="form-group col-md-offset-9">
                    <button type="submit" class="btn btn-success pull-right" name="submit" onclick="login()">登录</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    function register() {
        //跳转到注册界面register.html进行注册
        window.open("register.html", "_blank");  //_self,_parent,_top,_blank
    }

    function my$(id) {
        return document.getElementById(id);
    }

    my$("username").onclick = function () {
        document.getElementById("tiShi").innerText = ""
    }
    my$("password").onclick = function () {
        document.getElementById("tiShi").innerText = ""
    }
    my$("verify_input").onclick = function () {
        document.getElementById("tiShi").innerText = ""
    }

    //当验证码输入错误，自动刷新验证码
    function getVerifySec() {
        $("#imgVerify").attr("src", baseURL + "/getVerify?" + Math.random());
        //$("img[class='preview']").removeAttr("hidden")
    }

    //获取验证码
    function getVerify(obj) {
        //$("img[class='preview']").removeAttr("hidden")
        obj.src = baseURL + "/getVerify?" + Math.random();
    }

    var baseURL = "<%=request.getContextPath()%>";

    function login() {
        //登录逻辑
        //jQuery写法
        var username = $('#username').val();
        var password = $('#password').val();
        var verifyinput = $('#verify_input').val();
        var remember = $('#remember').val();
        $.ajax({
            type: "post",  //post put get 等等
            url: baseURL + "/login",
            async: false,
            data: {  //要传入ashx文件的数据
                "username": username,
                "password": password,
                "verifyInput": verifyinput,
                "remember": remember
            },
            success: function (data) {
                if (data.success) {
                    window.open("index.jsp", "_blank");
                } else {
                    document.getElementById("tiShi").style.color = "red";
                    document.getElementById("tiShi").innerText = data.msg
                    //alert("a"+data.msg);  //这里data是从ashx文件返回的“账户名或密码不存在..
                    getVerifySec();

                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {  //连接至ashx文件失败时，执行函数
                alert("请求在连接过程中出现错误..\n" + errorThrown);
            }
        });
    }
</script>
</html>
