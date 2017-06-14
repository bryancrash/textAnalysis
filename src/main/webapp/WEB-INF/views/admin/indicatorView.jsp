<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title" id="myModalLabel">指标体系详情</h4>
</div>
<div class="modal-body">
    <ul class="list-group">
        <li class="list-group-item">
            指标名称：${indicator.title}
        </li>
        <li class="list-group-item">
            说明：${indicator.remarks}
        </li>
        <li class="list-group-item">
            选项：
            <c:forEach items="${optionsList}" var="option" varStatus="ind">
                (${ind.index+1 })${option.value}&nbsp;
            </c:forEach>
        </li>
    </ul>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default center-block" data-dismiss="modal"><span
            class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭
    </button>
</div>
