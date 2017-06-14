<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
</div>
<div class="modal-body">
    <form action="${pageContext.request.contextPath }/admin/user/update" method="post" class="form-horizontal" role="form"
          style="margin: 10px;">
        <input type="hidden" name="id" value="${sysUser.id}">
        <div class="form-group">
            <label class="col-sm-2 control-label">昵称</label>
            <div class="col-sm-10">
                <input type="text" id="nickname" class="form-control" name="nickname" value="${sysUser.nickname}"
                       multiple placeholder="请输入昵称">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-10">
                <input type="text" id="username" class="form-control" name="username" value="${sysUser.username}"
                       multiple placeholder="请输入用户名">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">登录密码</label>
            <div class="col-sm-10">
                <input type="password" id="password" class="form-control" name="password" value="${sysUser.password}"
                       multiple placeholder="请输入登录密码">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">角色</label>
            <div class="col-sm-10">
                <select name="role" class="form-control">
                    <option value="admin">管理员</option>
                    <option value="common">普通用户</option>
                </select>
            </div>
        </div>
        <div class="text-center">
            <%--<button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"
                                                                                     aria-hidden="true"></span>关闭
            </button>
            <button type="submit" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span
                    class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存
            </button>--%>
            <input type="button" class="btn btn-primary" data-dismiss="modal" value="关闭"/>
            <input type="submit" class="btn btn-primary" value="保存"/>
        </div>
    </form>
</div>