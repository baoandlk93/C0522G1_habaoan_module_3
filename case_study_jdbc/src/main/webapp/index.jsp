<%--
  Created by IntelliJ IDEA.
  User: TUF
  Date: 26/08/2022
  Time: 9:50 CH
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">


  <!--        <link rel="stylesheet" href="../../../bootstrap-5.2.0-dist/css/bootstrap.css">-->
  <!--        <script src="../../../bootstrap-5.2.0-dist/js/bootstrap.bundle.js"></script>-->
</head>
<body>

<div class="row container-fluid p-4 bg-primary text-white text-center">
  <div class="col-sm-6">
    <a class="navbar-brand " href="#">
      <img src="https://beedesign.com.vn/wp-content/uploads/2020/08/thiet-ke-logo-chu-b-brew.png"
           width="128px"
           height="128px">
    </a>
  </div>
  <div class="col-sm-6">
    <div class="card text-dark bg-info ">
      <div class="card-header">C0522G1</div>
      <div class="card-body">
        <h5 class="card-title">Hà Bảo Ân</h5>
        <p class="card-text">Thời gian không chờ đợi một ai <br> Vì vậy hãy biết tận dụng tối đa thời
          gian vào những điều quan trọng trong cuộc sống !!! </p>
      </div>
    </div>
  </div>
</div>
<div class="row container-fluid p-0 text-white text-center">
  <nav class="navbar navbar-expand-lg bg-info text-bg-dark">
    <div class="col-3 ">
      <a class="navbar-brand m-1" href="#">
        Home
      </a>
    </div>
    <div class="col-6 collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto ms-5 mb-lg-0">
        <li class="nav-item dropdown m-1 ">
          <a class="nav-link dropdown-toggle navbar-brand" href="#" role="button" data-bs-toggle="dropdown"
             aria-expanded="false">
            Employee
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">List of Employee</a></li>
            <li><a class="dropdown-item" href="#">Add new Employee</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown m-1 ">
          <a class="nav-link dropdown-toggle navbar-brand" href="#" role="button" data-bs-toggle="dropdown"
             aria-expanded="false">
            Customer
          </a>
          <ul class="dropdown-menu ">
            <li><a class="dropdown-item" href="#">List of Customers</a></li>
            <li><a class="dropdown-item" href="#">Add new Customer</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown m-1 ">
          <a class="nav-link dropdown-toggle navbar-brand" href="#" role="button" data-bs-toggle="dropdown"
             aria-expanded="false">
            Service
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">List of Service</a></li>
            <li><a class="dropdown-item" href="#">Add new Service</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown m-1 ">
          <a class="nav-link dropdown-toggle navbar-brand" href="#" role="button" data-bs-toggle="dropdown"
             aria-expanded="false">
            Contract
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">List of Contract</a></li>
            <li><a class="dropdown-item" href="#">Add new Contract</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <div class="col-3 container-fluid">
      <form>
        <input class="form-control m-1" type="text" name="countrySearch" placeholder="Search"
               aria-label="Search">
        <input class="btn btn-success" type="submit" name="action" value="search">
      </form>
    </div>
  </nav>
</div>

<div class="row container-fluid">
  <div class="col-sm-4">
    <h2>About Me</h2>
    <h5>Photo of me:</h5>
    <div class="fakeimg">Fake Image</div>
    <p>Some text about me in culpa qui officia deserunt mollit anim..</p>
    <h3 class="mt-4">Some Links</h3>
    <p>Lorem ipsum dolor sit ame.</p>
    <ul class="nav nav-pills flex-column">
      <li class="nav-item">
        <a class="nav-link active" href="#">Active</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <hr class="d-sm-none">
  </div>
  <div class="col-sm-8">

    <h2 class="mt-5">TITLE HEADING</h2>
    <h5>Title description, Sep 2, 2020</h5>
    <div class="fakeimg">Fake Image</div>
    <p>Some text..</p>
    <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
      ullamco.</p>
  </div>
</div>
<div class="row container-fluid">
  <p style="text-align: center;background-color: #7abaff">
    Design By Hà Bảo Ân
  </p>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
