<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrapvalidator/css/bootstrapValidator.min.css"/>

<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#docset_form').bootstrapValidator({
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
    <h4 class="modal-title" id="myModalLabel">添加文本集</h4>
</div>
<div class="modal-body">
    <form id="docset_form" action="${pageContext.request.contextPath }/admin/doc/docsetSave" method="post" class="form-horizontal"
          role="form" style="margin: 10px;">
        <div class="form-group">
            <label class="col-sm-2 control-label">文本集</label>
            <div class="col-sm-10">
                <input class="form-control" name="docsetName" multiple type="text">
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">说明</label>
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
