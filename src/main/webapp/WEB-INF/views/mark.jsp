<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>文本打分</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/static/jQuery_confirm/jquery-confirm.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/main.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/static/jQuery_confirm/jquery-confirm.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#submit").click(function(){
                var size="${document.indicatorSys.indicators.size()}";
                var indicator_ids=new Array(size);
                var values=new Array(size);
                for(var i=0;i<size;i++){
                    indicator_ids[i]=$("input[name='indicator_id["+i+"]']").val();
                    values[i]=$("input[name='value["+i+"]']:checked").val();
                }
                $.ajax({
                    url: "${pageContext.request.contextPath }/mark/saveMark",
                    type: "GET",
                    data: {
                        "user_id":$("input[name='user_id']").val(),
                        "doc_id":$("input[name='doc_id']").val(),
                        "indicator_ids": indicator_ids,
                        "values": values,
                    },
                    traditional: true,//这里设置为true
                    success: function(data) {
                       if(data.result){
                           $.alert({
                               title: 'Hello!',
                               content: '保存成功!',
                           });
                        }
                    }
                });
            });
        });
    </script>
    <style type="text/css">
        .survey{
            margin-left: 15px;
        }
        .form-group{
            padding-left: 20px;
        }
    </style>
</head>
<body style="background: #00c0ef; overflow-x: scroll;">
<div class="container">
    <form  method="post" class="form-horizontal" role="form"  style="background: #ffffff; margin-bottom: 40px;">
        <div class="header">
            <h2 class="text-center" style="padding-top: 20px;">${document.indicatorSys.indicatorTitle}</h2>
            <p class="lead" style="font-size: 15px;">${document.indicatorSys.remarks}</p>
            <hr/>
        </div>
        <div class="survey">
            <input type="hidden" name="user_id" value="${sessionScope.sessionUser.getId()}"/>
            <input type="hidden" name="doc_id" value="${document.id}"/>
            <c:forEach items="${document.indicatorSys.indicators}" var="indicator" varStatus="ind">
                <input type="hidden" name="indicator_id[${ind.index}]" value="${indicator.id}"/>
            <div class="form-group" >
                <label for="name1"><span>${ind.index+1}、</span>${indicator.title}</label>
                <div>
                    <c:forEach items="${indicator.optionsList}" var="option">
                        <label class="radio-inline">
                            <input type="radio" value="${option.id}" name="value[${ind.index}]">${option.value}
                        </label>
                    </c:forEach>
                </div>
            </div>
                <hr/>
            </c:forEach>
        </div>
        <div class="text-center">
            <c:choose>
                <c:when test="${isMarked}">
                    <input class="btn btn-default" id="submit" type="button" data-toggle="tooltip"
                           data-placement="top" title="你已完成本文本打分" value="提交" disabled style="margin-bottom: 20px; width: 100px; background: red; color: #ffffff;">
                </c:when>
                <c:otherwise>
                    <input class="btn btn-default" id="submit" type="button" style="margin-bottom: 20px; width: 100px; background: red; color: #ffffff;" value="提交">
                </c:otherwise>
            </c:choose>
        </div>
    </form>
</div>
</body>
</html>
