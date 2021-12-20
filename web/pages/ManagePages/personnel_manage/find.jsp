<%@ page import="java.util.List" %><%--
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
            <h1 class="m-0">用户查找</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Starter Page</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <div class="content">
      <div class="container-fluid">
        <div class="card">
          <div class="card-header">
            <%-- 提交要查询用户名的表单，如果没有填则查询全部 --%>
            <div class="row">
              <div class="col-md-6">
                <form action="${pageContext.request.contextPath}/pages/Processes/personnel_manage/findProcess.jsp"
                      method="post">
                  <div class="row">
                    <label for="name" class="col-3 col-form-label">名字</label>
                    <div class="col-6">
                      <input type="text" name="name" class="form-control" id="name" placeholder="Name">
                    </div>
                    <div class="col-3">
                      <button type="submit" class="btn btn-info">查询</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
          <div class="card-body">
            <%
              List<User> user_list = (List<User>) session.getAttribute("user_list");
              if (user_list != null) {
                // 输出表
                out.println("<table id=\"table\" class=\"table table-bordered table-hover\">");
                // 表头
                out.print(User.getHTMLTableHeader());
                // 表内容
                for (User u : user_list) {
                  if (u != null) {
                    out.print(u.toHTMLTableRow());
                  }
                }
                out.println("</table>");
              }

              // 删除查询结果
              session.removeAttribute("user_list");
            %>
          </div>
        </div>
        <%-- card --%>
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <%-- 页面内容 --%>


  <%-- 底边栏 --%>
  <%@include file="/pages/Components/footer.jsp" %>
</div>
<%-- wapper --%>


<%-- js框架支持 --%>
<%@include file="/pages/Components/script_require.jsp" %>

<script>
    $("#table").DataTable({
        "paging": true,
        "lengthChange": true,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false,
        "responsive": true,
    });
</script>
</body>
</html>

