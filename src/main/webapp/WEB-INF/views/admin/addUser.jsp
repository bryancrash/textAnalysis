<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title" id="myModalLabel">添加用户</h4>
</div>
<div class="modal-body">
    <form action="${pageContext.request.contextPath }/admin/user/save" method="post" class="form-horizontal"
          role="form" style="margin: 10px;">
        <div class="form-group">
            <label class="col-sm-2 control-label">昵称</label>
            <div class="col-sm-10">
                <input type="text" id="nickname" class="form-control" name="nickname" multiple
                       placeholder="请输入昵称">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-10">
                <input type="text" id="username" class="form-control" name="username" multiple
                       placeholder="请输入用户名">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">登录密码</label>
            <div class="col-sm-10">
                <input type="password" id="password" class="form-control" name="password" multiple
                       placeholder="请输入登录密码">
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
            <input type="submit" class="btn btn-primary" value="添加"/>
            <input type="reset" class="btn btn-primary" value="重置"/>
        </div>
    </form>
</div>
