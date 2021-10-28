<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/25/2021
  Time: 6:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"/>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-8">
            <img src="https://cdn.nhanlucnganhluat.vn/uploads/images/051D288B/logo/2018-12/Logo-FURAMA-RESORT.jpg"
                 class="img-thumbnail" alt="Logo" style="width: 100px;height: 100px">
        </div>
        <div class="col-sm-4">
            <h3>Lê Thị Nga</h3>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="/furama">Home</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/furama/employee">Employee <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="furama/customer">Customer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="furama/service">Service</a>
                    <%--                        <a class="nav-link dropdown-toggle" href="furama/service" id="navbarDropdown" role="button"--%>
                    <%--                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
                    <%--                            Service--%>
                    <%--                        </a>--%>
                    <%--                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">--%>
                    <%--                            <a class="dropdown-item" href="#">Action</a>--%>
                    <%--                            <a class="dropdown-item" href="#">Another action</a>--%>
                    <%--                            <div class="dropdown-divider"></div>--%>
                    <%--                            <a class="dropdown-item" href="#">Something else here</a>--%>
                    <%--                        </div>--%>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="/furama/contract" tabindex="-1" aria-disabled="true">Contract</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
    <div class="row">
        <div class="col-sm-3 border-right">
            <div class="list-group list-group-flush">
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Dashboard</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Shortcuts</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Overview</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Events</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Profile</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">Status</a>
            </div>
        </div>
        <div class="col-sm-9">
            <p>Body</p>
        </div>
    </div>
    <div class="jumbotron text-center" style="margin-bottom:0">
<p>Footer</p>
</div>
</div>
<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
    <script src="/assert/bootstrap413/js/popper.min.js"></script>
    <script src="/assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
</body>
</html>
