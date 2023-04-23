<%--
  Created by IntelliJ IDEA.
  User: LAPTOP MAY
  Date: 4/22/2023
  Time: 11:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Admin Page</h2>
<%
    HttpSession session1 = request.getSession(false);
    if (session1 != null && session1.getAttribute("role").equals("ADMIN")) {
%>
<p>Welcome, <%= session1.getAttribute("username") %>
</p>
<p>You have admin privileges</p>
<%
    } else {
        response.sendRedirect("login.jsp");
    }
%>
</body>
</html>
