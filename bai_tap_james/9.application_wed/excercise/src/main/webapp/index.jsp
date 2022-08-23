<%--
  Created by IntelliJ IDEA.
  User: TUF
  Date: 23/08/2022
  Time: 1:38 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<form action="/discount" method="post" class="">
<div class="mb-3">
    <label for="formGroupExampleInput" class="form-label">Product Description</label>
     <input name="description" type="text" class="form-control" id="formGroupExampleInput">
</div>
<div class="mb-3">
    <label for="formGroupExampleInput2" class="form-label">List Price</label>
     <input name="price" type="text" class="form-control" id="formGroupExampleInput2" placeholder="Another input placeholder">
</div>
<div class="mb-3">
    <label for="formGroupExampleInput" class="form-label">Discount Percent</label>
     <input name="percent" type="text" class="form-control" id="formGroupExampleInput3" placeholder="Example input placeholder">
</div>

    <p>
        <button type="submit" class="btn btn-success">Calculate Discount</button>
    </p>

</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
