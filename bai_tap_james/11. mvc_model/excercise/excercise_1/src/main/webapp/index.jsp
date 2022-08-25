<%--
  Created by IntelliJ IDEA.
  User: TUF
  Date: 24/08/2022
  Time: 11:04 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        a{
            text-decoration: none;
            color: blueviolet;
        }
    </style>
</head>
<body>
<form action="/products">
    <input class="form-control me-1" type="search" placeholder="Search" aria-label="Search" name="name" id="name">
    <button class="btn btn-outline-success" type="submit" name="action" value="search">
        Search
    </button>
</form>

<button class="btn btn-outline-success" type="submit">
    <a href="/products">
        Go to Product List
    </a>
</button>
<button class="btn btn-outline-success" type="submit" name="action" value="search">
    <a href="/products?action=create">
        Add new Product
    </a>
</button>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
