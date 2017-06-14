<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title" id="myModalLabel">文本详情</h4>
</div>
<div class="modal-body">
    <ul class="list-group">
        <li class="list-group-item">
            文本名：${document.docname}
        </li>
        <li class="list-group-item">
            文本路径：${document.docpath}
        </li>
        <li class="list-group-item">
            添加时间：<fmt:formatDate value="${document.addtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
        </li>
        <li class="list-group-item">
            说明：${document.remarks}
        </li>
        <li class="list-group-item">
            指标体系：${document.indicatorSys.indicatorTitle}
        </li>
    </ul>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default center-block" data-dismiss="modal"><span
            class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
    </button>
    <%--<button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>--%>

</div>

