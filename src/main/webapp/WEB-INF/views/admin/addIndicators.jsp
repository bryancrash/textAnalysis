<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>添加指标</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/static/jQuery_confirm/jquery-confirm.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/static/jQuery_confirm/jquery-confirm.min.css">

    <script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery/jquery-3.1.0.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/jQuery_confirm/jquery-confirm.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/jQuery_confirm/jquery-confirm.min.js"></script>
    <script type="text/javascript">
        function toNew(url) {
            $("#myModal").on("hidden.bs.modal",function(){
                $(this).removeData("bs.modal");
            });
            $("#myModal").css("width", $(window).width() - 5);
            $("#myModal").css("height", $(window).height() - 20);
            $("#myModal").css("max-height", $(window).height() - 100);
            $('#myModal').modal({
                remote: url,
                backdrop: 'static'
            });
        }

        function delcfm(url) {
            $.confirm({
                title: '温馨提示',
                content: '确认删除？',
                type: 'red',
                typeAnimated: true,
                closeIcon: true,
                animations: top,
                closeAnimation: 'scale',
                buttons: {
                    删除: {
                        btnClass: 'btn-red',
                        action: function () {
                            window.location.href = url;
                        }
                    },
                    取消: function () {
                    },
                }
            });
        }
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12" style="background:#bfb8e4; margin-bottom: 15px;">
            <div class="page-header text-center">
                <h3>${indicatorSys.indicatorTitle}</h3>
            </div>
            <p>${indicatorSys.remarks}</p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-condensed">
                <thead>
                <tr>
                    <th>指标</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${indicatorList}" var="indicatorItem" varStatus="ind">
                    <tr>
                        <td>${ind.index+1}、${indicatorItem.title}</td>
                        <td>
                            <a href="#"
                               onclick="toNew('${pageContext.request.contextPath }/admin/ind/getOptions?indicator_id=${indicatorItem.id}')">查看</a>
                            <a href="#"
                               onclick="delcfm('${pageContext.request.contextPath }/admin/ind/deleteOptions?indicator_id=${indicatorItem.id}&indSys_id=${indicatorSys.id}')">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
           <button class="btn btn-primary pull-right" onclick="toNew('${pageContext.request.contextPath }/admin/ind/indicatorform?id=${indicatorSys.id}')">添加指标</button>
        </div>
    </div>

</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>
</body>
</html>
