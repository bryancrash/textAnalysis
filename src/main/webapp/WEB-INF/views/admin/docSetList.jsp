<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加文件集</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/static/jQuery_confirm/jquery-confirm.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery/jquery-3.1.0.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/jQuery_confirm/jquery-confirm.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/iscroll.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var _width = $('#2').width();
            $('#2 th:first-child').width(_width * 0.2);
            $('#2 td:first-child').width(_width * 0.2);
            $('#2 th:nth-child(2)').width(_width * 0.4);
            $('#2 td:nth-child(2)').width(_width * 0.4);
            $('#2 th:nth-child(3)').width(_width * 0.4);
            $('#2 td:nth-child(3)').width(_width * 0.4);
        })
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
    <div class="row-fluid" style="height: 70px;">
        <div class="col-md-3" style="margin-top: 10px;">
            <button class="btn btn-primary" onclick="toNew('${pageContext.request.contextPath }/admin/doc/addDocSet')">添加文本集</button>
        </div>
        <div class="col-md-4" style="margin-top: 10px;">
            <form action="${pageContext.request.contextPath }/admin/doc/search" method="post">
                <div class="form-group">
                    <div class="input-group">
                        <input type="text" name="docSetName" class="form-control">
                        <span class="input-group-btn">
                            <button class="btn btn-primary" type="submit">查询</button>
                        </span>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="row-fluid">
    <div class="col-md-12">
        <div id="2">
            <table class="table table-bordered table-striped table-condensed scrolltable">
                <thead style="display:block;overflow-y: scroll;border-bottom:1px solid #eee;">
                <tr>
                    <th>序号</th>
                    <th>文本集名称</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody style="display:block; max-height:380px;overflow-y: scroll;">
                <c:forEach items="${docsetList}" var="docsetItem" varStatus="ind">
                    <tr>
                        <td>${ind.index+1}</td>
                        <td>${docsetItem.docsetName}</td>
                        <td>
                            <a href="#"
                               onclick="toNew('${pageContext.request.contextPath }/admin/doc/getDocSet?id=${docsetItem.id}&flg=view')">查看</a>
                            <a href="#"
                               onclick="toNew('${pageContext.request.contextPath }/admin/doc/getDocSet?id=${docsetItem.id}&flg=update')">修改</a>
                            <a href="#" class="cancle"
                               onclick="delcfm('${pageContext.request.contextPath }/admin/doc/deleteDocSet?id=${docsetItem.id}')">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
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
