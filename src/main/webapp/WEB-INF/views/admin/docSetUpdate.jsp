<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrapvalidator/css/bootstrapValidator.min.css"/>

<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#docsetUpdate_form').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                docsetName: {
                    validators: {
                        notEmpty: {
                            message: '文本集名称不能为空'
                        }
                    }
                }
            }
        });
    });
</script>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title" id="myModalLabel">修改文本集信息</h4>
</div>
<div class="modal-body">
    <form id="docsetUpdate_form" action="${pageContext.request.contextPath }/admin/doc/updateDocSet" method="post" class="form-horizontal" role="form"
          style="margin: 10px;">
        <input type="hidden" name="id" value="${docset.id}">
        <div class="form-group">
            <label class="col-sm-2 control-label">文本集名称</label>
            <div class="col-sm-10">
                <input type="text" id="docsetName" class="form-control" name="docsetName" value="${docset.docsetName}"
                       multiple placeholder="请输入文本集名称">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">说明</label>
            <div class="col-sm-10">
                <div class="col-sm-10">
                    <textarea name="remarks" class="form-control" rows="3">${docset.remarks}</textarea>
                </div>
            </div>
        </div>
        <div class="text-center">
            <input type="button" class="btn btn-primary" data-dismiss="modal" value="关闭"/>
            <input type="submit" class="btn btn-primary" value="保存"/>
        </div>
    </form>
</div>
