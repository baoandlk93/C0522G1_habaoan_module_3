<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <meta charset="UTF-8">
    <title>Home</title>
    <style>
        a {
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<%@include file="/view/header.jsp" %>

<div class="p-3">
    <h2 class="text-center fw-bold">SERVICE LIST</h2>

    <table class="table table-striped table-bordered border border-3 border-secondary">
        <tr class="text-center bg-info">
            <th>Number</th>
            <th>Name</th>
            <th>Area</th>
            <th>Cost</th>
            <th>Max People</th>
            <th>Rent Type ID</th>
            <th>Facility Type ID</th>
            <th>Standard Room</th>
            <th>Description Other Convenience</th>
            <th>Pool Area</th>
            <th>Number Of Floor</th>
            <th>Facility free</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>

        <c:forEach varStatus="status" var="facility" items="${facility}">
            <tr>
                <td class="text-center">${status.count}</td>
                <td>${facility.name}</td>
                <td class="text-center">${facility.area}</td>
                <td class="text-center">${facility.cost}</td>
                <td class="text-center">${facility.maxPeople}</td>
                <td class="text-center">${facility.rentTypeID}</td>
                <td class="text-center">${facility.facilityTypeID}</td>
                <td class="text-center">${facility.standardRoom}</td>
                <td class="text-center">${facility.descriptionOtherConvenience}</td>
                <td class="text-center">${facility.poolArea}</td>
                <td class="text-center">${facility.numberOfFloors}</td>
                <td class="text-center">${facility.facilityFree}</td>
                <td class="text-center"><a href="/facility?action=edit&id=${facility.getId()}">
                    <span class="fa-solid fa-user-pen text-primary h4 m-auto"></span>
                </a></td>
                <td class="text-center"><a href="/facility?action=delete&id=${facility.getId()}">
                    <i class="fa-solid fa-circle-minus"></i>
                </a></td>
            </tr>
        </c:forEach>
    </table>
</div>

<%@include file="/view/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>

</script>
</body>
</html>