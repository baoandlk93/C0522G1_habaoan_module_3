<%--
  Created by IntelliJ IDEA.
  User: TUF
  Date: 02/09/2022
  Time: 3:26 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">

</head>
<body>
<%@include file="/view/header.jsp" %>
<form  method="post">
    <div class="container-fluid">
        <div class="input-group">
            <p class="input-group-text"></p>
            <input type="text" class="form-control" name ="name" placeholder="Customer Name">
        </div>
        <div class="input-group">
            <p class="input-group-text"></p>
            <p><input type = "text"   id = "datepicker" name="dayOfBirth" class="form-control" placeholder="Customer Birthday"></p>
            <%--            <input type="date" name="dayOfBirth">--%>
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
            <input type="text" class="form-control"name="email" placeholder="Email">
        </div>
        <div class="input-group">
            <p class="input-group-text"></p>
            <input type="text" class="form-control" name="address" placeholder="Customer Address">
        </div>
        <div class="form-floating">
            <select class="form-select" id="floatingSelect" name="position" aria-label="Floating label select example">
                <option selected> Select Position</option>
                <option value="1">L??? T??n</option>
                <option value="2">Ph???c v???</option>
                <option value="3">Chuy??n vi??n</option>
                <option value="4">Gi??m s??t</option>
                <option value="5">Qu???n l??</option>
                <option value="6">Gi??m ?????c</option>
            </select>
        </div>
        <div class="form-floating">
            <select class="form-select" id="floatingSelect1" name="education" aria-label="Floating label select example">
                <option selected> Select Education</option>
                <option value="1">Trung c???p</option>
                <option value="2">Cao ?????ng</option>
                <option value="3">?????i h???c</option>
                <option value="4">Sau ?????i h???c</option>
            </select>
        </div>
        <div class="form-floating">
            <select class="form-select" id="floatingSelect2" name="division" aria-label="Floating label select example">
                <option selected> Select Position</option>
                <option value="1">Sale-Marketing</option>
                <option value="2">H??nh ch??nh</option>
                <option value="3">Ph???c v???</option>
                <option value="4">Qu???n l??</option>

            </select>
        </div>
        <div class="input-group">
            <p class="input-group-text"></p>
            <input type="number" class="form-control" name="salary" placeholder=" Salary">
        </div>
        <div class="input-group">
            <button class="btn btn-lg btn-success" type="submit" value="create">Create</button>
        </div>
    </div>
</form>







<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script>
    $(function() {
        $( "#datepicker" ).datepicker({
            defaultDate:+9,
            duration: "slow",
            changeYear:true,
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
