<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
<h1>Create new products</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back to Product list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Product Code:</td>
                <td>
                    <input type="text" name="productCode" id="productCode">
                </td>
            </tr>
            <tr>
                <td>Product Name:</td>
                <td>
                    <input type="text" name="productName" id="productName">
                </td>
            </tr>
            <tr>
                <td>Manufacture:</td>
                <td>
                    <input type="text" name="manufacture" id="manufacture">
                </td>
            </tr>
            <tr>
                <td>Price:</td>
                <td>
                    <input type="text" name="price" id="price">
                </td>
            </tr>
            <tr>
                <td>Product Info:</td>
                <td>
                    <input type="text" name="productInfo" id="productInfo">
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="Create Product">
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>