<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrapvalidator/css/bootstrapValidator.min.css"/>

    <script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrapvalidator/js/bootstrapValidator.min.js"></script>

    <style type="text/css">
        body{
            background: url("${pageContext.request.contextPath }/static/img/login.jpg") no-repeat ;
            background-size:100% 100%;
        }
        #login_form{
            margin-top:20px;
        }
        #login_form .btn{
            width:70px;
        }

        #login_form .btn-default{
            margin-left:20px;
        }
    </style>
    <script type="text/javascript">
            $(document).ready(function(){
                //登录验证
                $('#login_form').bootstrapValidator({
                    message: 'This value is not valid',
                    feedbackIcons: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {
                        nickname: {
                            validators: {
                                notEmpty: {
                                    message: '用户昵称不能为空'
                                }
                            }
                        },
                        password: {
                            validators: {
                                notEmpty: {
                                    message: '密码不能为空'
                                }
                            }
                        }
                    }
                });

                //注册验证
                $('#reg_form').bootstrapValidator({
                    message: 'This value is not valid',
                    feedbackIcons: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {
                        nick_name: {
                            validators: {
                                notEmpty: {
                                    message: '用户昵称不能为空'
                                },
                                remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                                    url: '${pageContext.request.contextPath }/register/checkNickname',//验证地址
                                    message: '昵称已存在'//提示消息
                                }
                            }
                        },
                        user_name: {
                            validators: {
                                notEmpty: {
                                    message: '用户昵称不能为空'
                                },
                                remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                                    url: '${pageContext.request.contextPath }/register/checkUsername',//验证地址
                                    message: '用户名已存在'//提示消息
                                }

                            }
                        },
                        password: {
                            validators: {
                                notEmpty: {
                                    message: '密码不能为空'
                                }
                            }
                        }
                    }
                });

                //注册提交
            $('#reg').click(function () {
                $.ajax({
                    url: "${pageContext.request.contextPath }/register/",
                    type: "GET",
                    data: {
                        "nickname":$("input[name='nick_name']").val(),
                        "username":$("input[name='user_name']").val(),
                        "password":$("input[name='passwd']").val(),
                    },
                    dataType:"json",
                    success: function(data) {
                          var result=eval(data);
                          if(result.valid){
                              alert("注册成功");
                              window.location.href("${pageContext.request.contextPath }/login");
                          }
                    }
                });
            });
            });
    </script>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 navbar navbar-inverse" style="height:60px; background: #333;">
            <h3 class="navbar-text">基于文本分析评分者打分系统登录</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-4" style="margin-top:90px; background: #ffffff;">
        <div>
                    <ul id="myTab" class="nav nav-tabs">
                        <li class="col-lg-6 active text-center"><a href="#login" data-toggle="tab">
                            快速登录</a></li>
                        <li class="col-lg-6 text-center"><a href="#register" data-toggle="tab">快速注册</a></li>
                    </ul>
               <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="login">
                <div class="text-center">
                    <img src="${pageContext.request.contextPath }/static/img/avtar.png" style="margin-top: 20px;" />
                </div>
                <form class="form-horizontal col-md-8 col-sm-offset-2 col-md-offset-2" action="${pageContext.request.contextPath }/login/login" method="post" id="login_form">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                  <i class="fa fa-user fa-lg"></i>
                                </div>
                                <input class="form-control col-lg-6 required" type="text" placeholder="Username" name="nickname" autofocus="autofocus" maxlength="20"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-addon">
                                  <i class="fa fa-lock fa-lg"></i>
                                </div>
                                  <input class="form-control required" type="password" placeholder="Password" name="password" maxlength="8"/>
                            </div>
                        </div>
                    <div class="text-center" style="margin-top: 30px;">
                        <input type="submit" id="loginBtn" class="btn btn-primary" value="登录">
                        <input type="reset" class="btn btn-default" value="重置">
                    </div>
                </form>
            </div>
                   <div class="tab-pane fade" id="register">
                       <p class="text-center" id="userCue" class="cue" style="margin-top: 20px;">快速注册请注意格式</p>
                       <form class="form-horizontal col-md-8 col-sm-offset-2 col-md-offset-2" id="reg_form" name="formUser" action="${pageContext.request.contextPath }/user/login" method="post" style="margin-top:20px;">
                           <div class="form-group">
                               <div class="input-group">
                                   <div class="input-group-addon">
                                       <i class="fa fa-user fa-lg"></i>昵称
                                   </div>
                                   <input class="form-control col-lg-6 required" id="nickname" type="text" <%--onBlur="checkNickname(this)"--%> placeholder="nickname" name="nick_name" autofocus="autofocus" maxlength="20"/>
                               </div>
                           </div>
                           <div class="form-group">
                               <div class="input-group">
                                   <div class="input-group-addon">
                                       <i class="fa fa-user fa-lg"></i>姓名
                                   </div>
                                   <input class="form-control col-lg-6 required" id="username" type="text" <%--onBlur="checkUsername(this)"--%> placeholder="Username" name="user_name" autofocus="autofocus" maxlength="20"/>
                               </div>
                           </div>
                           <div class="form-group">
                               <div class="input-group">
                                   <div class="input-group-addon">
                                       <i class="fa fa-lock fa-lg"></i>密码
                                   </div>
                                   <input class="form-control required" id="passwd" type="password" <%--onBlur="checkPassword(this)"--%> placeholder="Password" name="passwd" maxlength="8"/>
                               </div>
                           </div>
                           <div class="text-center" style="margin-top: 30px;">
                               <input type="submit" name="Submit1" id="reg" class="btn btn-primary"  value="注册" disabled>
                               <input type="reset" class="btn btn-default" value="重置">
                           </div>
                       </form>
                   </div>
               </div>
        </div>
       </div>
    </div>
</div>
</body>
</html>
