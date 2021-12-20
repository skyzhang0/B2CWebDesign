<%--
  Created by IntelliJ IDEA.
  User: qwe22
  Date: 2021-12-19
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<li class="nav-item">
  <a href="#" class="nav-link">
    <i class="nav-icon fas fa-tachometer-alt"></i>
    <p>
      验收管理
      <i class="right fas fa-angle-left"></i>
    </p>
  </a>
  <ul class="nav nav-treeview">
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/pages/ManagePages/check_manage/find.jsp" class="nav-link">
        <i class="far fa-circle nav-icon"></i>
        <p>验收查询</p>
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/pages/ManagePages/check_manage/check.jsp" class="nav-link">
        <i class="far fa-circle nav-icon"></i>
        <p>新增验收</p>
      </a>
    </li>
  </ul>
</li>