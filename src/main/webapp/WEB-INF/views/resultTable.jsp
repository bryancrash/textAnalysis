<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>统计结果</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath }/static/jquery/jquery-3.1.0.min.js" ></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">

    </script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="pull-right">
                <form action="${pageContext.request.contextPath }/mark/OutputExcel">
                    <input type="hidden" name="doc_id" value="${document.id}"/>
                    <button class="btn btn-primary" id="outputExcel">导出Excel</button>
                </form>
            </div>
            <div class="text-center">
                <table class="table table-bordered">
                    <caption class="text-center">《${document.docname}》打分统计结果</caption>
                    <thead>
                    <tr>
                        <th></th>
                        <c:forEach items="${document.indicatorSys.indicators}" var="indicatorItem">
                            <th>${indicatorItem.title}</th>
                        </c:forEach>

                    </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${docUseranswerList}" var="docUseranswerItem">
                          <tr>
                            <td>${docUseranswerItem.sysUser.username}</td>
                            <c:forEach items="${docUseranswerItem.userAnswers}" var="userAnswersItem">
                               <td>${userAnswersItem.option.value}</td>
                            </c:forEach>
                          </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
