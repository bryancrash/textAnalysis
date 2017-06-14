<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title" id="myModalLabel">指定指标</h4>
</div>
<div class="modal-body">
    <form action="${pageContext.request.contextPath }/admin/doc/updateIndSys" method="post" class="form-horizontal"
          role="form" style="margin: 10px;">
        <input type="hidden" name="id" value="${id}">
        <div class="form-group">
            <label class="col-sm-2 control-label">指标</label>
            <div class="col-sm-10">
                <select class="form-control" name="indicatorSysId">
                    <c:forEach items="${indicatorSysList}" var="indicatorSysItem" varStatus="ind">
                        <option value="${indicatorSysItem.id}">${indicatorSysItem.indicatorTitle}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="text-center">
            <input type="button" class="btn btn-primary" data-dismiss="modal" value="关闭"/>
            <input type="submit" class="btn btn-primary" value="保存"/>
        </div>
    </form>
</div>
