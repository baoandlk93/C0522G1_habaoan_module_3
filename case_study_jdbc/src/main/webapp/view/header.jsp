<%--
  Created by IntelliJ IDEA.
  User: TUF
  Date: 29/08/2022
  Time: 8:48 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<div class="row p-4 bg-primary text-white text-center">
  <div class="col-sm-2">
    <a class="navbar-brand " href="index.jsp">
      <img src="https://beedesign.com.vn/wp-content/uploads/2020/08/thiet-ke-logo-chu-b-brew.png"
           width="128px"
           height="128px">
    </a>
  </div>
  <div class="col-sm-8">
    <p class="card-text">Thời gian không chờ đợi một ai <br> Vì vậy hãy biết tận dụng tối đa thời
      gian vào những điều quan trọng trong cuộc sống !!! </p>
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
    <div class="col-3 ">
      <a class="navbar-brand m-1" href="index.jsp">
        Home
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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