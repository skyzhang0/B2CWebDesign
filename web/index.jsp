<%--
  Created by IntelliJ IDEA.
  User: qwe22
  Date: 2021-12-17
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<%-- header --%>
<%@include file="/pages/Components/header.jsp" %>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <%-- 导航栏 --%>
  <%@include file="/pages/Components/navbar.jsp" %>
  <%-- 侧边栏 --%>
  <%@include file="/pages/Components/sidebar.jsp" %>

  <%-- 页面内容 --%>
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">欢迎来到进销存管理系统!</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item">主页</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <%-- 此处没有登录显示登录注册选项，已登录显示用户信息 --%>

    <%
      String inc_content;
      user = (User) session.getAttribute("user");
      if (user == null) {
        inc_content = "/pages/Parts/login_comment_card.jsp";
      } else {
        inc_content = "/pages/Parts/user_info_card.jsp";
      }
    %>

    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <jsp:include page="<%=inc_content%>"/>
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <%-- 页面内容 --%>


  <%-- 底边栏 --%>
  <%@include file="/pages/Components/footer.jsp" %>
</div>
<%-- wapper --%>

<script>
    // 修改菜单的active
    const ori_class_name = document.getElementById("user_info").className;
    document.getElementById("user_info").className = ori_class_name + " active";
</script>

<%-- js框架支持 --%>
<%@include file="/pages/Components/script_require.jsp" %>

</body>
</html>
