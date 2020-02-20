<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>找回</title>

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
            <h3 class="form-title">找回密码</h3>
            <div class="col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" type="text" placeholder="Username" id="username"
                           name="username" autofocus="autofocus" maxlength="20"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" type="email" placeholder="email" id="mail"
                           name="mail" />
                </div>
                <div class="form-group">
                    <label class="checkbox">

                    </label>
                </div>
                <div class="form-inline">
                    <ul class="nav navbar-nav pull-right">
                        <li class="active"><a href="#"> <span class="sr-only">(current)</span></a></li>
                    </ul>
                    <ul class="nav navbar-nav pull-right">
                        <li class="active"><a href="#"> <span class="sr-only">(current)</span></a></li>
                    </ul>
                </div>
                <div class="form-group col-md-offset-9">
                    <button type="submit" class="btn btn-success pull-right" name="submit" onclick="retrieve()">找回</button>
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
    var baseURL = "<%=request.getContextPath()%>";
    function retrieve() {
        //登录逻辑
        //jQuery写法
        var username = $('#username').val();
        var mail = $('#mail').val();
        $.ajax({
            type: "post",  //post put get 等等
            url: baseURL+ "/retrieve",
            async: false,
            data: {  //要传入ashx文件的数据
                "username": username,
                "mail": mail
            },
            success: function (data) {
                if (data.success) {
                    alert("a"+data.msg);
                }
                else {
                    alert("a"+data.msg);  //这里data是从ashx文件返回的“账户名或邮箱不存在..
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {  //连接至ashx文件失败时，执行函数
                alert("请求在连接过程中出现错误..\n" + errorThrown);
            }
        });
    }
</script>
</html>
