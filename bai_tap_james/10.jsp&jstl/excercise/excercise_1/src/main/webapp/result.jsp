<%--
  Created by IntelliJ IDEA.
  User: TUF
  Date: 23/08/2022
  Time: 9:39 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h2 style="text-align: center">Danh sách khách hàng</h2>
<table class="table">
  <thead>
  <tr>
    <th scope="col">Tên</th>
    <th scope="col">Ngày sinh</th>
    <th scope="col">Địa chỉ</th>
    <th scope="col">Ảnh</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>${n1}</td>
    <td>${n2}</td>
    <td>${n3}</td>
    <td>
      ${n4}
    </td>
  </tr>
  <tr>
    <td>Nguyễn Văn Nam</td>
    <td>1983-08-21</td>
    <td>Bắc Giang</td>
    <td>
      <img src="#">
    </td>
  </tr>
  <tr>
    <td>Nguyễn Thái Hòa</td>
    <td>1983-08-22</td>
    <td>Nam Định</td>
    <td>
      <img src="#">
    </td>
  </tr>
  <tr>
    <td scope="row">Trần Đăng Khoa</td>
    <td>1983-08-17</td>
    <td>Hà Tây</td>
    <td>
      <img src="#">
    </td>
  </tr>
  <tr>
    <td>Nguyễn Đình Thi</td>
    <td>1983-08-19</td>
    <td>Hà Nội</td>
    <td>
      <img src="#">
    </td>
  </tr>
  </tbody>
</table>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
