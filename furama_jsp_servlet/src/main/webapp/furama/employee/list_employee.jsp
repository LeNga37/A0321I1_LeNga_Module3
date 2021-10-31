<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/30/2021
  Time: 3:21 PM
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
    <form action="/furama/employee" method="post">
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
    <table id="employee" class="table table-striped">
        <thead>
        <tr>
            <th scope="col">employee_id</th>
            <th scope="col">employee_name</th>
            <th scope="col">employee_birthday</th>
            <th scope="col">employee_id_card</th>
            <th scope="col">employee_salary</th>
            <th scope="col">employee_phone</th>
            <th scope="col">employee_email</th>
            <th scope="col">employee_address</th>
            <th scope="col">positionId</th>
            <th scope="col">educationDegreeId</th>
            <th scope="col">divisionId</th>
            <th scope="col">userName</th>
            <th scope="col">Action</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="employee" items="${employeeList}">
            <tr>
                <td>${employee.employeeId}</td>
                <td>${employee.employeeName}</td>
                <td>${employee.employeeBirthDay}</td>
                <td>${employee.employeeIdCard}</td>
                <td>${employee.employeeSalary}</td>
                <td>${employee.employeePhone}</td>
                <td>${employee.employeeEmail}</td>
                <td>${employee.employeeAddress}</td>
                <td>
                    <c:if test="${employee.positionId == 1}">
                        Le_Tan
                    </c:if>
                    <c:if test="${employee.positionId == 2}">
                        Phuc_Vu
                    </c:if>
                    <c:if test="${employee.positionId == 3}">
                        Chuyen_Vien
                    </c:if>
                    <c:if test="${employee.positionId == 4}">
                        Giam_Sat
                    </c:if>
                    <c:if test="${employee.positionId == 5}">
                        Quan_Ly
                    </c:if>
                    <c:if test="${employee.positionId == 6}">
                        Giam_Doc
                    </c:if>
                </td>
                <td>
                    <c:if test="${employee.educationDegreeId == 1}">
                        Trung_Cap
                    </c:if>
                    <c:if test="${employee.educationDegreeId == 2}">
                        Cao_Dang
                    </c:if>
                    <c:if test="${employee.educationDegreeId == 3}">
                        Dai_Hoc
                    </c:if>
                    <c:if test="${employee.educationDegreeId == 4}">
                        Sau_Dai_Hoc
                    </c:if>
                </td>
                <td>
                    <c:if test="${employee.divisionId == 1}">
                        Sale_Marketing
                    </c:if>
                    <c:if test="${employee.divisionId == 2}">
                        Hanh_Chinh
                    </c:if>
                    <c:if test="${employee.divisionId == 3}">
                        Phuc_Vu
                    </c:if>
                    <c:if test="${employee.divisionId == 4}">
                        Phuc_Vu
                    </c:if>
                </td>
                <td>${employee.userName}</td>
                <td>
                    <a href="/furama/employee?action=edit&employeeId=${employee.employeeId}">Edit</a>
                </td>
                <td>
                    <button type="button" class="btn btn-danger" onclick="setValueForm('${employee.employeeId}')"
                            data-toggle="modal" data-target="#modalDelete">
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
                <form method="post" action="/furama/employee?action=delete">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Xác nhận</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input name="employeeId" id="employeeId" hidden>
                        Bạn muốn xóa nhan vien này?
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
    <a href="/furama/employee?action=create" class="btn btn-warning">Add new employee</a>
    <a href="/furama/employee" class="btn btn-warning">Back to menu</a>
</div>

<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
<script>
    $(document).ready(function () {
        $('#employee').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        })
    })
</script>

<script>
    function setValueForm(employeeId) {
        document.getElementById("employeeId").value = employeeId;
    }
</script>
</body>
</html>