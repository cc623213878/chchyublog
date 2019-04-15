<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>Striped </title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="css/5grid/init.js?use=mobile,desktop,1200px,1000px&amp;mobileUI=1&amp;mobileUI.theme=none"></script>
    <noscript>
        <link rel="stylesheet" href="css/5grid/core.css" />
        <link rel="stylesheet" href="css/5grid/core-desktop.css" />
        <link rel="stylesheet" href="css/5grid/core-1200px.css" />
        <link rel="stylesheet" href="css/5grid/core-noscript.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-desktop.css" />
        <link rel="stylesheet" href="css/style-1200px.css" />
    </noscript>
</head>

<body class="left-sidebar">

    <!-- Wrapper -->
    <div id="wrapper">

        <!-- Content -->
        <div id="content" class="mobileUI-main-content">
            <div id="content-inner" style="min-height: 1050px">
                <c:forEach items="${page.list}" var="a" varStatus="st">
                    <!-- Post -->
                    <article class="is-post is-post-excerpt">
                        <header>
                            <h2><a href="ArticleView?mdfile=${a.mdfile}">${a.title}</a></h2>
                            <span class="byline">${a.described}</span>
                        </header>
                        <div class="info">
                            <span class="date">
                                <span class="year">${fn:substring(a.time,0,4)}</span>
                                <span class="month">${fn:substring(a.time,5,7)}</span>
                                <span class="day">${fn:substring(a.time,8,10)}</span>
                            </span>
                            <ul class="stats">
                                <li><a href="#" class="link-icon24 link-icon24-1">16</a></li>
                            </ul>
                        </div>
                    </article>
                </c:forEach>
                <!-- Pager -->
                <div class="pager">
                    <c:if test="${page.pageNum!=1}">
                        <a href=" ?start=${page.pageNum-1}" class="button next">上一页</a>
                    </c:if>
                    <c:if test="${page.pageNum!=page.getPages()}">
                        <a href=" ?start=${page.pageNum+1}" class="button next">下一页</a>
                    </c:if>
                </div>
            </div>
        </div>
        <!-- Sidebar -->
        <%@ include file="template/Sidebar.jsp" %>

    </div>
</body>

</html>