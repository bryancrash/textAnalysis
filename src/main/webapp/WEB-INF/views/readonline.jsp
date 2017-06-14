<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
    <title>在线预览</title>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/FlexPaper/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/FlexPaper/js/flexpaper_flash.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/FlexPaper/js/flexpaper_flash_debug.js"></script>
</head>
<%--  <%=(String)session.getAttribute("fileName")%>  --%>
<body>
<div style="position:absolute;left:10px;top:10px;">
    <%-- 指定flexPaper的宽度和高度  --%>
    <a id="viewerPlaceHolder" style="width: 860px;height:500px;display:block"></a>
    <script type="text/javascript">

        <%--  var contextPath = "${pageContext.request.contextPath }";--%>
         var fp = new FlexPaperViewer(
                 'static/FlexPaper/swfFiles/FlexPaperViewer',
                 'viewerPlaceHolder',     <!--对应于a 标签的id-->
                 { config : {
                     SwfFile : escape("${filePath}"),  <!--导入的.swf的路径,文件名称使用英语表示，中文时显示不出来，暂时未解决这个问题-->
                     Scale : 0.6,
                     ZoomTransition : 'easeOut',//变焦过渡
                     ZoomTime : 0.5,
                     ZoomInterval : 0.2,//缩放滑块-移动的缩放基础[工具栏]
                     FitPageOnLoad : true,//自适应页面
                     FitWidthOnLoad : true,//自适应宽度
                     FullScreenAsMaxWindow : false,//全屏按钮-新页面全屏[工具栏]
                     ProgressiveLoading : false,//分割加载
                     MinZoomSize : 0.2,//最小缩放
                     MaxZoomSize : 3,//最大缩放
                     SearchMatchAll : true,
                     InitViewMode : 'Portrait',//初始显示模式(SinglePage,TwoPage,Portrait)

                     ViewModeToolsVisible : true,//显示模式工具栏是否显示
                     ZoomToolsVisible : true,//缩放工具栏是否显示
                     NavToolsVisible : true,//跳页工具栏
                     CursorToolsVisible : false,
                     SearchToolsVisible : true,
                     PrintPaperAsBitmap:false,
                     localeChain: 'en_US'
                }});
    </script>
</div>
</body>
</html>
