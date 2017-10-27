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
    #loadiv {
        margin: auto;
        margin-top: 20%;
        width: 300px;
        height: 2%;
    }
</style>
<body>
<div id="loadiv">
    <div class="progress">
        <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0"
             aria-valuemax="100">
            <span class="sr-only">45% Complete</span>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    function setProcess() {
        var wd;
        wd = $(".active").css("width");
        if (parseInt(wd.substring(0, (wd.length - 2))) > 125 && parseInt(wd.substring(0, (wd.length - 2))) < 140) {
            $(".active").css("width", parseInt((wd.substring(0, wd.length - 2))) + 1);
        } else {
            $(".active").css("width", parseInt((wd.substring(0, wd.length - 2))) + 50);
        }
        $(".active").innerHTML = wd;
        if (parseInt(wd.substring(0, (wd.length - 2))) == 300) {
            window.clearInterval(bartimer);
            $(".active").innerHTML = wd;
            window.location.href = "<%=basePath%>/task/login.htm?rand=" + Math.random();
        }
    }

    var bartimer = window.setInterval(function () {
        setProcess();
    }, 1);
    window.onload = function () {
        bartimer;
    }
    alert("master提交");
</script>
</html>
