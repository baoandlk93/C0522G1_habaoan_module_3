<%--
Created by IntelliJ IDEA.
User: TUF
Date: 02/09/2022
Time: 3:18 CH
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
<body>
<div class="d-flex justify-content-center">

    <form method="post" class="w-50 border border-2 border-success p-3 rounded form-signin">
        <select id="service" onchange="myFunction(this.value)" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
            <option> -- Choose Service --</option>
            <option value="villa">Villa</option>
            <option value="room"> Room</option>
            <option value="house"> House</option>
        </select>
        <div class="container justify-content-center">
            <div class="input-group" style="display: block">
                <p class="input-group-text">
                    <input type="text" class="form-control" name="name" placeholder="Service Name">
                </p>
            </div>
            <div class="input-group" style="display: block">
                <p class="input-group-text">
                    <input type="text" class="form-control" name="area" placeholder="Service Area">
                </p>
            </div>
            <div class="input-group " style="display: block">
                <p class="input-group-text">
                    <input type="text" class="form-control" name="cost" placeholder="Service Cost">
                </p>
            </div>
            <div class="input-group" style="display: block">
                <p class="input-group-text">
                    <input type="text" class="form-control" name="maxPeople" placeholder="Service Max People">
                </p>
            </div>
            <div class="input-group" style="display: block">
                <p class="input-group-text">
                    <input type="text" class="form-control" name="rentTypeID" placeholder="Rent Type ID">
                </p>
            </div>
            <div class="input-group" id="villa1" style="display: block">
                <p class="input-group-text">
                    <input type="text" class="form-control" name="standardRoom" placeholder="Standard Room">
                </p>
            </div>
            <div class="input-group" id="villa2" style="display: none">
                <p class="input-group-text">
                    <input type="text" class="form-control" name="descriptionOtherConvenience"
                           placeholder="Description Other Convenience">
                </p>
            </div>
            <div class="input-group" id="villa3" style="display: none">
                <p class="input-group-text">
                    <input type="text" class="form-control" name="poolArea" placeholder="Pool Area">
                </p>
            </div>
            <div class="input-group" id="villa4" style="display: none">
                <p class="input-group-text">
                    <input type="text" class="form-control" name="numberOfFloors" placeholder="Number Of Floors">
                </p>
            </div>
            <div class="input-group" id="room" style="display: none">
                <p class="input-group-text intro">
                    <input type="text" class="form-control" name="facilityFree" placeholder="Free Service">
                </p>

            </div>
            <div class="input-group">
                <button class="btn btn-lg btn-success" type="submit" value="create">Create</button>
            </div>
        </div>
    </form>
</div>
<script>
    function myFunction(value) {
        switch (value) {
            case "villa":
                document.getElementById("villa1").style.display = "block";
                document.getElementById("villa2").style.display = "block";
                document.getElementById("villa3").style.display = "block";
                document.getElementById("villa4").style.display = "block";
                break;
            case "house":
                document.getElementById("villa1").style.display = "none";
                document.getElementById("villa2").style.display = "none";
                document.getElementById("villa3").style.display = "none";
                document.getElementById("villa4").style.display = "none";
                document.getElementById("villa1").style.display = "block";
                document.getElementById("villa2").style.display = "block";
                document.getElementById("villa4").style.display = "block";
                break;
            case "room":
                document.getElementById("villa1").style.display = "none";
                document.getElementById("villa2").style.display = "none";
                document.getElementById("villa3").style.display = "none";
                document.getElementById("villa4").style.display = "none";
                document.getElementById("room").style.display = "block";
                break;
            default:

        }
    }
</script>
<%@include file="/view/footer.jsp" %>
</body>
</html>
