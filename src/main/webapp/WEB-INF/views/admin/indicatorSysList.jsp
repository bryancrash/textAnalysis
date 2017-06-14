<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>指标体系</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/static/jQuery_confirm/jquery-confirm.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrapvalidator/css/bootstrapValidator.min.css"/>

    <script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery/jquery-3.1.0.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/jQuery_confirm/jquery-confirm.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/iscroll.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var _width = $('#3').width();
            $('#3 th:first-child').width(_width * 0.2);
            $('#3 td:first-child').width(_width * 0.2);
            $('#3 th:nth-child(2)').width(_width * 0.3);
            $('#3 td:nth-child(2)').width(_width * 0.3);
            $('#3 th:nth-child(3)').width(_width * 0.3);
            $('#3 td:nth-child(3)').width(_width * 0.3);
            $('#3 th:nth-child(4)').width(_width * 0.2);
            $('#3 td:nth-child(4)').width(_width * 0.2);

            $('#indSys_form').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    indicatorTitle: {
                        validators: {
                            notEmpty: {
                                message: '文本集名称不能为空'
                            }
                        }
                    }
                }
            });
        });

        function toNew(url) {
            $("#myModal").on("hidden.bs.modal",function(){
                $(this).removeData("bs.modal");
            });
            $("#myModal").css("width", $(window).width() - 5);
            $("#myModal").css("height", $(window).height() - 20);
            $("#myModal").css("max-height", $(window).height() - 100);
            $('#myModal').modal({
                remote: url + '&rd=' + Math.random(),
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
            <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">添加指标体系</button>
        </div>
        <div class="col-md-4" style="margin-top: 10px;">
            <form action="${pageContext.request.contextPath }/admin/indSys/search" method="post">
                <div class="form-group">
                    <div class="input-group">
                        <input type="text" name="indicatorTitle" class="form-control">
                        <span class="input-group-btn">
                               <button class="btn btn-primary" type="submit">查询</button>
                            </span>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="row-fluid">
        <div class="col-md-12">
            <div id="3">
                <table class="table table-bordered table-striped table-condensed scrolltable">
                    <thead style="display:block;overflow-y: scroll;border-bottom:1px solid #eee;">
                    <tr>
                        <th>序号</th>
                        <th>指标体系</th>
                        <th>说明</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody style="display:block; max-height:380px;overflow-y: scroll;">
                    <c:forEach items="${indsyslist}" var="indSysItem" varStatus="ind">
                        <tr>
                            <td>${ind.index+1 }</td>
                            <td>${indSysItem.indicatorTitle}</td>
                            <td>${indSysItem.remarks}</td>
                            <td>
                                <a href="#"
                                   onclick="toNew('${pageContext.request.contextPath }/admin/indSys/get?id=${indSysItem.id}&flg=view')">查看</a>
                                <a href="#"
                                   onclick="toNew('${pageContext.request.contextPath }/admin/indSys/get?id=${indSysItem.id}&flg=update')">修改</a>
                                <a href="#" class="cancle"
                                   onclick="delcfm('${pageContext.request.contextPath }/admin/indSys/delete?id=${indSysItem.id}')">删除</a>
                                <a href="${pageContext.request.contextPath }/admin/indSys/addIndicators?id=${indSysItem.id}" target="inside">添加指标</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加指标体系</h4>
            </div>
            <div class="modal-body">
                <form id="indSys_form" action="${pageContext.request.contextPath }/admin/indSys/save" method="post" class="form-horizontal"
                      role="form" style="margin: 10px;">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">指标体系</label>
                        <div class="col-sm-10">
                            <input class="form-control" name="indicatorTitle" multiple type="text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="name" class="col-sm-2 control-label">说明</label>
                        <div class="col-sm-10">
                            <textarea name="remarks" class="form-control" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="text-center">
                        <input type="submit" class="btn btn-primary" value="添加"/>
                        <input type="reset" class="btn btn-primary" value="重置"/>
                    </div>
                </form>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>
</body>
</html>
