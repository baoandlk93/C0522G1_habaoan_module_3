<%--
  Created by IntelliJ IDEA.
  User: TechCare
  Date: 6/30/2022
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="shortcut icon" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIUAAACFCAMAAABCBMsOAAAAxlBMVEX////mfiK9w8fTVACVpab++vbaZBPTUQDXa0V/jI25wMTldQDmfR7WTgC2vcH29/eRqKvX293WWwru8PHo6uvGy86Rnp+IlpfebBfkeR/54dL88uvleA3M0dTngzLh5OV2hIWmsLP5597jlHPKTgrjmnzTVhe/fWDwwKWinJT328joiTvUXCHFcUv21L3DdFDxu5buq3zOYzTsoWm9g2ivkYCcoJ3Lajy6emXpj0jvs4vzybDplVfbbjvVXzLdgFbnqpLZc1TONrkyAAAEmElEQVR4nO2Za1vaMBSARy9k0qbUIlCEiqDzMoqXwZiCTv3/f2pJW8qlFE5CDvPZ+n7wA23K6zknJ0348qWgoKCg4P+jWuseB3VOcNytVf+KQzfQnEpFi6lUHC3oHlqhGjhzgQUVJzhkQKqBlnWIPLTDeXRzHOLUHCYvLBm5DhynfoBw1LYEYp6WGrbEyQ6FmBNcie6uQCThQC2OE5gE00BMShUqwcAr0TpcQqtjSRwLhEKrHONI1EQk0EojELQIMCRq21tmFgcjGIGghKYhBENkliZU1M9WoQmSWKifJsIOGkLPqMlYKF9cgcvYKsoXNcFmkVioniUiS8gC1YUh2rJinH/RoippobZvFRZLfIq6+CQWUhKaptiiLtU7VXctiYUdYWkH74dWLFTvFKsSEghbI5nlTP3OqCs+Vx31e2aZlCDsVYVnCcoeUXgpUb2IxAgGA2u7LBgLHAmxzqW8Y6UI5AQrHxzwfgDn2GAOcGlVvpjKaGBLgJKCmw6gxiEkdh9CIx8/z9l6rINwgLOJrtM4auStKdE19F9IzMA4Pz9iNHra+ntPXes1+KXzcyMwER36F5cTw2gexTR6yxFxYgVG0zAmlxd9JIf2tytKr13DMI7mNJsNo9frGY1mM/2MXXevKb361saQuKFU13VyyzUaiy9dhVkxiVvC7qT0RrnD94Glc0hoxGwQiRQ4IYnutQbflTqYU8su+dGz6dBIWSSimRowhjTy9Uu2NVVYpv0Xq8TwYo2oNPJhRRFJeHyI9aKsSu9YIDitKM46vd+m4d7T+LZWNMa27tRIPCQSTCPONx1O8jzcSZwOnbSSMbb1oELi0Sql+InGj9vNGu7tj0TCXwyyHveXGC1JpBqEXhtZD9e4piQjwTRGezqYqxKphk6uxhN3WcR1J+Or+UV/dZA12m+qjDqlNXw9gYbDnxP+7Rxj8nMY0vklf31QZ69oPFrrz2Ml6iX/McsL/XX/NB6Pn+5/UZp+6rWyg/apjYcNEoyynkIYlP9ZfFTeOEZ+ptxtluDh0HPYGIhYQ7JvtEt2zhOjtJCsAvEyFZFil+TW2LNMZa54lFdFmEI5Lw4RnTMZiZyiWBbxy16cG88r+1sVODKlcbpTIlHhwG61TkUlzOf8opDFfhZtXjfAUAhhCb59mR31oWDB6IgF42Hr/JCmI1SgbQsjFPxlQ6RpTDGqgmNNBUJxhhMKFowzeDBmWKFgwZiBLQZYoWDBGEAlTnEmSEwH2kCnqBbQ+tyyou+PXYJJ9PFqk2PBdmtIfXMOsH+OMBPCUgJ6H28jztPIYgBpXMhlASwMxMaZWEDaJ2q34IA6BsKr3ir2M8ACbT1NLQBbAvMAFoD3vk8Ri09SFy/oFi8Ai1d0i9fdEmYI3O9J0wp3t3Az9JAtvBAwR36vn40pxie/AXXxRlA1fELeABYzqpPt5yF70CoTnUJWs3ZIdOLtPhSRcfA99mxAcTLeaXJApJr4CIq+QyRYx6CZgzN1UEC3SHOCJhGCfzDph1jREJBgvOs0OtJVCnvku4ADz8rs4uOrWj4uZjIHr6ZaJAwKCgoKCvL5A7MydgFh50o7AAAAAElFTkSuQmCC">
    <title>Thêm người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="../../../bootstrap-5.0.2-dist/css/bootstrap.css">
    <style>
        td {
            text-align: center;
        }
        th{
            text-align: center;
        }
        a{
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
            color: blue;
        }
        body{
            background-color: #e3e3ff;
            font-family: Arial, sans-serif
        }

    </style>
</head>
<body>
<center>
    <h3>Quản lý người dùng</h3>
    <h6>
        <a href="/user?action=create"><i class="fa-solid fa-plus"></i> Thêm người dùng</a>
    </h6>
    <form action="/user?action=search">
        <input type="text" name="countrySearch">
        <input type="submit" name="action" value="search">

    </form>
    <form action="/user?action=sort" class="d-flex justify-conten-end" style="margin-left: 20px">
        <input type="submit" name="action" value="sort">
    </form>
    <c:if test=" ${mess != null}">
        <span>${mess}</span>
    </c:if>

</center>
<div align="center">
    <table class="table table-striped">

        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
            <th>Actions</th>
            <%--            <th>Actions</th>--%>

        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/user?action=edit&id=${user.id}"><i class="fa-solid fa-pen-to-square"></i></a>
                </td>
                    <%--                <td>--%>
                    <%--                    <a href="/user?action=delete&id=${user.id}"><i class="fa-solid fa-trash-can"></i></a>--%>
                    <%--                </td>--%>
                <td>
                    <button onclick="objdelete('${user.id}' ,'${user.name}')"
                            data-bs-toggle="modal" data-bs-target="#exampleModal">
                        <a href="#"><i class="fa-solid fa-trash-can"></i></a>
                    </button>

                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/user" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" hidden name="id" id="idDelete">
                    <input type="text" hidden name="action" value="delete">
                    <span> Bạn có muốn xóa : </span>
                    <span id="nameDelete">  </span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="submit" class="btn btn-primary">Có</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function objdelete(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
