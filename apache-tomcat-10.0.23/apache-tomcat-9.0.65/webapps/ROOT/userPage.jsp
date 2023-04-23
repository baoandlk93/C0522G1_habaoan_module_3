<%--
  Created by IntelliJ IDEA.
  User: LAPTOP MAY
  Date: 4/22/2023
  Time: 11:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>User Page</h2>
<%
  // Kiểm tra vai trò của người dùng
  HttpSession httpSession = request.getSession(false);
  if (httpSession != null && httpSession.getAttribute("role").equals("USER")|| httpSession.getAttribute("role").equals("ADMIN")) {
%>
<p>Welcome, <%= httpSession.getAttribute("username") %></p>
<p>You have user privileges</p>
<%
  } else {
    response.sendRedirect("login.jsp");
  }
%>
</body>
</html>
