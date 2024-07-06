<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<<h2>Danh sách hoá đơn chi tiết</h2>
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
            <td>${hdct.id_ctsp.id_sanPham.tenSP}</td>
            <td>${hdct.soLuong}</td>
            <td>${hdct.id_ctsp.giaBan}</td>
            <td>${hdct.tongTien}</td>
            <td><button class="btn btn-danger">DELETE</button></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>