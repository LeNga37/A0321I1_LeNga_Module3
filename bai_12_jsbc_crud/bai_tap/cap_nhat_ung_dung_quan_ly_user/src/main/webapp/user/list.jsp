<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/19/2021
  Time: 9:30 PM
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
    <form action="/user" method="get">
        <div class="form-group" style="margin-top: 30px">
            <input type="hidden" name="action" value="search">
            <input type="text" class="form-control" id="country" placeholder="Enter country" name="searchCountry">
        </div>
        <button type="submit" class="btn btn-primary">Search By Country</button>
        <%--        <button type="submit" class="btn btn-primary"><a href="/user?action=search" style="color: white">Search By Country</a></button>--%>
    </form>
    <form action="/user" method="get">
        <div class="form-group">
            <input type="hidden" name="action" value="sort">
        </div>
        <button type="submit" class="btn btn-primary">Sort By Name</button>
    </form>
    <table id="user" class="table table-striped">
        <thead>
        <tr>
            <th scope="col">User ID</th>
            <th scope="col">User Name</th>
            <th scope="col">Email</th>
            <th scope="col">Country</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
                <td>
                    <a href="/user?action=edit&id=${user.id}">Edit</a>
                </td>
                <td>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
                        Delete
                    </button>
                    <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false"
                         tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">Confirm</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p>Bạn muốn xóa user này?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary">Delete
                                    </button>
<%--                                    <a href="/user?action=delete&id=${user.id}" style="color: white">Delete</a>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/user?action=create" class="btn btn-warning">Add new user</a>
    <a href="/user" class="btn btn-warning">Back to menu</a>
</div>

<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
<script>
    $(document).ready(function () {
        $('#user').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 10
        })
    })
</script>
</body>
</html>
