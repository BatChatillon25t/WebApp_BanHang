<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Ban Hang</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="row">
    <div class="col-7">
        <h2>Danh sách hoá đơn</h2>
        <table class="table">
            <thead>
            <tr>
                <td>STT</td>
                <td>ID</td>
                <td>Ten khach hang</td>
                <td>Ngay tao</td>
                <td>Trang Thai</td>
                <td>Chuc nang</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listhd}" var="hd" varStatus="i">
                <tr>
                    <td>${i.index + 1}</td>
                    <td>${hd.id}</td>
                    <td>${hd.idKhachHang.hoTen}</td>
                    <td>${hd.ngayTao}</td>
                    <td>${hd.trangThai}</td>
                    <td>
                        <a href="/ban-hang/view?id=${hd.id}">
                            <button class="btn btn-info">Chon</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
<%--        <div>--%>
<%--            <nav aria-label="Page navigation example" name="pageNo">--%>
<%--                <ul class="pagination">--%>
<%--                    <li class="page-item">--%>
<%--                        <c:if test="${currentPage > 0}">--%>
<%--                            <a class="page-link" href="/ban-hang/view?pageNo=${currentPage - 1}">Previous</a>--%>
<%--                        </c:if>--%>
<%--                    </li>--%>
<%--                    <c:forEach var="i" begin="1" end="${totalPage}">--%>
<%--                        <li class="page-item ${i == currentPage + 1 ? 'active' : ''}">--%>
<%--                            <a class="page-link" href="/ban-hang/view?pageNo=${i - 1}">${i}</a>--%>
<%--                        </li>--%>
<%--                    </c:forEach>--%>
<%--                    <li class="page-item">--%>
<%--                        <c:if test="${currentPage < totalPage - 1}">--%>
<%--                            <a class="page-link" href="/ban-hang/view?pageNo=${currentPage + 1}">Next</a>--%>
<%--                        </c:if>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </nav>--%>
<%--        </div>--%>
        <h2>Danh sách hoá đơn chi tiết</h2>
        <table class="table">
            <thead>
            <tr>
                <td>STT</td>
                <td>ID</td>
                <td>Ten san pham</td>
                <td>So luong</td>
                <td>Gia ban</td>
                <td>Tong tien</td>
                <td>Chuc nang</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach varStatus="i" var="hdct" items="${listhdct}">
                <tr>
                    <td>${i.index +1}</td>
                    <td>${hdct.id}</td>
                    <td>${hdct.idCtsp.idSanPham.tenSP}</td>
                    <td>${hdct.soLuong}</td>
                    <td>${hdct.idCtsp.giaBan}</td>
                    <td>${hdct.tongTien}</td>
                    <td>
                        <a href="/ban-hang/xoaSP?idHDCT=${hdct.id}">
                            <button class="btn btn-danger">DELETE</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-5">
        <h2>Tạo hoá đơn</h2>
        <div class="row">
            <div>
                <form>
                    <form action="/ban-hang/view" method="get">
                        <div>
                            <label class="mb-3 col-3" name="sdt">Ho va ten</label>
                            <input type="text" class="col-7">
                        </div>
                        <button class="btn btn-primary" type="submit">Search</button>
                    </form>
                </form>
            </div>

            <form action="/ban-hang/them-hd" method="post">
                <div class="mb-3">
                    <label class="col-3">Ten Khach hang</label>
                    <input type="text" class="col-7" readonly
                           value="${listtthd[0].idKhachHang.hoTen} ${listkh[0].hoTen}">
                    <input hidden="hidden"
                           value="${listtthd[0].idKhachHang.id} ${listkh[0].id}" name="idKhachHang">
                    <input hidden="hidden"
                           value="${listtthd[0].idKhachHang.diaChi} ${listkh[0].diaChi}" name="diaChi">
                    <input hidden="hidden"
                           value="${listtthd[0].idKhachHang.sdt} ${listkh[0].diaChi}" name="sdt">
                    <p style="color: red">${message}</p>
                </div>
                <div class="mb-3">
                    <label class="col-3">ID Hoa don</label>
                    <input type="text" class="col-7" readonly
                           <c:forEach var="hd" items="${listtthd}">value="${hd.id}"</c:forEach>>
                </div>
                <div class="mb-3">
                    <label class="col-3">Tong tien</label>
                    <input type="text" class="col-7" readonly
                           value="${tongTienHD}">
                </div>

                <div>
                    <button class="btn btn-primary" type="submit">Tạo hoá đơn</button>
                    <a <c:forEach items="${listtthd}"
                                  var="hd"> href="/ban-hang/thanh-toan?idHoaDon=${hd.id}"</c:forEach>>
                        <button class="btn btn-primary" type="button">Thanh toán</button>
                    </a>
                </div>
            </form>
        </div>

    </div>
</div>
<div>
    <h2>Danh sách chi tiết sản phẩm</h2>
    <table class="table">
        <thead>
        <tr>
            <td>STT</td>
            <td>ID CTSP</td>
            <td>Ten san pham</td>
            <td>Mau sac</td>
            <td>Size</td>
            <td>Gia ban</td>
            <td>So luong ton</td>
            <td>Trang Thai</td>
            <td>Chuc nang</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listctsp}" var="ctsp" varStatus="i">
            <tr>
                <td>${i.index + 1}</td>
                <td>${ctsp.id}</td>
                <td>${ctsp.idSanPham.tenSP}</td>
                <td>${ctsp.idMauSac.tenMau}</td>
                <td>${ctsp.idSize.tenSize}</td>
                <td>${ctsp.giaBan}</td>
                <td>${ctsp.soLuongTon}</td>
                <td>${ctsp.trangThai}</td>
                <td>
                    <button class="btn btn-primary" onclick="openModal(${ctsp.id})">Chọn mua</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
        <div id="quantityModal" class="modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Nhập Số Lượng</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form id="quantityForm" action="/ban-hang/them-sp?idSPCT=${listctsp[0].id}" method="GET">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="soLuong">Số Lượng</label>
                                <input type="number" class="form-control" id="soLuong" name="soLuong" required>
                            </div>
                            <input type="hidden" id="idSPCT" name="idSPCT">
                            <input type="hidden" id="idHD" name="idHD" value=${idHD} }>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-primary">Xác nhận</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </table>
</div>
</body>
<script>
    function openModal(idSPCT) {
        document.getElementById('idSPCT').value = idSPCT;
        $('#quantityModal').modal('show');
    }
</script>
</html>