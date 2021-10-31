<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/25/2021
  Time: 7:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List</title>
    <link rel="stylesheet" href="/assert/bootstrap413/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assert/datatables/css/dataTables.bootstrap4.min.css">
</head>
<body>
<div class="container">
    <form action="/furama/customer" method="post">
        <div class="form-group" style="margin-top: 30px">
            <input type="hidden" name="action" value="search">
            <input type="text" class="form-control" id="name" placeholder="Enter name" name="searchName">
        </div>
        <button type="submit" class="btn btn-primary">Search By Name</button>
    </form>
<%--    <form action="furama/customer" method="get">--%>
<%--        <div class="form-group">--%>
<%--            <input type="hidden" name="action" value="sort">--%>
<%--        </div>--%>
<%--        <button type="submit" class="btn btn-primary">Sort By Name</button>--%>
<%--    </form>--%>
    <table id="customer" class="table table-striped">
        <thead>
        <tr>
            <th scope="col">customer_id</th>
            <th scope="col">customer_name</th>
            <th scope="col">customer_birthday</th>
            <th scope="col">customer_gender</th>
            <th scope="col">customer_id_card</th>
            <th scope="col">customer_phone</th>
            <th scope="col">customer_email</th>
            <th scope="col">customer_type_id</th>
            <th scope="col">customer_address</th>
            <th scope="col">action</th>
            <th scope="col">action</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${customerList}">
            <tr>
                <td>${customer.customerId}</td>
                <td>${customer.customerName}</td>
                <td>${customer.customerBirthday}</td>
                <td>
                    <c:if test="${customer.customerGender == 1}">
                        Male
                    </c:if>
                    <c:if test="${customer.customerGender == 0}">
                        Female
                    </c:if>
                </td>
                <td>${customer.customerIdCard}</td>
                <td>${customer.customerPhone}</td>
                <td>${customer.customerEmail}</td>
                <td>
                    <c:if test="${customer.customerTypeId == 1}">
                        Diamond
                    </c:if>
                    <c:if test="${customer.customerTypeId == 2}">
                        Platinum
                    </c:if>
                    <c:if test="${customer.customerTypeId == 3}">
                        Gold
                    </c:if>
                    <c:if test="${customer.customerTypeId == 4}">
                        Silver
                    </c:if>
                    <c:if test="${customer.customerTypeId == 5}">
                        Member
                    </c:if>
                </td>
                <td>${customer.customerAddress}</td>
                <td>
                    <a href="/furama/customer?action=edit&customerId=${customer.customerId}">Edit</a>
                </td>
                <td>
                    <button type="button" class="btn btn-danger" onclick="setValueForm('${customer.customerId}')" data-toggle="modal" data-target="#modalDelete">
                        Xóa
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <%--Modal confirm--%>
    <div class="modal fade" id="modalDelete" data-backdrop="static" data-keyboard="false"
         tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="post" action="/furama/customer?action=delete">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Xác nhận</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input name="customerId" id = "customerId" hidden>
                       Bạn muốn xóa khách hàng này?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-danger">
                            Xóa
<%--                            <a href="/furama/customer?action=delete&id=${customer.customerId}"--%>
<%--                                style="color: white">Delete</a>--%>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <a href="/furama/customer?action=create" class="btn btn-warning">Add new customer</a>
    <a href="/furama/customer" class="btn btn-warning">Back to menu</a>
</div>


<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
<script>
    $(document).ready(function () {
        $('#customer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        })
    })
</script>

<script>
    function setValueForm(customerId) {
        document.getElementById("customerId").value = customerId;
    }
</script>
</body>
</html>
