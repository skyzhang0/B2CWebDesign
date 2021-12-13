<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>牛刀小试</title>
    <link rel="stylesheet" type="text/css" href="style/style.css">
</head>
<body>

<%@ include file="header.jsp"%>

<div id="main">
    <%@ include file="siderbar.jsp"%>
    <div id="content">
        <%
            String errMsg = request.getParameter("errMsg");
            if(errMsg!=null){
                out.print("<h3 style='color:red'>"+errMsg+"</h3>");
            }
        %>
        <form action="registerProcess.jsp" method="post">
            用户名：
            <input type="text" name="name">
            <br><br>
            密码：
            <input type="text" name="pwd">
            <br><br>
            性别：
            <input type="radio" name="gender" value="male" checked>男
            <input type="radio" name="gender" value="female">女
            <br><br>
            地区：
            <select name="area">
                <option value="Pudong" selected>浦东</option>
                <option value="Puxi">浦西</option>
            </select>
            <br><br>
            感兴趣的商品种类：
            <input type="checkbox" name="favorite" value="book">图书
            <input type="checkbox" name="favorite" value="digital">数码
            <input type="checkbox" name="favorite" value="stationery">文具
            <br><br>
            <input type="submit">
            <input type="reset">
        </form>
    </div>
</div>

<%@ include file="footer.jsp"%>

</body>
</html>
