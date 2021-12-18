<%--
  Created by IntelliJ IDEA.
  User: qwe22
  Date: 2021-12-18
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@include file="Components/header.jsp" %>
<body class="hold-transition">
<div class="error-page">
  <h2 class="headline text-warning"> 404</h2>

  <div class="error-content">
    <h3><i class="fas fa-exclamation-triangle text-warning"></i> Oops! Page not found.</h3>
    <p>
      We could not find the page you were looking for.
      Meanwhile, you may <a href="${pageContext.request.contextPath}/index.jsp">return to home</a>.
    </p>
  </div>
  <!-- /.error-content -->
</div>
<!-- /.error-page -->

<%@include file="Components/script_require.jsp" %>
</body>
</html>
