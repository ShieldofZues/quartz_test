<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String rootPath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + "/";
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    request.setAttribute("basePath", basePath);
    request.setAttribute("rootPath", rootPath);
    pageContext.setAttribute("newLineChar", "\n");
%>
<script src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
<link href="<%=basePath%>/css//bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]-->
<script src="<%=basePath%>/js/html5shiv.js"></script>
<script src="<%=basePath%>/js/respond.min.js"></script>
<html>
<style>
    .progress {
        margin: auto;
    }
</style>
<body>
<div class="progress">
    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0"
         aria-valuemax="100">
        <span class="sr-only">45% Complete</span>
    </div>
</div>
</body>
<script type="text/javascript">
    function setProcess() {
        var wd;
        wd = $(".active").css("width");
        if(parseInt(wd.substring(0,wd.length-2))<100 && parseInt(wd.substring(0,wd.length-2))<200 ){
            $(".active").css("width",parseInt((wd.substring(0,wd.length-2)))+10);
        }else{
            $(".active").css("width",parseInt((wd.substring(0,wd.length-2)))+1000);
        }
        
        $(".active").innerHTML = wd;
        if(parseInt(wd.substring(0,(wd.length-2))) == parseInt(window.screen.width)){
            window.clearInterval(bartimer);
        }
    }

    var bartimer = window.setInterval(function () {
        setProcess();
    }, 10);
    window.onload = function () {
        bartimer;
    }
</script>
</html>
