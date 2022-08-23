<%--
  Created by IntelliJ IDEA.
  User: TUF
  Date: 23/08/2022
  Time: 1:58 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
<div class="p-3 mb-2 bg-primary text-white">
    <h1>
        Thông tin người dùng nhập vào
    </h1>
</div>
<div class="p-3 mb-2 bg-success text-white">
    <p>
        Mô tả sản phẩm ${n1}
    </p>
</div>
<div class="p-3 mb-2 bg-info text-dark">
    <p>
        Giá niêm yết sản phẩm ${n2}
    </p>
</div>
<div class="p-3 mb-2 bg-warning text-dark">
    <p>
        Tỷ lệ chiết khấu ${n3}
    </p>
</div>
<div class="p-3 mb-2 bg-dark text-white">

</div>
<h2>
    Kết quả sau tính toán
</h2>
<p> Lượng chiết khấu ${n4}</p>
<p> Giá sau khi chiếu khấu ${n5}</p>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
