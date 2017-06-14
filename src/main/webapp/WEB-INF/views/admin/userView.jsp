<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title" id="myModalLabel">添加文档</h4>
</div>
<div class="modal-body">
    <ul class="list-group">
        <li class="list-group-item">
            昵称：${sysUser.nickname}
        </li>
        <li class="list-group-item">
            姓名：${sysUser.username}
        </li>
        <li class="list-group-item">
            密码：${sysUser.password}
        </li>
        <li class="list-group-item">
            角色：${sysUser.role}
        </li>
    </ul>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default center-block" data-dismiss="modal"><span
            class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
    </button>
    <%--<button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>--%>

</div>
