<%@ page import="com.example.userService.UserService" %><%--
  Created by IntelliJ IDEA.
  User: FastPc
  Date: 2023-06-08
  Time: 오후 5:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF8");
    UserService userService = new UserService();
    String name = request.getParameter("name");
    int age = Integer.parseInt(request.getParameter("age"));
    String gender = request.getParameter("gender");
    userService.addUser(name, age, gender);


    response.sendRedirect("/");

%>

</body>
</html>
