<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title" id="myModalLabel">文档集详情</h4>
</div>
<div class="modal-body">
    <ul class="list-group">
        <li class="list-group-item">
            文本集名称：${docset.docsetName}
        </li>
        <li class="list-group-item">
            说明：${docset.remarks}
        </li>
        <p>包含文本</p>
        <li>
        <ul class="list-group">
            <c:forEach items="${documentList}" var="docItem">
            <li class="list-group-item">
                文本名称：${docItem.docname}
            </li>
            </c:forEach>
        </ul>
        </li>
    </ul>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default center-block" data-dismiss="modal"><span
            class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
    </button>
</div>
