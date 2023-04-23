<%--
  Created by IntelliJ IDEA.
  User: TUF
  Date: 29/08/2022
  Time: 8:48 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<div class="row p-4 bg-primary text-white text-center">
    <div class="col-sm-2">
        <a class="navbar-brand " href="index.jsp">
            <img src="https://furamavietnam.com/wp-content/uploads/2018/10/logo.png"
                 width="128px"
                 height="128px">
        </a>
    </div>
    <div class="col-sm-8">
        <p class="card-text">
            <i class="fa-solid fa-location-dot"></i> 103 – 105 Đường Võ Nguyên Giáp, Phường Khuê Mỹ, Quận Ngũ hành Sơn,
            Tp. Đà Nẵng, Việt Nam
            7.0 km từ Sân bay Quốc tế Đà Nẵng
        </p>
    </div>
    <div class="col-sm-2">
        <div class="card text-dark bg-info ">
            <div class="card-header">C0522G1</div>
            <div class="card-body">
                <h5 class="card-title">Hà Bảo Ân</h5>
            </div>
        </div>
    </div>
</div>
<div class="row  p-0 text-white text-center">
    <nav class="navbar navbar-expand-lg bg-info text-bg-dark">
        <div class="col-3">
            <a class="navbar-brand m-1" href="index.jsp">
                Home
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
        <div class="col-6 collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto ms-5 mb-lg-0">
                <li class="nav-item dropdown m-1 ">
                    <a class="nav-link dropdown-toggle navbar-brand" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        Employee
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/employee">List of Employee</a></li>
                        <li><a class="dropdown-item" href="/employee?action=create">Add new Employee</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown m-1 ">
                    <a class="nav-link dropdown-toggle navbar-brand" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        Customer
                    </a>
                    <ul class="dropdown-menu ">
                        <li><a class="dropdown-item" href="/customer">List of Customers</a></li>
                        <li><a class="dropdown-item" href="/customer?action=create">Add new Customer</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown m-1 ">
                    <a class="nav-link dropdown-toggle navbar-brand" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        Service
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/facility">List of Service</a></li>
                        <li><a class="dropdown-item" href="/facility?action=create">Add new Service</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown m-1 ">
                    <a class="nav-link dropdown-toggle navbar-brand" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        Contract
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/contract">List of Contract</a></li>
                        <li><a class="dropdown-item" href="/contract?action=create">Add new Contract</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown m-1 ">
                    <a class="nav-link dropdown-toggle navbar-brand" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        TestAuthenticate
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="/login?action=admin">Admin</a></li>
                        <li><a class="dropdown-item" href="/login?action=user">User</a></li>
                    </ul>
                </li>
            </ul>
            <form action="/login">
                <input class="btn btn-info" type="submit" value="Login"/>
            </form>

        </div>
        <div class="col-3 navbar-nav me-auto ms-5 mb-lg-0">
            <form>
                <div class="row">
                    <div class="col-9">
                        <input class="form-control " type="text" name="countrySearch" placeholder="Search"
                               aria-label="Search">
                    </div>
                    <div class="col-3">
                        <input class="btn btn-success" type="submit" name="action" value="search">
                    </div>
                </div>
            </form>
        </div>
    </nav>
</div>
