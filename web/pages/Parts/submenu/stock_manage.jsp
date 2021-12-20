<%--
  Created by IntelliJ IDEA.
  User: qwe22
  Date: 2021-12-19
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<li class="nav-item">
  <a href="#" class="nav-link">
    <i class="nav-icon fas fa-tachometer-alt"></i>
    <p>
      库存管理
      <i class="right fas fa-angle-left"></i>
    </p>
  </a>
  <ul class="nav nav-treeview">
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/pages/ManagePages/personnel_manage/find.jsp" class="nav-link">
        <i class="far fa-circle nav-icon"></i>
        <p>库存查询</p>
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/pages/ManagePages/personnel_manage/add.jsp" class="nav-link">
        <i class="far fa-circle nav-icon"></i>
        <p>入库操作</p>
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/pages/ManagePages/personnel_manage/add.jsp" class="nav-link">
        <i class="far fa-circle nav-icon"></i>
        <p>出库操作</p>
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/pages/ManagePages/personnel_manage/add.jsp" class="nav-link">
        <i class="far fa-circle nav-icon"></i>
        <p>进出库查询</p>
      </a>
    </li>
  </ul>
</li>