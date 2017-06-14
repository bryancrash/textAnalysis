<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台系统登录</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/login.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrapvalidator/css/bootstrapValidator.min.css"/>

    <script src="${pageContext.request.contextPath }/static/jquery/jquery-3.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/holder.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/application.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrapvalidator/js/bootstrapValidator.min.js"></script>


    <script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/jQuery.easing.js"></script>
    <script src="js/script.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            //登录验证
            $('#adminlog_form').bootstrapValidator({
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
                    pwd: {
                        validators: {
                            notEmpty: {
                                message: '密码不能为空'
                            }
                        }
                    }
                }
            });
        });
    </script>
</head>
<div class="body">
    <div class="main">
        <div class="slide-content" id="slide_content">
            <div class="login-box">
                <h3>后台系统登录</h3>
                <form id="adminlog_form" action="${pageContext.request.contextPath }/admin/login/adminLogin" method="post">
                    <div class="log-row">
                        <div class="form-group">
                        <div class="input-group">
					<span class="input-group-addon">
						<span class="glyphicon glyphicon-user"></span>&nbsp;用户名:
					</span>
                            <input type="text" name="nickname" class="form-control" placeholder="输入用户名">
                        </div>
                        <p class="text-danger tips">用户名不能为空!~!</p>
                    </div>
                        </div>
                    <div class="log-row">
                        <div class="form-group">
                        <div class="input-group">
					<span class="input-group-addon">
						<span class="glyphicon glyphicon-lock"></span>&nbsp;密　码:
					</span>
                            <input type="password" name="pwd" class="form-control" placeholder="输入密码">
                        </div>
                        <p class="text-danger tips">密码不能为空!~!</p>
                    </div>
                        </div>
                    <input type="submit" class="btn btn-primary" value="登录">
                    <input type="reset" class="btn btn-default" value="取消">

                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
