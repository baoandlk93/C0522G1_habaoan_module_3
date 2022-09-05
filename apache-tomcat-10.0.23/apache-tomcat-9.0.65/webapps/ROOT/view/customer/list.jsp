<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.boostrap5.min.css"/>
    <script src="jquery/jquery-3.5.1.min.js"></script>
    <script src="datatables/js/jquery.dataTables.min.js"></script>
    <script src="datatables/js/dataTables.bootstrap5.min.js"></script>

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
    <h2 class="text-center fw-bold">CUSTOMER LIST</h2>

    <table id="tableStudent" class="table table-striped table-bordered border border-3 border-secondary">
        <thead>
        <tr class="text-center bg-info">
            <th>Number</th>
            <th>Name</th>
            <th>Date of Birth</th>
            <th>Gender</th>
            <th>Id card</th>
            <th>Phone number</th>
            <th>Email</th>
            <th>Address</th>
            <th>Customer type</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach varStatus="status" var="customer" items="${customers}">
            <tr>
                <td class="text-center">${status.count}</td>
                <td>${customer.name}</td>
                <td class="text-center">${customer.dateOfBirth}</td>
                <c:if test="${customer.gender}">
                    <td class="text-center">Male</td>
                </c:if>
                <c:if test="${!customer.gender}">
                    <td class="text-center">Female</td>
                </c:if>
                <td class="text-center">${customer.idCard}</td>
                <td class="text-center">${customer.phoneNumber}</td>
                <td>${customer.email}</td>
                <td>${customer.customerAddress}</td>
                <c:forEach var="customerType" items="${customerTypes}">
                    <c:if test="${customerType.id == customer.customerTypeID}">
                        <td class="text-center">${customerType.name}</td>
                    </c:if>
                </c:forEach>
                <td class="text-center"><a href="/customer?action=edit&id=${customer.getId()}">
                    <span class="fa-solid fa-user-pen text-primary h4 m-auto"></span>
                </a></td>
                <td>
                    <button onclick="objdelete('${customer.id}' ,'${customer.name}','${customer.dateOfBirth}',
                    '<c:if test="${customer.gender}">Male</c:if><c:if test="${!customer.gender}">Female</c:if>',
                           '${customer.idCard}',
                            '${customer.phoneNumber}',
                            '${customer.email}',
                            '${customer.customerAddress}',
                            '<c:forEach var="customerType" items="${customerTypes}"><c:if test="${customerType.id == customer.customerTypeID}">${customerType.name}</c:if></c:forEach>')"
                data-bs-toggle="modal" data-bs-target="#exampleModal">
                <a href="#"><i class="fa-solid fa-trash-can"></i></a>
                </button>

                </td>
            </tr>
        </c:forEach></tbody>
    </table>

</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/customer">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" hidden name="id" id="idDelete">
                    <input type="text" hidden name="action" value="delete">
                    <p> Bạn có muốn xóa : </p>
                    <p id="nameDelete"></p>
                    <p id="dateOfBirth"></p>
                    <p id="gender"></p>
                    <p id="idCard"></p>
                    <p id="phoneNumber"></p>
                    <p id="email"></p>
                    <p id="customerAddress"></p>
                    <p id="customerTypes"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="submit" class="btn btn-primary">Có</button>
                </div>
            </div>
        </form>
    </div>
</div>

<%@include file="/view/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
<script>
    function objdelete(id, name, dateOfBirth,gender,idCard,phoneNumber,email,customerAddress,customerTypes) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
        document.getElementById("dateOfBirth").innerText = dateOfBirth;
        document.getElementById("gender").innerText = gender;
        document.getElementById("idCard").innerText = idCard;
        document.getElementById("phoneNumber").innerText = phoneNumber;
        document.getElementById("email").innerText = email;
        document.getElementById("customerAddress").innerText = customerAddress;
        document.getElementById("customerTypes").innerText = customerTypes;
    }
    $(document).ready(function (){
        $('#tableStudent').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>