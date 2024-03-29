<%--
  Created by IntelliJ IDEA.
  User: DELL5577
  Date: 03/09/2022
  Time: 7:10 CH
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
<head>

    <title>Furama</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
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


<div class="container-fluid">
    <div class="row">
        <jsp:include page="/view/header.jsp"/>
    </div>


    <div class="row ">
<%--        <div class="col-sm-3">--%>

<%--        </div>--%>


        <div class="col-sm-12">


            <div style="text-align: center">
                <table id="tableContract" class="table table-striped table-bordered border border-3 border-secondary">
                    <thead>
                    <tr class="text-center bg-info">
                        <th>STT</th>
                        <th>Dịch vụ</th>
                        <th>Khách hàng</th>
                        <th>Nhân viên</th>
                        <th>Ngày bắt đầu</th>
                        <th>Ngày kết thúc</th>
                        <th>Tiền đặt cọc</th>
                        <th>Tổng tiền</th>
                        <th></th>
                        <th>các dịch vụ đi kèm</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach varStatus="status" var="contract" items="${contracts}">
                        <tr>
                            <td>${status.count}</td>
                            <td>
                                <c:forEach var="facility" items="${facility}">
                                    <c:if test="${facility.id==contract.facilityID}">
                                        <a data-bs-toggle="modal" data-bs-target="#infoFacility" href="#">
                                                ${facility.name}
                                        </a>
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>
                                <c:forEach var="customer" items="${customers}">
                                    <c:if test="${customer.id==contract.customerID}">
                                        <a data-bs-toggle="modal" data-bs-target="#infoCustomer" href="#">
                                                ${customer.name}
                                        </a>
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>
                                <c:forEach var="employee" items="${employees}">
                                    <c:if test="${employee.id==contract.employeeID}">
                                        <a data-bs-toggle="modal" data-bs-target="#infoEmployee" href="#">
                                                ${employee.name}
                                        </a>
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>${contract.startDay}</td>
                            <td>${contract.endDay}</td>
                            <td>
                                <fmt:formatNumber type="number" value="${contract.deposit}" groupingUsed="false" />
                            </td>
                            <td>
                                <fmt:formatNumber type="number" value="${contract.deposit}" groupingUsed="false" />
                            </td>
                            <td>
                                <a href="#">
                                    <button type="button" class="btn btn-primary">+</button>
                                </a>
                            </td>
                            <td>
                                <button type="button"
                                        class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    Danh sách các dịch vụ đi kèm
                                </button>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>

    </div>
    <div class="row">
        <%@include file="/view/footer.jsp" %>
    </div>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
<div class="modal" style="margin-top: 1%" id="infoFacility" tabindex="-1" aria-labelledby="infoFacilityLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="infoFacilityLabel" style="color: #4267b2">Thông Tin Cơ sở dịch vụ : <span
                        style="color: rebeccapurple" id="nameFacility"></span></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table id="facilityTableModal" border="1" class="table table-striped">

                    <tr>
                        <td>Diện tích:</td>
                        <td><span id="areaFacility"></span></td>
                    </tr>
                    <tr>
                        <td>Phí thuê:</td>
                        <td><span id="costFacility"></span></td>
                    </tr>
                    <tr>
                        <td>Số người tối đa:</td>
                        <td><span id="maxPeopleFacility"></span></td>
                    </tr>
                    <tr>
                        <td>Kiểu thuê:</td>
                        <td><span id="rentTypeFacility"></span></td>
                    </tr>

                    <tr>
                        <td>Kiểu dịch vụ:</td>
                        <td><span id="facilityType"></span></td>
                    </tr>
                    <tr>

                        <td>Tiêu chuẩn phòng:</td>
                        <td><span id="standardRoomFacility"></span></td>
                    </tr>
                    <tr>
                        <td>Mô tả khác:</td>
                        <td><span id="descriptionFacility"></span></td>
                    </tr>
                    <tr>
                        <td>Diện tích hồ bơi:</td>
                        <td><span id="poolAreaFacility"></span></td>
                    </tr>
                    <tr>
                        <td>Số tầng:</td>
                        <td><span id="numberOfFloorsFacility"></span></td>
                    </tr>
                    <tr>
                        <td>Dịch vụ miễn phí:</td>
                        <td><span id="freeFacility"></span></td>
                    </tr>
                </table>

            </div>

        </div>

    </div>
</div>

<div class="modal" style="margin-top: 10%" id="infoCustomer" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="infoCustomerLabel" style="color: #4267b2">Thông Tin Khách Hàng : <span
                        style="color: rebeccapurple" id="nameCustomer"></span></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table border="1" class="table table-striped">
                    <tr>
                        <td>Giới tính:</td>
                        <td><span id="genderCustomer"></span></td>
                    </tr>
                    <tr>
                        <td>Ngày sinh:</td>
                        <td><span id="dateOfBirthCustomer"></span></td>
                    </tr>
                    <tr>
                        <td>Số CMND:</td>
                        <td><span id="idCardCustomer"></span></td>
                    </tr>
                    <tr>
                        <td>Số điện thoại:</td>
                        <td><span id="phoneNumberCustomer"></span></td>
                    </tr>

                    <tr>
                        <td>Loại khách hàng:</td>
                        <td><span id="customerType"></span></td>
                    </tr>
                    <tr>

                        <td>Email:</td>
                        <td><span id="emailCustomer"></span></td>
                    </tr>
                    <tr>
                        <td>Địa chỉ:</td>
                        <td><span id="addressCustomer"></span></td>
                    </tr>
                </table>

            </div>

        </div>

    </div>
</div>

<div class="modal" style="margin-top: 1%" id="infoEmployee" tabindex="-1" aria-labelledby="infoEmployeeLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="infoEmployeeLabel" style="color: #4267b2">Thông Tin Nhân Viên : <span
                        style="color: rebeccapurple" id="nameEmployee"></span></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table border="1" class="table table-striped">
                    <tr>
                        <td>Giới tính:</td>
                        <td><span id="genderEmployee"></span></td>
                    </tr>
                    <tr>
                        <td>Ngày sinh:</td>
                        <td><span id="dateOfBirthEmployee"></span></td>
                    </tr>
                    <tr>
                        <td>Số CMND:</td>
                        <td><span id="idCardEmployee"></span></td>
                    </tr>
                    <tr>
                        <td>Số điện thoại:</td>
                        <td><span id="phoneNumberEmployee"></span></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><span id="emailEmployee"></span></td>
                    </tr>
                    <tr>
                        <td>Địa chỉ:</td>
                        <td><span id="addressEmployee"></span></td>
                    </tr>
                    <tr>
                        <td>Trình độ:</td>
                        <td><span id="degreeEmployee"></span></td>
                    </tr>
                    <tr>
                        <td>Vị trí:</td>
                        <td><span id="positionEmployee"></span></td>
                    </tr>
                    <tr>
                        <td>Bộ phận:</td>
                        <td><span id="divisionEmployee"></span></td>
                    </tr>
                    <tr>
                        <td>Lương:</td>
                        <td><span id="salaryEmployee"></span></td>
                    </tr>
                    <tr>
                        <td>Tài khoản:</td>
                        <td><span id="userNameEmployee"></span></td>
                    </tr>
                </table>

            </div>

        </div>

    </div>
</div>
</body>
<script>
    function infoFacility(facility) {
        let info = facility.split("@@");
        document.getElementById("facilityType").innerText = info[0];
        document.getElementById("nameFacility").innerHTML = info[2];
        /* getFacilityType().getName(),getIDFacility(),getNameFacility(),getLeasedArea(),
                getRentalCosts(),getMaxPerson(),getRentalType().getName(),
                getDescription(),getRoom(),getFloor(),getAreaPool(),"null"*/
        document.getElementById("areaFacility").innerHTML = info[3];
        document.getElementById("costFacility").innerHTML = info[4];
        document.getElementById("maxPeopleFacility").innerHTML = info[5];
        document.getElementById("rentTypeFacility").innerText = info[6];
        document.getElementById("descriptionFacility").innerHTML = info[7];
        document.getElementById("standardRoomFacility").innerHTML = info[8];
        document.getElementById("numberOfFloorsFacility").innerHTML = info[9];
        document.getElementById("poolAreaFacility").innerHTML = info[10];
        document.getElementById("freeFacility").innerHTML = info[11];
    }
    function infoCustomer(customer) {
        let info = customer.split("@@");
        document.getElementById("nameCustomer").innerText = info[0];
        let gender = info[3];
        let gt;
        if (gender == "true") {
            gt = "Nam";
        } else {
            gt = "Nữ";
        }
        document.getElementById("genderCustomer").innerHTML = gt;
        /* getName(), getIDCitizen(),dateString,
                isSex(), getPhone(), getEmail(), getAddress(), iDCustomer, customerType.getName());*/
        document.getElementById("dateOfBirthCustomer").innerHTML = info[2];
        document.getElementById("idCardCustomer").innerHTML = info[1];
        document.getElementById("phoneNumberCustomer").innerHTML = info[4];
        document.getElementById("customerType").innerText = info[8];
        document.getElementById("emailCustomer").innerHTML = info[5];
        document.getElementById("addressCustomer").innerHTML = info[6];
    }
    function infoEmployee(employee) {
        let info = employee.split("@@");
        document.getElementById("nameEmployee").innerText = info[0];
        let gender = info[3];
        let gt;
        if (gender == "true") {
            gt = "Nam";
        } else {
            gt = "Nữ";
        }
        document.getElementById("genderEmployee").innerHTML = gt;
        /* getName(), getIDCitizen(),dateString,
                isSex(), getPhone(), getEmail(), getAddress(), iDEmployee,
                 degree.getName(),position.getName(),division.getName(), salary, userName;*/
        document.getElementById("dateOfBirthEmployee").innerHTML = info[2];
        document.getElementById("idCardEmployee").innerHTML = info[1];
        document.getElementById("phoneNumberEmployee").innerHTML = info[4];
        document.getElementById("emailEmployee").innerHTML = info[5];
        document.getElementById("addressEmployee").innerHTML = info[6];
        document.getElementById("degreeEmployee").innerHTML = info[8];
        document.getElementById("positionEmployee").innerHTML = info[9];
        document.getElementById("divisionEmployee").innerHTML = info[10];
        document.getElementById("salaryEmployee").innerHTML = info[11];
        document.getElementById("userNameEmployee").innerHTML = info[12];
    }
</script>
</html>