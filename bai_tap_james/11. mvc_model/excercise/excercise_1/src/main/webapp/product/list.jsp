<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<h1>Products</h1>
<p>
    <a href="/products?action=create">Create new product</a>
</p>
<table border="1">
    <tr>
        <td>Product Code</td>
        <td>Product Name</td>
        <td>Manufacturer</td>
        <td>Price</td>
        <td>Product Info</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td>
                <a href="/products?action=view&id=${product.getId()}">${product.getProductCode()}</a>
            </td>
            <td>${product.getProductName()}</td>
            <td>${product.getManufacturer()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getProductInfo()}</td>
            <td>
                <a href="/products?action=edit&id=${product.getId()}">edit</a>
            </td>
            <td>
                <a href="/products?action=delete&id=${product.getId()}">delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>