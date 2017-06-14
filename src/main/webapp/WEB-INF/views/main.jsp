<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>文本分析系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/static/jQuery_confirm/jquery-confirm.min.css">

    <script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery/jquery-3.1.0.min.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/jQuery_confirm/jquery-confirm.min.js"></script>

    <script type="text/javascript">
            function toMark(url) {
                var userrole="${sessionScope.sessionUser.getRole()}";
                if(userrole=="admin"){
                   window.mainFrame.location.href=url;
                }else{
                    $.alert({
                        title: "${sessionScope.sessionUser.getUsername()}"+',你好！',
                        content: '你没有统计权限!',
                    });
                }
            }
    </script>
    <style type="text/css">
        .AppIteml {
            background: #fff;
            width: 100%;
            height: 100px;
            margin: 0 0 10px;
            padding-top: 16px;
            padding-left: 16px;
            float: left;
            overflow: hidden;
            box-shadow: 0 2px 3px rgba(0,0,0,.3);
        }
        .AppIteml>.menu {
            padding-right: 10px;
        }
        .AppIteml>.appImg {
            width: 65px;
            height: 65px;
            float: left;
            margin: 0 8px 22px 0;
            display: block;
        }
        .AppIteml>.menu>.caption,.menu>.name {
            text-align: left;
            margin: 0;
            display: block;
            width: 100%;
        }
        .AppIteml>.menu>.name {
            color: #2c333d;
            font-size: 13px;
            line-height: 18px;
        }
        .AppIteml>.menu>.caption {
            color: #626670;
            font-size: 12px;
            line-height: 24px;
            min-height: 48px;
        }
        .AppIteml>.menu>.setting {
            float: right;
            margin-bottom: 8px;
        }
        .AppIteml>.menu>.setting>a {
            font-size: 12px;
            padding: 4px 5px 0;
            float: left;
            display: block;
            height: 20px;
            margin-left: 10px;
        }
        .AppIteml>.menu>.setting>a>.btn-text {
            display: none;
            padding: 0;
            line-height: 0;
        }
    </style>
</head>
<body>
<%--<div class="navbar navbar-fixed-top" style="height: 50px; background-color: #2c333d">--%>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="#">基于文本分析的评分者打分系统</a>
    </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span>&nbsp${sessionScope.sessionUser.getUsername()}</a></li>
            <li><a href="${pageContext.request.contextPath }/login/logout"><span class="glyphicon glyphicon-log-in"></span> 注销</a></li>
        </ul>
    </div>
</nav>
<%--</div>--%>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4" style="background-color: #494a5f;">
            <div class="search-tool">
                <div class="search-l">
                    <div class="input-group">
                        <input type="text" class="form-control">
                        <span class="input-group-btn">
                              <button class="btn btn-default" type="button">搜索</button>
                           </span>
                    </div>
                </div>
            </div>
            <div class="list" style="overflow:auto;height:490px; margin-top:10px;">

                <div class="panel-group" id="accordion">
                  <c:forEach items="${docsetList}" var="docSetItem">
                    <div class="panel panel-default">
                        <div class="panel-heading"  style="background: #00c0ef;">
                            <h4 class="panel-title text-center">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#${docSetItem.id}">
                                    ${docSetItem.docsetName}
                                </a>
                            </h4>
                        </div>
                        <div id="${docSetItem.id}" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <c:forEach items="${docSetItem.documents}" var="docItem" varStatus="ind">
                                        <c:if test="${!empty docItem.docname}">
                                        <div class="AppIteml" style="width: 100%;">
                                            <img src="${pageContext.request.contextPath }/static/img/1018541225.jpeg" alt="" class="appImg"/>
                                            <div class="menu">
                                                <p class="name">${docItem.docname}</p>
                                                <p class="caption"></p>
                                                <div class="setting">
                                                    <a href="${pageContext.request.contextPath}/readOnline?filePath=${docItem.docpath}" target="mainFrame">
                                                        <span class="icon-prev">阅读</span>
                                                        <span class="btn-text">阅读</span>
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/toMark?id=${docItem.id}&user_id=${sessionScope.sessionUser.getId()}" target="mainFrame">
                                                        <span class="icon-prev">打分</span>
                                                        <span class="btn-text">打分</span>
                                                    </a>
                                                    <a href="#" onclick="toMark('${pageContext.request.contextPath}/mark/getStatistics?doc_id=${docItem.id}')">
                                                        <span class="icon-prev">统计</span>
                                                        <span class="btn-text">统计</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                        </div>
                    </div>
                  </c:forEach>
                </div>


            </div>
        </div>
        <div class="col-md-8">
            <iframe src="${pageContext.request.contextPath}/welcome" id="mainFrame" name="mainFrame" style="overflow: scroll; width: 100%;height: 530px;" scrolling="yes" frameborder="no"></iframe>
        </div>
    </div>
</div>
<div id="footer" class="container">
    <nav class="navbar navbar-default navbar-fixed-bottom" style="padding: 10px;">
        <div class="navbar-inner navbar-content-center">
            <p class="text-muted credit text-center">
                2017 文本分析毕业设计   by tianlin
            </p>
        </div>
    </nav>
</div>
</body>
</html>
