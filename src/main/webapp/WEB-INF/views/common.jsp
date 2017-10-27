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
<script src="<%=basePath%>js/jquery-2.1.4.min.js"></script>
<link href="<%=basePath%>/css//bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]-->
<script src="<%=basePath%>/js/html5shiv.js"></script>
<script src="<%=basePath%>/js/respond.min.js"></script>

<script src="<%=basePath%>/js//bootstrap.min.js"></script>
