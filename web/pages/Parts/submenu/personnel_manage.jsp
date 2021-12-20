<%--
  Created by IntelliJ IDEA.
  User: qwe22
  Date: 2021-12-19
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<li class="nav-item" id="personnel_submenu">
  <a href="#" class="nav-link" id="personnel_submenu_head">
    <i class="nav-icon fas fa-user-friends"></i>
    <p>
      人员管理
      <i class="right fas fa-angle-left"></i>
    </p>
  </a>
  <ul class="nav nav-treeview">
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/pages/ManagePages/personnel_manage/find.jsp" class="nav-link"
         id="person_find">
        <i class="far fa-circle nav-icon"></i>
        <p>人员查询</p>
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/pages/ManagePages/personnel_manage/add.jsp" class="nav-link"
         id="person_add">
        <i class="far fa-circle nav-icon"></i>
        <p>人员添加</p>
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/pages/ManagePages/personnel_manage/update.jsp" class="nav-link"
         id="person_update">
        <i class="far fa-circle nav-icon"></i>
        <p>人员修改</p>
      </a>
    </li>
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/pages/ManagePages/personnel_manage/delete.jsp" class="nav-link"
         id="person_delete">
        <i class="far fa-circle nav-icon"></i>
        <p>人员删除</p>
      </a>
    </li>
  </ul>
</li>