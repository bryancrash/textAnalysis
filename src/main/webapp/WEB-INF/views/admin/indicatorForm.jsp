<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrapvalidator/css/bootstrapValidator.min.css"/>

<script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script type="text/javascript">
    var idx=0;
    function addRow(list){
        var $form_group=$("<div></div>");
        $form_group.addClass("form-group");
        $form_group.attr("id","options"+idx);

        var $lable=$("<label>"+(idx+1)+"</label>");
        $lable.addClass("col-sm-2 control-label");

        var $div_input=$("<div></div>");
        $div_input.addClass("col-sm-10");


        var $input_1=$("<input />");
        $input_1.addClass("form-control");
        $input_1.attr("type","text");
        $input_1.attr("id","optionsList"+idx+"value");
        $input_1.attr("name","optionsList["+idx+"].value");

        $div_input.append($input_1);

        $form_group.append($lable);
        $form_group.append($div_input);
        $(list).append($form_group);
        idx++;
    }
    function delRow(){
        if(idx>0){
            idx--;
            $("#options"+idx).remove();
        }
    }
    $(document).ready(function(){
        $('#indicator_form').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                title: {
                    validators: {
                        notEmpty: {
                            message: '指标名不能为空'
                        }
                    }
                }
            }
        });
    });

</script>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h4 class="modal-title" id="myModalLabel">添加指标</h4>
</div>
<div class="modal-body">
    <form action="${pageContext.request.contextPath }/admin/ind/save" method="post" id="indicator_form" class="form-horizontal" role="form">
        <input type="hidden" name="indicatorSysId" value="${indSys_id}"/>
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">指标</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="title" id="firstname" placeholder="请输入指标名称">
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">说明</label>
            <div class="col-sm-10">
                <textarea name="remarks" class="form-control" rows="3"></textarea>
            </div>
        </div>
        <div id="options">

        </div>
        <div class="form-group">
            <div class="text-right">
                <a href="javascript:" onclick="addRow('#options')" class="btn"><span class="glyphicon glyphicon-plus"></span></a>
                <a href="javascript:" onclick="delRow()" class="btn"><span class="glyphicon glyphicon-minus"></span></a>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-10">
                <button type="submit" class="btn btn-primary">添加</button>
            </div>
        </div>
    </form>
</div>
