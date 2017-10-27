<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%@ include file="common.jsp" %>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Data Exchange Platform</title>
    <![endif]-->
    <link href="<%=basePath%>/css/index.css" rel="stylesheet">

</head>

<body>
<!-- 顶部导航 -->
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" id="menu-nav">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Switch导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Data Exchange Platform，DEP</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class=""><a href="#ad-carousel">summarize</a></li>
                <li><a href="#summary-container">sketch</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">feature <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#feature-tab" data-tab="tab-chrome">atomicity</a></li>
                        <li><a href="#feature-tab" data-tab="tab-firefox">consistency</a></li>
                        <li><a href="#feature-tab" data-tab="tab-safari">isolation</a></li>
                        <li><a href="#feature-tab" data-tab="tab-opera">durability</a></li>
                    </ul>
                </li>
                <li><a href="#" data-toggle="modal" data-target="#about-modal">about</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- 主要内容 -->
<div class="container">
    <form role="form" id="addForm" method="post">
        <!--状态表格-->
        <table class="table table-hover">
            <caption>Data Tabulate</caption>
            <thead>
            <tr>
                <th>id&nbsp;&nbsp;&nbsp;</th>
                <th>name</th>
                <th>group</th>
                <th>状态&nbsp;&nbsp;</th>
                <th>cron表达式</th>
                <th>描述</th>
                <th>同步否</th>
                <th>类路径</th>
                <th>spring id</th>
                <th>方法名</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody>
            <tr>
                <td>n</td>
                <td><input type="text" name="jobName" id="jobName"></input></td>
                <td><input type="text" name="jobGroup" id="jobGroup"></input></td>
                <td>默认未开启<input type="hidden" name="jobStatus" value="0"></input></td>
                <td><input type="text" name="cronExpression"
                           id="cronExpression"></input></td>
                <td><input type="text" name="description" id="description"></input></td>
                <td><select name="isConcurrent" id="isConcurrent">
                    <option value="1">1</option>
                    <option value="0">0</option>
                </select></td>
                <td><input type="text" name="beanClass" id="beanClass"></input></td>
                <td><input type="text" name="springId" id="springId"></input></td>
                <td><input type="text" name="methodName" id="methodName"></input></td>
                <td><input type="button" onclick="add()" value="保存"/></td>
            </tr>
            <c:forEach var="job" items="${taskList}">
                <tr>
                    <td>${job.jobId }</td>
                    <td>${job.jobName }</td>
                    <td>${job.jobGroup }</td>
                    <td>${job.jobStatus }
                        <c:choose>
                            <c:when test="${job.jobStatus=='1' }">
                                <a href="javascript:;"
                                   onclick="changeJobStatus('${job.jobId}','stop')">停止</a>&nbsp;
                            </c:when>
                            <c:otherwise>
                                <a href="javascript:;"
                                   onclick="changeJobStatus('${job.jobId}','start')">开启</a>&nbsp;
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${job.cronExpression }</td>
                    <td>${job.description }</td>
                    <td>${job.isConcurrent }</td>
                    <td>${job.beanClass }</td>
                    <td>${job.springId }</td>
                    <td>${job.methodName }</td>
                    <td><a href="javascript:;" onclick="updateCron('${job.jobId}')">更新cron</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <span id="pageid"><nav aria-label="Page navigation">
            <ul class="pagination">
                <li class="disabled">
      <span>
        <span aria-hidden="true">&laquo;</span>
      </span>
                </li>
                <li class="active">
                    <span>1 <span class="sr-only">(current)</span></span>
                </li>
                <li><span>2 <span class="sr-only">(current)</span></span></li>
                <li><span>3 <span class="sr-only">(current)</span></span></li>
                <li><span>4 <span class="sr-only">(current)</span></span></li>
                <li><span>5 <span class="sr-only">(current)</span></span></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav></span>
    </form>
    <textarea class="form-control" rows="3"></textarea>
    <!-- 关于 -->
    <div class="modal fade" id="about-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">close</span></button>
                    <h4 class="modal-title" id="modal-label">about</h4>
                </div>
                <div class="modal-body">
                    <p>
                        1988年我还在大学时，花了1000块钱买了一台二手复印机勤工俭学，开始了我的第一次创业；创立立思辰之前，为寻求新的商机和突破，出国考察，在圣地亚哥的草地上和朋友一起畅谈企业未来的发展模式，碰撞出来了办公信息系统服务外包的方向，那是我的第二次创业；2009年，立思辰终于成为中国创业板首批企业之一，从这个时刻起，我称之为第三次创业。每一次成绩的取得，对立思辰来说只是意味着又一次创业的开始，意味着一个更高的起点，意味着更快发展的开始。立思辰是一家通过不断创业发展起来的企业，所以直到2016年的今天，我们依然走在创业的路上。</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">yes</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">no</button>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <p class="pull-right"><a href="#top">top</a></p>
        <p>&copy; 2017 lannum </p>
    </footer>

</div>
</body>
<script src="<%=basePath%>/js/index.js"></script>
</html>
