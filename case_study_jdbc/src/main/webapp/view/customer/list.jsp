<%--
  Created by IntelliJ IDEA.
  User: TUF
  Date: 27/08/2022
  Time: 12:51 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h1 style="background-color: #7abaff; text-align: center">Customer List</h1>
<table class="table table-bordered table-striped table-responsive table-info table-active">
    <thead>
    <tr>
        <th scope="col">Name</th>
        <th scope="col">Birthday</th>
        <th scope="col">Gender</th>
        <th scope="col">ID card</th>
        <th scope="col">Phone Number</th>
        <th scope="col">Email</th>
        <th scope="col">Customer Type ID</th>
        <th scope="col">Address</th>
        <th scope="col">Edit</th>
        <th scope="col">Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customers}" var="customers">
        <tr>
            <td><c:out value="${customers.name}"></c:out></td>
            <td><c:out value="${customers.dateOfBirth}"></c:out></td>
            <td><c:out value="${customers.gender}"></c:out></td>
            <td><c:out value="${customers.id}"></c:out></td>
            <td><c:out value="${customers.phoneNumber}"></c:out></td>
            <td><c:out value="${customers.customerType}"></c:out></td>
            <td><c:out value="${customers.customerAddress}"></c:out></td>
            <td>
                <a href="/user?action=edit&id=${user.id}"><i class="fa-solid fa-pen-to-square"></i></a>
            </td>
            <td>
                <button onclick="objdelete('${user.id}' ,'${user.name}')"
                        data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <a href="#"><i class="fa-solid fa-trash-can"></i></a>
                </button>

            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>
</body>
</html>