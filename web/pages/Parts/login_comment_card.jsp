<%--
  Created by IntelliJ IDEA.
  User: qwe22
  Date: 2021-12-17
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="col-lg-6">
  <div class="card card-primary card-outline">
    <h5 class="card-header">您可以选择：</h5>
    <div class="card-body">
      <div class="row">
        <div class="col-3">
          <a href="${pageContext.request.contextPath}/pages/login.jsp">
            <button type="button" class="btn btn-block btn-success">登录
            </button>
          </a>
        </div>
        <div class="col-3">
          <a href="${pageContext.request.contextPath}/pages/register.jsp">
            <button type="button" class="btn btn-block btn-info">注册
            </button>
          </a>
        </div>
      </div>
    </div>
  </div><!-- /.card -->
</div>
<!-- /.col-md-6 -->
