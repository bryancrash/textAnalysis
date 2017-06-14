<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath }/static/bootstrap/css/fileinput.min.css"/>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap/js/fileinput.min.js"></script>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title" id="myModalLabel">添加文档</h4>
</div>
<div class="modal-body">
    <form action="${pageContext.request.contextPath }/admin/doc/docUpload" method="post" enctype="multipart/form-data"
          class="form-horizontal" role="form" style="margin: 25px;">
        <div class="form-group">
            <label class="col-sm-2 control-label">选择文档</label>
            <div class="col-sm-10">
                <input id="input-7" name="docfile" multiple type="file" class="file file-loading"
                       data-allowed-file-extensions='["doc","docx", "ppt","xls","pdf"]'>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">文档集</label>
            <div class="col-sm-10">
                <select class="form-control" name="docsetid">
                    <c:forEach items="${docsetList}" var="docsetItem" varStatus="ind">
                        <option value="${docsetItem.id}">${docsetItem.docsetName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">文档说明</label>
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
