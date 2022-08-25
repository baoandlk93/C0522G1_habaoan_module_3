<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<h1>Delete Product</h1>
<p>
    <a href="/products">Back to Product list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Product Code:</td>
                <td>${requestScope["product"].getProductCode()}</td>
            </tr>
            <tr>
                <td>Product Name:</td>
                <td>${requestScope["product"].getProductName()}</td>
            </tr>
            <tr>
                <td>Manufacturer:</td>
                <td>${requestScope["product"].getManufacturer()}</td>
            </tr>
            <tr>
                <td>Price:</td>
                <td>${requestScope["product"].getPrice()}</td>
            </tr>
            <tr>
                <td>Product Info:</td>
                <td>${requestScope["product"].getProductInfo()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete customer"></td>
                <td>
                    <a href="/products">Back to Product list</a>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>