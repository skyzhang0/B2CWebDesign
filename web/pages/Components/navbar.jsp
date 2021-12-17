<%--
  Created by IntelliJ IDEA.
  User: qwe22
  Date: 2021-12-17
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%-- 顶部导航栏 --%>
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- 导航栏左侧 -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="${pageContext.request.contextPath}/index.jsp" class="nav-link">Home</a>
        </li>
    </ul>

    <!-- 导航栏右侧 -->
    <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                <i class="fas fa-expand-arrows-alt"></i>
            </a>
        </li>
    </ul>
</nav>
