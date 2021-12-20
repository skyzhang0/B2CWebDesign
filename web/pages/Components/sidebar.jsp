<%--
  Created by IntelliJ IDEA.
  User: qwe22
  Date: 2021-12-17
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!-- 侧边栏组件 -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
  <!-- 左上角小标题 -->
  <a href="${pageContext.request.contextPath}/index.jsp" class="brand-link">
    <img src="${pageContext.request.contextPath}/dist/img/Logo.png" alt="Logo"
         class="brand-image img-circle elevation-3" style="opacity: .8">
    <span class="brand-text font-weight-light">进销存管理系统</span>
  </a>

  <!-- 侧边栏 -->
  <div class="sidebar">
    <!-- 用户头像栏 -->
    <%@include file="/pages/Parts/user_panel.jsp" %>

    <!-- 侧边栏总菜单 -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <%@include file="/pages/Parts/sidebar_menu.jsp" %>
      </ul>
    </nav>
    <!-- 侧边栏总菜单 -->
  </div>
  <!-- 侧边栏 -->
</aside>
