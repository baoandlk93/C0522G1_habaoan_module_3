<%--
  Created by IntelliJ IDEA.
  User: TUF
  Date: 30/08/2022
  Time: 8:34 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
<%@include file="/view/header.jsp" %>
<%
    // Kiểm tra vai trò của người dùng
    HttpSession httpSession = request.getSession(false);
    if (httpSession != null && httpSession.getAttribute("role").equals("ADMIN")) {
%>
<p>Welcome, <%= httpSession.getAttribute("username") %>
</p>
<form method="post">
    <div class="container-fluid">
        <div class="input-group">
            <p class="input-group-text"></p>
            <input type="text" class="form-control" name="name" placeholder="Customer Name">
        </div>
        <div class="input-group">
            <p class="input-group-text"></p>
            <p><input type="text" id="datepicker" name="dayOfBirth" class="form-control"
                      placeholder="Customer Birthday"></p>
            <%--            <input type="date" name="dayOfBirth">--%>
        </div>
        <div class="form-floating">
            <select class="form-select" id="floatingSelect" name="gender" aria-label="Floating label select example">
                <option selected> Select gender</option>
                <option value="1">Male</option>
                <option value="0">Female</option>
            </select>
            <%--            <label for="floatingSelect">Works with selects</label>--%>
        </div>
        <div class="input-group">
            <p class="input-group-text"></p>
            <input type="text" class="form-control" name="idCard" placeholder="Customer ID Card">
        </div>
        <div class="input-group">
            <p class="input-group-text"></p>
            <input type="text" class="form-control" name="phoneNumber" placeholder="Customer Phone Number">
        </div>
        <div class="input-group">
            <p class="input-group-text"></p>
            <input type="text" class="form-control" name="email" placeholder="Email">
        </div>
        <div class="input-group">
            <p class="input-group-text"></p>
            <input type="text" class="form-control" name="customerAddress" placeholder="Customer Address">
        </div>
        <div class="input-group">
            <p class="input-group-text"></p>
            <input type="text" class="form-control" name="customerTypeID" placeholder="Customer Type ID">
        </div>
        <div class="input-group">
            <button class="btn btn-lg btn-success" type="submit" value="create">Create</button>
        </div>
    </div>
</form>
<%
    } else {
        response.sendRedirect("login.jsp");
    }
%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>

<script>
    $(function () {
        $("#datepicker").datepicker({
            defaultDate: +9,
            duration: "slow",
            changeYear: true,
            minDate: "-80Y",
            maxDate: "-18Y",
            showOtherMonths: true,
            selectOtherMonths: true,
            showOn: "button",
            buttonImage: "images/calendar.gif",
            buttonImageOnly: true,
            buttonText: "Select date"
        });
    });
</script>
<%@include file="/view/footer.jsp" %>
</body>
</html>
