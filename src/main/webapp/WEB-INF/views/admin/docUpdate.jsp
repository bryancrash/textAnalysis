<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title" id="myModalLabel">修改文本信息</h4>
</div>
<div class="modal-body">
    <form action="${pageContext.request.contextPath }/admin/doc/updateDoc" method="post" class="form-horizontal" role="form"
          style="margin: 10px;">
        <input type="hidden" name="id" value="${document.id}">
        <div class="form-group">
            <label class="col-sm-2 control-label">文本名称</label>
            <div class="col-sm-10">
                <input type="text" id="docname" class="form-control" name="docname" value="${document.docname}"
                       multiple placeholder="请输入文本名称">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">文本路径</label>
            <div class="col-sm-10">
                <input type="text" id="docpath" class="form-control" name="docpath" value="${document.docpath}"
                       multiple placeholder="请输入文本路径">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">说明</label>
            <div class="col-sm-10">
                <textarea name="remarks" class="form-control" value="${document.remarks}" rows="3"></textarea>
            </div>
        </div>
        <div class="text-center">
            <input type="button" class="btn btn-primary" data-dismiss="modal" value="关闭"/>
            <input type="submit" class="btn btn-primary" value="保存"/>
        </div>
    </form>
</div>
