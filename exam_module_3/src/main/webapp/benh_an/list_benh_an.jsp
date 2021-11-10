<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 10/31/2021
  Time: 11:50 AM
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
    <h3>Danh sách bệnh án</h3>
    <table id="benhAn" class="table table-striped" border="1px">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Mã bệnh án</th>
            <th scope="col">Mã bệnh nhân</th>
            <th scope="col">Tên bệnh nhân</th>
            <th scope="col">Ngày nhập viện</th>
            <th scope="col">Ngày ra viện</th>
            <th scope="col">Lý do nhập viện</th>
            <th scope="col">Tác vụ</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="benhAn" items="${benhAnList}" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${benhAn.idBenhAn}</td>
                <td>${benhAn.idBenhNhan}</td>
                <td>${benhAn.tenBenhNhan}</td>
                <td>${benhAn.ngayNhapVien}</td>
                <td>${benhAn.ngayRaVien}</td>
                <td>${benhAn.lyDoNhapVien}</td>
                <td>
                    <a href="/benhan?action=edit&idBenhAn=${benhAn.idBenhAn}"><img
                            src="https://cdn.iconscout.com/icon/free/png-256/pencil-1306-1163095.png"
                            style="width: 35px;height: 35px" class="rounded" alt="..."></a>
                    <button type="button" onclick="setValueForm('${benhAn.idBenhAn}')"
                            data-toggle="modal" data-target="#modalDelete">
                        <img src="https://banner2.cleanpng.com/20191230/weo/transparent-trash-icon-bin-icon-pollution-icon-5e0a20e261c162.5470446815777220824004.jpg"
                             style="width: 35px;height: 35px" class="rounded" alt="...">
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
                <form method="post" action="/benhan?action=delete">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Xác nhận</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input name="idBenhAn" id="idBenhAn" hidden>
                        <p>Bạn muốn xóa thông tin bệnh án hay không?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
                        <button type="submit" class="btn btn-danger">
                            Có
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="/assert/jquery/jquery-3.5.1.min.js"></script>
<script src="/assert/bootstrap413/js/popper.min.js"></script>
<script src="/assert/datatables/js/jquery.dataTables.min.js"></script>
<script src="/assert/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.min.js"></script>
<script src="/assert/bootstrap413/js/bootstrap.bundle.js"></script>
<script>
    $(document).ready(function () {
        $('#benhAn').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        })
    })
</script>

<script>
    function setValueForm(idBenhAn) {
        document.getElementById("idBenhAn").value = idBenhAn;
    }
</script>
</body>
</html>
