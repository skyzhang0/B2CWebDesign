<%--
  Created by IntelliJ IDEA.
  User: qwe22
  Date: 2021-12-19
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="Entity.User.*" %>

<li class="nav-item" >
  <a href="${pageContext.request.contextPath}/index.jsp" class="nav-link" id="user_info">
    <i class="nav-icon fas fa-th"></i>
    <p>
      个人信息
    </p>
  </a>
</li>

<%-- 获取当前用户 --%>
<% User user1 = (User) session.getAttribute("user"); %>
<%-- 存储要添加的子菜单 --%>
<% String abs_add_menu; %>

<%
  //  查看user是不是超级管理员，如果是超级管理员则加上人员管理模块
  abs_add_menu = "/pages/empty.jsp";
  if (user1 != null && user1.getType().equals("Administrator")) {
    abs_add_menu = "/pages/Parts/submenu/personnel_manage.jsp";
  }
%>
<jsp:include page="<%=abs_add_menu%>"/>

<%
  // 查看user是不是超级管理员，如果是超级管理员则加上商品管理模块
  abs_add_menu = "/pages/empty.jsp";
  if (user1 != null && user1.getType().equals("Administrator")) {
    abs_add_menu = "/pages/Parts/submenu/good_manage.jsp";
  }
%>
<jsp:include page="<%=abs_add_menu%>"/>

<%
  //  查看user是不是超级管理员，如果是超级管理员则加上销售管理模块
  abs_add_menu = "/pages/empty.jsp";
  if (user1 != null && user1.getType().equals("Administrator")) {
    abs_add_menu = "/pages/Parts/submenu/sell_manage.jsp";
  }
%>
<jsp:include page="<%=abs_add_menu%>"/>

<%
  //  查看user是不是超级管理员，如果是超级管理员则加上库存管理模块
  abs_add_menu = "/pages/empty.jsp";
  if (user1 != null && user1.getType().equals("Administrator")) {
    abs_add_menu = "/pages/Parts/submenu/stock_manage.jsp";
  }
%>
<jsp:include page="<%=abs_add_menu%>"/>

<%
  //  查看user是不是超级管理员，如果是超级管理员则加上验收管理模块
  abs_add_menu = "/pages/empty.jsp";
  if (user1 != null && user1.getType().equals("Administrator")) {
    abs_add_menu = "/pages/Parts/submenu/check_manage.jsp";
  }
%>
<jsp:include page="<%=abs_add_menu%>"/>

<%
  //  查看user是不是超级管理员，如果是超级管理员则加上采购管理模块
  abs_add_menu = "/pages/empty.jsp";
  if (user1 != null && user1.getType().equals("Administrator")) {
    abs_add_menu = "/pages/Parts/submenu/order_manage.jsp";
  }
%>
<jsp:include page="<%=abs_add_menu%>"/>