<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>牛刀小试</title>
    <link rel="stylesheet" type="text/css" href="style/style.css">
</head>
<body>

<%@ include file="header.jsp" %>

<div id="main">
    <%@ include file="siderbar.jsp" %>
    <div id="content">
        <%
            String errMsg = request.getParameter("errMsg");
            if (errMsg != null) {
                out.print("<h3 style='color:red'>" + errMsg + "</h3>");
            }
        %>
        <form action="registerProcess.jsp" method="post">
            用户名：
            <label><input type="text" name="name"></label>
            <br><br>
            密码：<label><input type="text" name="pwd"></label>
            <br><br>
            性别：<label><input type="radio" name="gender" value="male" checked></label>男
            <label><input type="radio" name="gender" value="female"></label>女
            <br><br>
            地区：
            <label><select name="area">
                <option value="Pudong" selected>浦东</option>
                <option value="Puxi">浦西</option>
            </select></label>
            <br><br>
            感兴趣的商品种类：
            <label><input type="checkbox" name="favorite" value="book"></label>图书
            <label><input type="checkbox" name="favorite" value="digital"></label>数码
            <label><input type="checkbox" name="favorite" value="stationery"></label>文具
            <br><br>
            <input type="submit">
            <input type="reset">
        </form>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
