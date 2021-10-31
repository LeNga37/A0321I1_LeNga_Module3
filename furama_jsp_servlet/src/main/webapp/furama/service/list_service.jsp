<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/30/2021
  Time: 12:22 AM
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
    <form action="/furama/service" method="post">
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
    <table id="service" class="table table-striped">
        <thead>
        <tr>
            <th scope="col">service_id</th>
            <th scope="col">service_name</th>
            <th scope="col">service_area</th>
            <th scope="col">service_cost</th>
            <th scope="col">service_max_people</th>
            <th scope="col">rent_type_id</th>
            <th scope="col">service_type_id</th>
            <th scope="col">standard_room</th>
            <th scope="col">description_other_convenience</th>
            <th scope="col">pool_area</th>
            <th scope="col">number_of_floors</th>
<%--            <th scope="col">action</th>--%>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="service" items="${serviceList}">
            <tr>
                <td>${service.serviceId}</td>
                <td>${service.serviceName}</td>
                <td>${service.serviceArea}</td>
                <td>${service.serviceCost}</td>
                <td>${service.serviceMaxPeople}</td>
                <td>
                    <c:if test="${service.rentTypeId == 1}">
                        year
                    </c:if>
                    <c:if test="${service.rentTypeId == 2}">
                        month
                    </c:if>
                    <c:if test="${service.rentTypeId == 3}">
                        day
                    </c:if>
                    <c:if test="${service.rentTypeId == 4}">
                        hour
                    </c:if>
                </td>
                <td>
                    <c:if test="${service.serviceTypeId == 1}">
                        villa
                    </c:if>
                    <c:if test="${service.serviceTypeId == 2}">
                        house
                    </c:if>
                    <c:if test="${service.serviceTypeId == 3}">
                        room
                    </c:if>
                </td>
                <td>${service.standardRoom}</td>
                <td>${service.descriptionConvenience}</td>
                <td>${service.poolArea}</td>
                <td>${service.numberFloor}</td>
<%--                <td>--%>
<%--                    <a href="/furama/customer?action=edit&customerId=${customer.customerId}">Edit</a>--%>
<%--                </td>--%>
<%--                <td>--%>
<%--                    <button type="button" class="btn btn-danger" onclick="setValueForm('${service.serviceId}')" data-toggle="modal" data-target="#modalDelete">--%>
<%--                        Xóa--%>
<%--                    </button>--%>
<%--                </td>--%>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <%--Modal confirm--%>
    <div class="modal fade" id="modalDelete" data-backdrop="static" data-keyboard="false"
         tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form method="post" action="/furama/service?action=delete">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Xác nhận</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input name="serviceId" id = "serviceId" hidden>
                        Bạn muốn xóa dich vu nay này?
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
    <a href="/furama/service?action=create" class="btn btn-warning">Add new service</a>
    <a href="/furama/service" class="btn btn-warning">Back to menu</a>
</div>


<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
<script>
    $(document).ready(function () {
        $('#service').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        })
    })
</script>

<script>
    function setValueForm(serviceId) {
        document.getElementById("serviceId").value = serviceId;
    }
</script>
</body>
</html>