<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台系统</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/layout.css">
    <script src="${pageContext.request.contextPath }/static/jquery/jquery-3.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/holder.min.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/application.js"></script>
</head>
<body>
<div class="topbar navbar-fixed-top">
    <a href="#" class="topbar-brand">
        <i class="fa fa-leaf"></i> 文本分析后台管理系统
    </a>
    <div class="dropdown nav navbar-nav navbar-right">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <p class="navbar-text"> ${sessionScope.sysUser.getUsername()} 登录&nbsp&nbsp<i class="fa fa-caret-down"></i></p>
        </a>
        <ul class="dropdown-menu">
            <li>
                <a href="#">
                    <i class="fa fa-user"></i> 个人信息
                </a>
            </li>
            <li>
                <a href="updatepwd.php?name=<?=$_SESSION['name']?>" target="inside">
                    <i class="fa fa-pencil-square-o"></i> 修改密码
                </a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="${pageContext.request.contextPath }/admin/login/adminlogout">
                    <i class="fa fa-power-off"></i> 退出
                </a>
            </li>
        </ul>
    </div>
</div>
<div class="main-container">
    <div class="main-top">
        <div class="topleft"><i class="fa fa-sitemap"></i></div>
        <ul class="breadcrumb">

        </ul>
    </div>
    <div class="main-middle">
        <div class="sidebar">
            <ul class="nav nav-stacked">
                <li>
                    <a href="#" class="navmain">
                        <i class="fa fa-user icon"></i> 用户管理
                        <i class="fa fa-angle-down down"></i>
                    </a>
                    <ul class="subnav">
                        <li class="last">
                            <a href="${pageContext.request.contextPath }/admin/user/list" target="inside">
                                <i class="fa fa-chevron-circle-right icon"></i> 用户列表
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="navmain">
                        <i class="fa fa-cog icon"></i> 文档管理
                        <i class="fa fa-angle-down down"></i>
                    </a>
                    <ul class="subnav">
                        <li>
                            <a href="${pageContext.request.contextPath }/admin/doc/docSetList" target="inside">
                                <i class="fa fa-chevron-circle-right icon"></i> 文本集
                            </a>
                        </li>
                        <li class="last">
                            <a href="${pageContext.request.contextPath }/admin/doc/list" target="inside">
                                <i class="fa fa-chevron-circle-right icon"></i> 文本列表
                            </a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="navmain">
                        <i class="fa fa-columns icon"></i> 指标管理
                        <i class="fa fa-angle-down down"></i>
                    </a>
                    <ul class="subnav">
                        <li>
                            <a href="${pageContext.request.contextPath }/admin/indSys/list" target="inside">
                                <i class="fa fa-chevron-circle-right icon"></i>指标体系
                            </a>
                        </li>
                       <%-- <li class="last">
                            <a href="#">
                                <i class="fa fa-chevron-circle-right icon"></i>
                                指标
                            </a>
                        </li>--%>
                    </ul>
                </li>
                <li>
                    <a href="#" class="navmain">
                        <i class="fa fa-list icon"></i> 统计结果
                        <i class="fa fa-angle-down down"></i>
                    </a>
                    <ul class="subnav">
                        <li>
                            <a href="editexgoods.php" target="inside">
                                <i class="fa fa-chevron-circle-right icon"></i> 统计结果
                            </a>
                        </li>
                        <!--<li class="last">
                    <a href="#">
                        <i class="fa fa-chevron-circle-right icon"></i>
                        子模块二
                    </a>
                </li>-->
                    </ul>
                </li>

                <li class="bottom"><i class="fa fa-pagelines"></i></li>
            </ul>
        </div>
        <div class="main-cont">
            <iframe name="inside" id="inside" style="overflow:visible; width: 100%;height: 520px;" scrolling="yes"
                    frameborder="no">
            </iframe>
        </div>
    </div>
</div>
<div class="footbar navbar-fixed-bottom">
    <div class="foot-area">
        <i class="fa fa-copyright"></i> 2015 - 2017 文本分析毕业设计
    </div>
</div>

<!-- javascript -->
<script src="${pageContext.request.contextPath }/static/js/basic.js"></script>
</body>
</html>
