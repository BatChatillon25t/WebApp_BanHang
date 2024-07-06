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
<table border="2">
    <thead>
    <tr>
        <td>STT</td>
        <td>id</td>
        <td>Ho Ten</td>
        <td>luong</td>
        <td>Gioi Tinh</td>
        <td>Phong Ban</td>
        <td>Trang Thai</td>
        <td>Action</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="hd" varStatus="i">
        <tr>
            <td>${i.index + 1}</td>
            <td>${hd.id}</td>
            <td>${hd.id_khachHang}</td>
            <td>${hd.trangThai}</td>
            <td>${hd.ngayTao}</td>
            <td>${hd.ngaySua}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>